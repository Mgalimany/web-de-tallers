export type Workshop = {
  id: string;
  name: string;
  slug: string;
  addressLine: string;
  municipality: string;
  province: string;
  latitude: number;
  longitude: number;
  distanceKm: number;
  hourlyRateEur: number | null;
  verified: boolean;
  dgtLibroTaller: boolean;
  reviewCount: number;
  avgOverallScore: number | null;
  bayesianScore: number | null;
  brandMatch: boolean;
  services: string[];
  features: string[];
  description?: string;
  phone?: string;
  website?: string;
  openingHours?: string[];
  scoreBreakdown?: {
    service: number;
    treatment: number;
    knowledge: number;
    priceValue: number;
    wouldReturn: number;
  };
  images?: string[];
};

export type SearchFilters = {
  location: string;
  lat: number;
  lng: number;
  makeId: string;
  serviceCode: string;
  radiusKm: string;
  maxHourlyRate: string;
  minScore: string;
  onlyVerified: boolean;
  onlyDgtLibroTaller: boolean;
};

export type VehicleDraft = {
  makeId?: string;
  modelId?: string;
  make: string;
  model: string;
  year: string;
  fuelType: string;
};

export type VehicleMakeOption = {
  id: string;
  name: string;
  slug: string;
};

export type VehicleModelOption = {
  id: string;
  makeId: string;
  name: string;
  slug: string;
  vehicleType: string;
};
