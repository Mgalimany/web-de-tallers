"use client";

import { LocateFixed, MapPin, Layers } from "lucide-react";
import { useEffect, useRef, useState } from "react";
import type {
  GeoJSONSource,
  LngLatBounds,
  MapLayerMouseEvent,
  Map as MapLibreMap,
  Marker
} from "maplibre-gl";
import type { Workshop } from "@/lib/types";

type UserPosition = {
  lat: number;
  lng: number;
};

type WorkshopMapProps = {
  workshops: Workshop[];
  activeWorkshopId?: string;
  userPosition: UserPosition;
  onSelect: (id: string) => void;
  onUseMyPosition: () => void;
  locating: boolean;
};

type Basemap = "google" | "satellite" | "osm";

export function GoogleWorkshopMap({
  workshops,
  activeWorkshopId,
  userPosition,
  onSelect,
  onUseMyPosition,
  locating
}: WorkshopMapProps) {
  const mapElementRef = useRef<HTMLDivElement | null>(null);
  const mapRef = useRef<MapLibreMap | null>(null);
  const userMarkerRef = useRef<Marker | null>(null);
  const [basemap, setBasemap] = useState<Basemap>("google");

  useEffect(() => {
    let cancelled = false;

    async function initMap() {
      if (mapRef.current || !mapElementRef.current) {
        return;
      }

      const maplibregl = await import("maplibre-gl");

      if (cancelled || !mapElementRef.current) {
        return;
      }

      mapRef.current = new maplibregl.Map({
        container: mapElementRef.current,
        center: [userPosition.lng, userPosition.lat],
        zoom: 12,
        attributionControl: false,
        style: {
          version: 8,
          glyphs: "https://demotiles.maplibre.org/font/{fontstack}/{range}.pbf",
          sources: {
            google: {
              type: "raster",
              tiles: ["https://mt0.google.com/vt/lyrs=m&hl=ca&x={x}&y={y}&z={z}"],
              tileSize: 256,
              attribution: "Google Maps"
            },
            satellite: {
              type: "raster",
              tiles: ["https://mt0.google.com/vt/lyrs=s,h&hl=ca&x={x}&y={y}&z={z}"],
              tileSize: 256,
              attribution: "Google Satellite"
            },
            osm: {
              type: "raster",
              tiles: ["https://tile.openstreetmap.org/{z}/{x}/{y}.png"],
              tileSize: 256,
              attribution: "OpenStreetMap contributors"
            }
          },
          layers: [
            {
              id: "basemap-osm",
              type: "raster",
              source: "osm",
              layout: { visibility: "none" }
            },
            {
              id: "basemap-google",
              type: "raster",
              source: "google",
              layout: { visibility: "visible" }
            },
            {
              id: "basemap-satellite",
              type: "raster",
              source: "satellite",
              layout: { visibility: "none" }
            }
          ]
        }
      });

      mapRef.current.addControl(
        new maplibregl.AttributionControl({
          compact: true,
          customAttribution: "Map data provided by external tile services."
        }),
        "bottom-right"
      );

      mapRef.current.on("load", () => {
        if (!mapRef.current) {
          return;
        }

        mapRef.current.addSource("workshops", {
          type: "geojson",
          data: buildWorkshopFeatureCollection(workshops, activeWorkshopId)
        });

        mapRef.current.addLayer({
          id: "workshop-points",
          type: "circle",
          source: "workshops",
          paint: {
            "circle-color": [
              "case",
              ["==", ["get", "active"], true],
              "#1e1b4b", // Dark color for active to pop
              "#e11d48" // Bright red for non-active workshops to stand out
            ],
            "circle-radius": [
              "case",
              ["==", ["get", "active"], true],
              16, // Much larger for active
              11  // Slightly larger for inactive
            ],
            "circle-stroke-color": "#ffffff",
            "circle-stroke-width": 3
          }
        });

        mapRef.current.addLayer({
          id: "workshop-point-labels",
          type: "symbol",
          source: "workshops",
          minzoom: 12,
          layout: {
            "text-field": ["get", "name"],
            "text-size": 12,
            "text-offset": [0, 1.25],
            "text-anchor": "top"
          },
          paint: {
            "text-color": "#20201d",
            "text-halo-color": "#fffaf2",
            "text-halo-width": 1.5
          }
        });

        mapRef.current.on("click", "workshop-points", (event) => {
          const feature = event.features?.[0];
          const id = feature?.properties?.id as string | undefined;

          if (id) {
            onSelect(id);
          }
        });
        mapRef.current.on("mouseenter", "workshop-points", setPointerCursor);
        mapRef.current.on("mouseleave", "workshop-points", resetCursor);
      });
    }

    initMap();

    return () => {
      cancelled = true;
    };
  }, [workshops]); // Remove activeWorkshopId and others from dependency to avoid re-init

  // Effect to update basemap visibility
  useEffect(() => {
    if (!mapRef.current || !mapRef.current.isStyleLoaded()) return;
    
    const layers = ["basemap-google", "basemap-satellite", "basemap-osm"];
    layers.forEach(layer => {
      if (mapRef.current?.getLayer(layer)) {
        mapRef.current.setLayoutProperty(
          layer,
          "visibility",
          layer === `basemap-${basemap}` ? "visible" : "none"
        );
      }
    });
  }, [basemap]);

  useEffect(() => {
    async function renderUserMarker() {
      if (!mapRef.current) {
        return;
      }

      const maplibregl = await import("maplibre-gl");

      if (!userMarkerRef.current) {
        const element = document.createElement("div");
        element.className = "osm-user-marker";
        element.title = "La meva posicio";

        userMarkerRef.current = new maplibregl.Marker({ element })
          .setLngLat([userPosition.lng, userPosition.lat])
          .addTo(mapRef.current);
      } else {
        userMarkerRef.current.setLngLat([userPosition.lng, userPosition.lat]);
      }
    }

    renderUserMarker();
  }, [userPosition.lat, userPosition.lng]);

  useEffect(() => {
    const source = mapRef.current?.getSource("workshops") as
      | GeoJSONSource
      | undefined;

    source?.setData(buildWorkshopFeatureCollection(workshops, activeWorkshopId));
  }, [activeWorkshopId, workshops]);

  useEffect(() => {
    async function fitMap() {
      if (!mapRef.current) {
        return;
      }

      const maplibregl = await import("maplibre-gl");
      const bounds = new maplibregl.LngLatBounds() as LngLatBounds;
      bounds.extend([userPosition.lng, userPosition.lat]);

      workshops.forEach((workshop) => {
        bounds.extend([workshop.longitude, workshop.latitude]);
      });

      if (!bounds.isEmpty()) {
        mapRef.current.fitBounds(bounds, {
          padding: 78,
          maxZoom: 13,
          duration: 700
        });
      }
    }

    fitMap();
  }, [userPosition.lat, userPosition.lng, workshops]);

  useEffect(() => {
    const activeWorkshop = workshops.find(
      (workshop) => workshop.id === activeWorkshopId
    );

    if (!activeWorkshop || !mapRef.current) {
      return;
    }

    mapRef.current.flyTo({
      center: [activeWorkshop.longitude, activeWorkshop.latitude],
      zoom: Math.max(mapRef.current.getZoom(), 12),
      duration: 500
    });
  }, [activeWorkshopId, workshops]);

  return (
    <div className="map-stage map-stage-osm" aria-label="Mapa">
      <div ref={mapElementRef} className="osm-map-canvas" />
      
      <div className="map-layer-control" style={{ 
        position: "absolute", bottom: 30, left: 10, 
        background: "white", padding: "8px 12px", 
        borderRadius: 8, display: "flex", gap: 15, 
        fontSize: 13, zIndex: 10, 
        boxShadow: "0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1)",
        fontWeight: 500
      }}>
        <label style={{ display: "flex", alignItems: "center", gap: 6, cursor: "pointer" }}>
          <input type="radio" name="basemap" checked={basemap === "google"} onChange={() => setBasemap("google")} />
          Google Maps
        </label>
        <label style={{ display: "flex", alignItems: "center", gap: 6, cursor: "pointer" }}>
          <input type="radio" name="basemap" checked={basemap === "satellite"} onChange={() => setBasemap("satellite")} />
          Satèl·lit
        </label>
        <label style={{ display: "flex", alignItems: "center", gap: 6, cursor: "pointer" }}>
          <input type="radio" name="basemap" checked={basemap === "osm"} onChange={() => setBasemap("osm")} />
          OpenStreetMap
        </label>
      </div>

      <MapToolbar
        workshopsCount={workshops.length}
        visibleText={buildVisibleText(workshops.length)}
        locating={locating}
        onUseMyPosition={onUseMyPosition}
      />
    </div>
  );
}

function MapToolbar({
  workshopsCount,
  visibleText,
  locating,
  onUseMyPosition
}: {
  workshopsCount: number;
  visibleText: string;
  locating: boolean;
  onUseMyPosition: () => void;
}) {
  return (
    <div className="map-toolbar">
      <div className="map-status">
        <MapPin size={16} />
        {visibleText}
      </div>
      <button className="map-location-button" type="button" onClick={onUseMyPosition}>
        <LocateFixed size={17} />
        {locating ? "Localitzant..." : "La meva posicio"}
      </button>
    </div>
  );
}

function buildVisibleText(count: number) {
  if (count === 1) {
    return "1 taller visible";
  }

  return `${count} tallers visibles`;
}

function buildWorkshopFeatureCollection(
  workshops: Workshop[],
  activeWorkshopId?: string
): GeoJSON.FeatureCollection<GeoJSON.Point> {
  return {
    type: "FeatureCollection",
    features: workshops.map((workshop) => ({
      type: "Feature",
      geometry: {
        type: "Point",
        coordinates: [workshop.longitude, workshop.latitude]
      },
      properties: {
        id: workshop.id,
        name: workshop.name,
        active: workshop.id === activeWorkshopId
      }
    }))
  };
}

function setPointerCursor(event: MapLayerMouseEvent) {
  if (event.target && event.target.getCanvas()) {
    event.target.getCanvas().style.cursor = "pointer";
  }
}

function resetCursor(event: MapLayerMouseEvent) {
  if (event.target && event.target.getCanvas()) {
    event.target.getCanvas().style.cursor = "";
  }
}
