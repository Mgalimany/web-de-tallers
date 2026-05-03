import type { Workshop } from "./types";

export const vehicleMakes = [
  { id: "1", name: "Audi", slug: "audi" },
  { id: "2", name: "BMW", slug: "bmw" },
  { id: "3", name: "Cupra", slug: "cupra" },
  { id: "4", name: "Mercedes-Benz", slug: "mercedes-benz" },
  { id: "5", name: "Peugeot", slug: "peugeot" },
  { id: "6", name: "Renault", slug: "renault" },
  { id: "7", name: "Seat", slug: "seat" },
  { id: "8", name: "Tesla", slug: "tesla" },
  { id: "9", name: "Toyota", slug: "toyota" },
  { id: "10", name: "Volkswagen", slug: "volkswagen" }
];

export const serviceOptions = [
  { code: "diagnostics", label: "Diagnosi" },
  { code: "maintenance", label: "Manteniment" },
  { code: "mechanical_repair", label: "Mecanica" },
  { code: "bodywork_paint", label: "Planxa i pintura" },
  { code: "tyres", label: "Pneumatics" },
  { code: "electric_hybrid", label: "Electric i hybrid" }
];

export const workshops: Workshop[] = [
  {
    id: "bcn-01",
    name: "Motor Clot Specialist",
    slug: "motor-clot-specialist",
    addressLine: "Carrer de Mallorca, 612",
    municipality: "Barcelona",
    province: "Barcelona",
    latitude: 41.4104,
    longitude: 2.1846,
    distanceKm: 2.4,
    hourlyRateEur: 58,
    verified: true,
    dgtLibroTaller: true,
    reviewCount: 186,
    avgOverallScore: 8.9,
    bayesianScore: 8.7,
    brandMatch: true,
    services: ["Diagnosi", "Manteniment", "Electric i hybrid"],
    features: ["Cita online", "Garantia", "Cotxe de substitucio"],
    description:
      "Taller multimarca amb focus en diagnosi electronica, manteniment premium i vehicles electrificats.",
    phone: "+34 930 000 112",
    website: "https://example.com/motor-clot",
    openingHours: ["Dl-Dv 08:00-19:00", "Ds 09:00-13:30"],
    scoreBreakdown: {
      service: 9.1,
      treatment: 9.3,
      knowledge: 8.8,
      priceValue: 8.1,
      wouldReturn: 9.0
    }
  },
  {
    id: "mad-01",
    name: "Centro Tecnico Chamberi",
    slug: "centro-tecnico-chamberi",
    addressLine: "Calle de Bravo Murillo, 97",
    municipality: "Madrid",
    province: "Madrid",
    latitude: 40.4469,
    longitude: -3.7047,
    distanceKm: 4.8,
    hourlyRateEur: 64,
    verified: true,
    dgtLibroTaller: false,
    reviewCount: 94,
    avgOverallScore: 8.4,
    bayesianScore: 8.2,
    brandMatch: true,
    services: ["Mecanica", "Frens", "Pneumatics"],
    features: ["Recollida", "Asseguradores"],
    description:
      "Centre tecnic urba per manteniment rapid, frens, pneumatiques i reparacions de mecanica general.",
    phone: "+34 910 000 224",
    website: "https://example.com/chamberi",
    openingHours: ["Dl-Dv 08:30-18:30"],
    scoreBreakdown: {
      service: 8.5,
      treatment: 8.7,
      knowledge: 8.2,
      priceValue: 7.8,
      wouldReturn: 8.6
    }
  },
  {
    id: "val-01",
    name: "AutoHybrid Valencia",
    slug: "autohybrid-valencia",
    addressLine: "Avinguda del Cid, 84",
    municipality: "Valencia",
    province: "Valencia",
    latitude: 39.4699,
    longitude: -0.4091,
    distanceKm: 6.2,
    hourlyRateEur: 52,
    verified: false,
    dgtLibroTaller: false,
    reviewCount: 42,
    avgOverallScore: 8.1,
    bayesianScore: 7.8,
    brandMatch: false,
    services: ["Electric i hybrid", "Diagnosi", "Manteniment"],
    features: ["Cita online", "Financament"],
    description:
      "Especialistes en sistemes hybrids i electrics amb pressupost previ i seguiment digital de reparacions.",
    phone: "+34 960 000 336",
    website: "https://example.com/autohybrid",
    openingHours: ["Dl-Dv 09:00-19:00"],
    scoreBreakdown: {
      service: 8.0,
      treatment: 8.4,
      knowledge: 8.7,
      priceValue: 7.3,
      wouldReturn: 8.1
    }
  },
  {
    id: "sev-01",
    name: "Taller Sur Fleet",
    slug: "taller-sur-fleet",
    addressLine: "Avenida de Kansas City, 21",
    municipality: "Sevilla",
    province: "Sevilla",
    latitude: 37.3913,
    longitude: -5.9744,
    distanceKm: 8.7,
    hourlyRateEur: 47,
    verified: true,
    dgtLibroTaller: true,
    reviewCount: 128,
    avgOverallScore: 8.6,
    bayesianScore: 8.4,
    brandMatch: false,
    services: ["Flotes", "Mecanica", "Pre-ITV"],
    features: ["Grua", "Mateix dia", "Garantia"],
    description:
      "Taller orientat a flotes, vehicles professionals i serveis de manteniment amb assistencia en carretera.",
    phone: "+34 955 000 448",
    website: "https://example.com/taller-sur",
    openingHours: ["Dl-Dv 07:30-20:00", "Ds 08:00-14:00"],
    scoreBreakdown: {
      service: 8.6,
      treatment: 8.2,
      knowledge: 8.5,
      priceValue: 8.8,
      wouldReturn: 8.7
    }
  }
];

export function getWorkshopBySlug(slug: string) {
  return workshops.find((workshop) => workshop.slug === slug);
}
