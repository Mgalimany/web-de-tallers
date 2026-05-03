import { vehicleMakes as fallbackMakes } from "./mock-data";
import { hasSupabaseConfig, supabase } from "./supabase";
import type { VehicleMakeOption, VehicleModelOption } from "./types";

type VehicleMakeRow = {
  id: number;
  name: string;
  slug: string;
};

type VehicleModelRow = {
  id: number;
  make_id: number;
  name: string;
  slug: string;
  vehicle_type: string;
};

export async function fetchVehicleMakes(): Promise<VehicleMakeOption[]> {
  if (!hasSupabaseConfig || !supabase) {
    return fallbackMakes;
  }

  const { data, error } = await supabase
    .from("vehicle_makes")
    .select("id,name,slug")
    .eq("active", true)
    .order("display_order", { ascending: true })
    .order("name", { ascending: true });

  if (error) {
    console.error("vehicle_makes failed", error);
    return fallbackMakes;
  }

  return ((data ?? []) as VehicleMakeRow[]).map((make) => ({
    id: String(make.id),
    name: make.name,
    slug: make.slug
  }));
}

export async function fetchVehicleModels(
  makeId: string,
): Promise<VehicleModelOption[]> {
  if (!makeId || !hasSupabaseConfig || !supabase) {
    return [];
  }

  const { data, error } = await supabase
    .from("vehicle_models")
    .select("id,make_id,name,slug,vehicle_type")
    .eq("make_id", Number(makeId))
    .eq("active", true)
    .order("name", { ascending: true })
    .limit(400);

  if (error) {
    console.error("vehicle_models failed", error);
    return [];
  }

  return ((data ?? []) as VehicleModelRow[]).map((model) => ({
    id: String(model.id),
    makeId: String(model.make_id),
    name: model.name,
    slug: model.slug,
    vehicleType: model.vehicle_type
  }));
}
