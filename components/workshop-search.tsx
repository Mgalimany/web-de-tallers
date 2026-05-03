"use client";

import {
  BadgeCheck,
  Car,
  ChevronDown,
  Euro,
  Filter,
  Gauge,
  LocateFixed,
  MapPin,
  Search,
  SlidersHorizontal,
  Sparkles,
  Star,
  Wrench
} from "lucide-react";
import Link from "next/link";
import { useEffect, useMemo, useState } from "react";
import { AppHeader } from "@/components/app-header";
import { GoogleWorkshopMap } from "@/components/google-workshop-map";
import { geocodeSpanishPlace, reverseGeocode } from "@/lib/geocoding";
import { serviceOptions, workshops as fallbackWorkshops } from "@/lib/mock-data";
import { fetchVehicleMakes } from "@/lib/vehicles";
import { searchWorkshops } from "@/lib/workshops";
import type {
  SearchFilters,
  VehicleDraft,
  VehicleMakeOption,
  Workshop
} from "@/lib/types";

const initialFilters: SearchFilters = {
  location: "Barcelona",
  lat: 41.3874,
  lng: 2.1686,
  makeId: "",
  serviceCode: "",
  radiusKm: "25",
  maxHourlyRate: "",
  minScore: "",
  onlyVerified: false
};

const initialVehicle: VehicleDraft = {
  make: "BMW",
  model: "Serie 3",
  year: "2021",
  fuelType: "Diesel"
};

export function WorkshopSearch() {
  const [filters, setFilters] = useState<SearchFilters>(initialFilters);
  const [vehicle, setVehicle] = useState<VehicleDraft>(initialVehicle);
  const [makes, setMakes] = useState<VehicleMakeOption[]>([]);
  const [results, setResults] = useState<Workshop[]>(fallbackWorkshops);
  const [activeWorkshopId, setActiveWorkshopId] = useState(fallbackWorkshops[0]?.id);
  const [loading, setLoading] = useState(false);
  const [locating, setLocating] = useState(false);
  const [locationError, setLocationError] = useState<string | null>(null);
  const [searchMessage, setSearchMessage] = useState<string | null>(null);

  const activeWorkshop = useMemo(
    () => results.find((workshop) => workshop.id === activeWorkshopId),
    [activeWorkshopId, results]
  );

  useEffect(() => {
    fetchVehicleMakes().then((nextMakes) => {
      setMakes(nextMakes);
    });
  }, []);

  useEffect(() => {
    handleSearch();
    // The initial load intentionally runs once with the default Barcelona filters.
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  async function handleSearch() {
    setLoading(true);
    setSearchMessage(null);
    setLocationError(null);

    let nextFilters = filters;

    if (filters.location.trim().toLowerCase() !== "la meva posicio") {
      try {
        const place = await geocodeSpanishPlace(filters.location);
        nextFilters = {
          ...filters,
          location: place.label,
          lat: place.lat,
          lng: place.lng
        };
        setFilters(nextFilters);
      } catch (error) {
        setLocationError(
          error instanceof Error
            ? error.message
            : "No hem pogut trobar aquesta localitat."
        );
        setLoading(false);
        return;
      }
    }

    const nextResults = await searchWorkshops(nextFilters);
    setResults(nextResults);
    setActiveWorkshopId(undefined);
    setSearchMessage(
      nextResults.length > 0
        ? `${nextResults.length} tallers trobats a prop de ${nextFilters.location}.`
        : "No hem trobat tallers amb aquests filtres. Prova treure marca, rating o preu maxim."
    );
    setLoading(false);
  }

  function handleUseMyPosition() {
    if (!navigator.geolocation) {
      setLocationError("Aquest navegador no permet geolocalitzacio.");
      return;
    }

    setLocating(true);
    setLocationError(null);

      navigator.geolocation.getCurrentPosition(
      async (position) => {
        const locationName = await reverseGeocode(
          position.coords.latitude,
          position.coords.longitude
        );

        const nextFilters = {
          ...filters,
          location: locationName,
          lat: position.coords.latitude,
          lng: position.coords.longitude
        };

        setFilters(nextFilters);
        setLocating(false);
        setLoading(true);
        setSearchMessage(null);

        const nextResults = await searchWorkshops(nextFilters);
        setResults(nextResults);
        setActiveWorkshopId(undefined);
        setSearchMessage(
          nextResults.length > 0
            ? `${nextResults.length} tallers trobats a prop de la teva posicio.`
            : "No hem trobat tallers a prop de la teva posicio amb aquests filtres."
        );
        setLoading(false);
      },
      () => {
        setLocationError("No hem pogut accedir a la teva posicio.");
        setLocating(false);
      },
      {
        enableHighAccuracy: true,
        maximumAge: 60_000,
        timeout: 10_000
      }
    );
  }

  return (
    <main className="app-shell">
      <AppHeader />

      <section className="workspace">
        <aside className="left-rail" aria-label="Filtres de cerca">
          <section className="panel">
            <div className="panel-heading">
              <div>
                <h2 className="panel-title">Busca taller</h2>
                <p className="panel-kicker">
                  Per proximitat, especialitzacio, preu i confiança.
                </p>
              </div>
              <Filter size={20} />
            </div>

            <div className="search-grid">
              <div className="field">
                <label htmlFor="location">Ubicacio</label>
                <div className="input-wrap">
                  <LocateFixed />
                  <input
                    id="location"
                    value={filters.location}
                    onChange={(event) =>
                      setFilters({ ...filters, location: event.target.value })
                    }
                    onKeyDown={(event) => {
                      if (event.key === "Enter") {
                        handleSearch();
                      }
                    }}
                    placeholder="Ciutat o codi postal"
                  />
                </div>
              </div>
              {locationError && <p className="form-error">{locationError}</p>}

              <div className="filters">
                <div className="field">
                  <label htmlFor="make">Marca</label>
                  <div className="select-wrap">
                    <Car />
                    <select
                      id="make"
                      value={filters.makeId}
                      onChange={(event) =>
                        setFilters({ ...filters, makeId: event.target.value })
                      }
                    >
                      <option value="">Qualsevol</option>
                      {makes.map((make) => (
                        <option key={make.id} value={make.id}>
                          {make.name}
                        </option>
                      ))}
                    </select>
                  </div>
                </div>

                <div className="field">
                  <label htmlFor="service">Servei</label>
                  <div className="select-wrap">
                    <Wrench />
                    <select
                      id="service"
                      value={filters.serviceCode}
                      onChange={(event) =>
                        setFilters({ ...filters, serviceCode: event.target.value })
                      }
                    >
                      <option value="">Qualsevol</option>
                      {serviceOptions.map((service) => (
                        <option key={service.code} value={service.code}>
                          {service.label}
                        </option>
                      ))}
                    </select>
                  </div>
                </div>
              </div>

              <div className="filters">
                <div className="field">
                  <label htmlFor="radius">Radi</label>
                  <div className="select-wrap">
                    <Gauge />
                    <select
                      id="radius"
                      value={filters.radiusKm}
                      onChange={(event) =>
                        setFilters({ ...filters, radiusKm: event.target.value })
                      }
                    >
                      <option value="10">10 km</option>
                      <option value="25">25 km</option>
                      <option value="50">50 km</option>
                      <option value="100">100 km</option>
                    </select>
                  </div>
                </div>

                <div className="field">
                  <label htmlFor="rate">Preu maxim</label>
                  <div className="input-wrap">
                    <Euro />
                    <input
                      id="rate"
                      type="number"
                      min="0"
                      value={filters.maxHourlyRate}
                      onChange={(event) =>
                        setFilters({
                          ...filters,
                          maxHourlyRate: event.target.value
                        })
                      }
                    />
                  </div>
                </div>
              </div>

              <div className="chips" aria-label="Filtres rapids">
                <button
                  className={`chip ${filters.onlyVerified ? "chip-active" : ""}`}
                  type="button"
                  onClick={() =>
                    setFilters({
                      ...filters,
                      onlyVerified: !filters.onlyVerified
                    })
                  }
                >
                  <BadgeCheck size={15} />
                  Verificats
                </button>
                <button className="chip chip-active" type="button">
                  <Star size={15} />
                  {filters.minScore ? `+${filters.minScore}` : "Sense rating"}
                </button>
                <button className="chip" type="button">
                  <Sparkles size={15} />
                  Cita online
                </button>
              </div>

              <button
                className="primary-button"
                type="button"
                onClick={handleSearch}
                disabled={loading}
              >
                <Search size={17} />
                {loading ? "Buscant..." : "Buscar tallers"}
              </button>
              {searchMessage && <p className="form-success">{searchMessage}</p>}
            </div>
          </section>

          <section className="panel">
            <div className="panel-heading">
              <div>
                <h2 className="panel-title">El teu vehicle</h2>
                <p className="panel-kicker">S'usa per prioritzar tallers compatibles.</p>
              </div>
              <SlidersHorizontal size={20} />
            </div>

            <div className="vehicle-card">
              <span className="vehicle-icon">
                <Car size={21} />
              </span>
              <div>
                <strong>
                  {vehicle.make} {vehicle.model}
                </strong>
                <span>
                  {vehicle.year} · {vehicle.fuelType}
                </span>
              </div>
            </div>

            <div className="search-grid" style={{ marginTop: 14 }}>
              <div className="filters">
                <div className="field">
                  <label htmlFor="vehicle-make">Marca</label>
                  <input
                    id="vehicle-make"
                    value={vehicle.make}
                    onChange={(event) =>
                      setVehicle({ ...vehicle, make: event.target.value })
                    }
                  />
                </div>
                <div className="field">
                  <label htmlFor="vehicle-model">Model</label>
                  <input
                    id="vehicle-model"
                    value={vehicle.model}
                    onChange={(event) =>
                      setVehicle({ ...vehicle, model: event.target.value })
                    }
                  />
                </div>
              </div>
            </div>
          </section>
        </aside>

        <section className="right-rail">
          <div className="results-toolbar">
            <div>
              <h1>Tallers que encaixen amb el teu cotxe</h1>
              <p>
                Resultats ordenats per compatibilitat, reputacio verificada,
                distancia i preu/hora.
              </p>
            </div>
            <button className="text-button" type="button">
              <ChevronDown size={17} />
              Millor encaix
            </button>
          </div>

          <WorkshopMap
            workshops={results}
            activeWorkshopId={activeWorkshop?.id}
            userPosition={{ lat: filters.lat, lng: filters.lng }}
            onSelect={setActiveWorkshopId}
            onUseMyPosition={handleUseMyPosition}
            locating={locating}
          />

          <div className="content-grid">
            {results.map((workshop) => (
              <WorkshopCard
                key={workshop.id}
                workshop={workshop}
                active={workshop.id === activeWorkshop?.id}
                onSelect={() => setActiveWorkshopId(workshop.id)}
              />
            ))}
          </div>
        </section>
      </section>
    </main>
  );
}

function WorkshopMap({
  workshops,
  activeWorkshopId,
  userPosition,
  onSelect,
  onUseMyPosition,
  locating
}: {
  workshops: Workshop[];
  activeWorkshopId?: string;
  userPosition: { lat: number; lng: number };
  onSelect: (id: string) => void;
  onUseMyPosition: () => void;
  locating: boolean;
}) {
  return (
    <GoogleWorkshopMap
      workshops={workshops}
      activeWorkshopId={activeWorkshopId}
      userPosition={userPosition}
      onSelect={onSelect}
      onUseMyPosition={onUseMyPosition}
      locating={locating}
    />
  );
}

function WorkshopCard({
  workshop,
  active,
  onSelect
}: {
  workshop: Workshop;
  active: boolean;
  onSelect: () => void;
}) {
  return (
    <article className={`workshop-card ${active ? "workshop-card-active" : ""}`}>
      <div className="workshop-header">
        <div>
          <h2>{workshop.name}</h2>
          <div className="workshop-address">
            <MapPin size={14} />
            {workshop.addressLine ? `${workshop.addressLine}, ` : ""}{workshop.municipality || workshop.province || "Espanya"}
          </div>
        </div>
        <div className="rating" aria-label={`Valoracio ${workshop.bayesianScore}`}>
          <span>{workshop.bayesianScore?.toFixed(1) ?? "-"}</span>
          <small>{workshop.reviewCount} reviews</small>
        </div>
      </div>

      <div className="metric-row">
        <div className="metric">
          <strong>{workshop.distanceKm} km</strong>
          <span>Distancia</span>
        </div>
        <div className="metric">
          <strong>
            {workshop.hourlyRateEur ? `${workshop.hourlyRateEur} euros` : "-"}
          </strong>
          <span>Preu/hora</span>
        </div>
        <div className="metric">
          <strong>{workshop.brandMatch ? "Alt" : "Mig"}</strong>
          <span>Encaix</span>
        </div>
      </div>

      <div className="service-list">
        {workshop.verified && <span className="service-pill">Verificat</span>}
        {workshop.dgtLibroTaller && <span className="service-pill">DGT</span>}
        {workshop.services.map((service) => (
          <span className="service-pill" key={service}>
            {service}
          </span>
        ))}
      </div>

      <div className="card-actions">
        <button className="text-button" type="button" onClick={onSelect}>
          <MapPin size={16} />
          Veure mapa
        </button>
        <Link className="primary-button" href={`/tallers/${workshop.slug}`}>
          <Search size={16} />
          Veure fitxa
        </Link>
      </div>
    </article>
  );
}
