import { workshops as mockWorkshops } from "./mock-data";
import { hasSupabaseConfig, supabase } from "./supabase";
import type { SearchFilters, Workshop } from "./types";

type SearchWorkshopRow = {
  id: string;
  name: string;
  slug: string;
  address_line: string | null;
  municipality: string | null;
  province: string | null;
  latitude: number;
  longitude: number;
  distance_m: number;
  hourly_rate_eur: number | null;
  verified: boolean;
  dgt_libro_taller: boolean;
  review_count: number;
  avg_overall_score: number | null;
  bayesian_score: number | null;
  brand_match: boolean;
};

export async function searchWorkshops(filters: SearchFilters): Promise<Workshop[]> {
  if (!hasSupabaseConfig || !supabase) {
    return filterMockWorkshops(filters);
  }

  const { data, error } = await supabase.rpc("search_workshops", {
    p_lat: filters.lat,
    p_lng: filters.lng,
    p_radius_m: Number(filters.radiusKm || 25) * 1000,
    p_make_id: filters.makeId ? Number(filters.makeId) : null,
    p_service_code: filters.serviceCode || null,
    p_max_hourly_rate_eur: filters.maxHourlyRate
      ? Number(filters.maxHourlyRate)
      : null,
    p_min_bayesian_score: filters.minScore ? Number(filters.minScore) : null,
    p_only_verified: filters.onlyVerified,
    p_only_dgt_libro_taller: filters.onlyDgtLibroTaller,
    p_limit: 5000,
    p_offset: 0
  });

  if (error) {
    console.error("search_workshops failed", error);
    return filterMockWorkshops(filters);
  }

  return ((data ?? []) as SearchWorkshopRow[]).map((row) => ({
    id: row.id,
    name: row.name,
    slug: row.slug,
    addressLine: row.address_line ?? "",
    municipality: row.municipality ?? "",
    province: row.province ?? "",
    latitude: row.latitude,
    longitude: row.longitude,
    distanceKm: Math.round((row.distance_m / 1000) * 10) / 10,
    hourlyRateEur: row.hourly_rate_eur,
    verified: row.verified,
    dgtLibroTaller: row.dgt_libro_taller,
    reviewCount: row.review_count,
    avgOverallScore: row.avg_overall_score,
    bayesianScore: row.bayesian_score,
    brandMatch: row.brand_match,
    services: [],
    features: []
  }));
}

export async function getWorkshopBySlug(slug: string): Promise<Workshop | null> {
  if (!hasSupabaseConfig || !supabase) {
    return mockWorkshops.find((w) => w.slug === slug) || null;
  }

  const { data, error } = await supabase
    .from("workshops")
    .select(`
      *,
      stats:workshop_review_stats(*),
      images:workshop_images(url),
      services:workshop_services(
        category:service_categories(code, name_ca)
      )
    `)
    .eq("slug", slug)
    .single();

  if (error || !data) {
    console.error("getWorkshopBySlug failed", error);
    return null;
  }

  const stats = data.stats?.[0] || data.stats; // Depending on single/plural join
  const services = (data.services || []).map((s: any) => s.category?.name_ca).filter(Boolean);

  return {
    id: data.id,
    name: data.name,
    slug: data.slug,
    description: data.description || "",
    addressLine: data.address_line || "",
    municipality: data.municipality || "",
    province: data.province || "",
    latitude: data.location.coordinates[1],
    longitude: data.location.coordinates[0],
    distanceKm: 0, // Detail page doesn't calculate distance unless we pass userPos
    hourlyRateEur: data.hourly_rate_eur,
    verified: data.verified,
    dgtLibroTaller: data.dgt_libro_taller,
    reviewCount: stats?.review_count || 0,
    avgOverallScore: stats?.avg_overall_score || 0,
    bayesianScore: stats?.bayesian_score || 0,
    brandMatch: false,
    services,
    images: (data.images || []).map((img: any) => img.url),
    features: [],
    phone: data.phone,
    website: data.website,
    openingHours: data.opening_hours ? Object.values(data.opening_hours as any) : [],
    scoreBreakdown: stats ? {
      service: stats.avg_service || 0,
      treatment: stats.avg_treatment || 0,
      knowledge: stats.avg_knowledge || 0,
      priceValue: stats.avg_price_value || 0,
      wouldReturn: stats.avg_would_return || 0
    } : undefined
  };
}

export async function getWorkshopReviews(workshopId: string) {
  if (!hasSupabaseConfig || !supabase) {
    return [];
  }

  const { data, error } = await supabase
    .from("reviews")
    .select(`
      *,
      user:profiles(full_name, avatar_url),
      vehicle:user_vehicles(
        make:vehicle_makes(name),
        model:vehicle_models(name)
      )
    `)
    .eq("workshop_id", workshopId)
    .eq("status", "published")
    .order("created_at", { ascending: false });

  if (error) {
    console.error("getWorkshopReviews failed", error);
    return [];
  }

  return data.map((r: any) => ({
    id: r.id,
    userName: r.user?.full_name || "Usuari anònim",
    overallScore: r.overall_score,
    comment: r.comment,
    createdAt: r.created_at,
    vehicleName: r.vehicle ? `${r.vehicle.make?.name} ${r.vehicle.model?.name}` : null,
    scoreBreakdown: {
      service: r.score_service,
      treatment: r.score_treatment,
      knowledge: r.score_knowledge,
      priceValue: r.score_price_value,
      wouldReturn: r.score_would_return
    }
  }));
}

export async function submitReview(workshopId: string, reviewData: any) {
  if (!hasSupabaseConfig || !supabase) {
    throw new Error("Supabase is not configured");
  }

  const { data: userData } = await supabase.auth.getUser();
  if (!userData.user) throw new Error("No authenticated user");

  const { error } = await supabase.from("reviews").insert({
    workshop_id: workshopId,
    user_id: userData.user.id,
    ...reviewData,
    status: "published" // Auto-publish for MVP
  });

  if (error) {
    console.error("submitReview failed", error);
    throw error;
  }

  return true;
}

function filterMockWorkshops(filters: SearchFilters): Workshop[] {
  return mockWorkshops
    .filter((workshop) => {
      if (filters.onlyVerified && !workshop.verified) {
        return false;
      }

      if (
        filters.maxHourlyRate &&
        workshop.hourlyRateEur &&
        workshop.hourlyRateEur > Number(filters.maxHourlyRate)
      ) {
        return false;
      }

      if (
        filters.minScore &&
        (workshop.bayesianScore ?? 0) < Number(filters.minScore)
      ) {
        return false;
      }

      if (
        filters.serviceCode &&
        !workshop.services.some((service) =>
          service.toLowerCase().includes(labelFromService(filters.serviceCode))
        )
      ) {
        return false;
      }

      return true;
    })
    .sort((a, b) => {
      if (a.brandMatch !== b.brandMatch) {
        return a.brandMatch ? -1 : 1;
      }

      return (b.bayesianScore ?? 0) - (a.bayesianScore ?? 0);
    });
}

function labelFromService(serviceCode: string) {
  const labels: Record<string, string> = {
    diagnostics: "diagnosi",
    maintenance: "manteniment",
    mechanical_repair: "mecanica",
    bodywork_paint: "planxa",
    tyres: "pneumatics",
    electric_hybrid: "electric"
  };

  return labels[serviceCode] ?? serviceCode;
}
