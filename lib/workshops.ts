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
