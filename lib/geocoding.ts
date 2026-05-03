export type GeocodedPlace = {
  label: string;
  lat: number;
  lng: number;
};

type NominatimResult = {
  display_name: string;
  lat: string;
  lon: string;
};

const knownPlaces: Record<string, GeocodedPlace> = {
  barcelona: { label: "Barcelona", lat: 41.3874, lng: 2.1686 },
  madrid: { label: "Madrid", lat: 40.4168, lng: -3.7038 },
  valencia: { label: "Valencia", lat: 39.4699, lng: -0.3763 },
  sevilla: { label: "Sevilla", lat: 37.3891, lng: -5.9845 },
  zaragoza: { label: "Zaragoza", lat: 41.6488, lng: -0.8891 },
  malaga: { label: "Malaga", lat: 36.7213, lng: -4.4214 },
  murcia: { label: "Murcia", lat: 37.9922, lng: -1.1307 },
  palma: { label: "Palma", lat: 39.5696, lng: 2.6502 },
  bilbao: { label: "Bilbao", lat: 43.263, lng: -2.935 },
  alicante: { label: "Alicante", lat: 38.3452, lng: -0.481 },
  cordoba: { label: "Cordoba", lat: 37.8882, lng: -4.7794 },
  valladolid: { label: "Valladolid", lat: 41.6523, lng: -4.7245 },
  vigo: { label: "Vigo", lat: 42.2406, lng: -8.7207 },
  gijon: { label: "Gijon", lat: 43.5322, lng: -5.6611 },
  "a coruna": { label: "A Coruna", lat: 43.3623, lng: -8.4115 },
  granada: { label: "Granada", lat: 37.1773, lng: -3.5986 },
  girona: { label: "Girona", lat: 41.9794, lng: 2.8214 },
  tarragona: { label: "Tarragona", lat: 41.1189, lng: 1.2445 },
  lleida: { label: "Lleida", lat: 41.6176, lng: 0.62 }
};

export async function geocodeSpanishPlace(query: string): Promise<GeocodedPlace> {
  const normalized = normalizePlace(query);

  if (!normalized || normalized === "la meva posicio") {
    throw new Error("Escriu una localitat per buscar.");
  }

  const knownPlace = knownPlaces[normalized];
  if (knownPlace) {
    return knownPlace;
  }

  const params = new URLSearchParams({
    format: "jsonv2",
    q: `${query}, España`,
    countrycodes: "es",
    limit: "1",
    addressdetails: "1"
  });
  const response = await fetch(
    `https://nominatim.openstreetmap.org/search?${params.toString()}`,
    {
      headers: {
        Accept: "application/json"
      }
    }
  );

  if (!response.ok) {
    throw new Error("No hem pogut geocodificar aquesta localitat.");
  }

  const results = (await response.json()) as NominatimResult[];
  const firstResult = results[0];

  if (!firstResult) {
    throw new Error("No hem trobat aquesta localitat a Espanya.");
  }

  return {
    label: firstResult.display_name.split(",")[0] || query,
    lat: Number(firstResult.lat),
    lng: Number(firstResult.lon)
  };
}

function normalizePlace(value: string) {
  return value
    .trim()
    .toLowerCase()
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "");
}

export async function reverseGeocode(lat: number, lng: number): Promise<string> {
  try {
    const params = new URLSearchParams({
      format: "jsonv2",
      lat: lat.toString(),
      lon: lng.toString(),
      zoom: "10"
    });
    
    const response = await fetch(
      `https://nominatim.openstreetmap.org/reverse?${params.toString()}`,
      { headers: { Accept: "application/json", "User-Agent": "WorkshopApp/1.0" } }
    );

    if (!response.ok) {
      return "La meva posicio";
    }

    const data = await response.json() as any;
    
    if (data && data.address) {
      return (
        data.address.city ||
        data.address.town ||
        data.address.village ||
        data.address.municipality ||
        "La meva posicio"
      );
    }
    
    return "La meva posicio";
  } catch (error) {
    return "La meva posicio";
  }
}
