"use client";

import Link from "next/link";
import {
  ArrowLeft,
  BadgeCheck,
  CalendarDays,
  Car,
  Euro,
  Globe,
  MapPin,
  MessageSquare,
  Phone,
  ShieldCheck,
  Star,
  Wrench
} from "lucide-react";
import { AppHeader } from "@/components/app-header";
import type { Workshop } from "@/lib/types";

const scoreLabels = {
  service: "Servei",
  treatment: "Tracte",
  knowledge: "Coneixement",
  priceValue: "Preu/valor",
  wouldReturn: "Hi tornaria"
};

export function WorkshopDetail({ workshop }: { workshop: Workshop }) {
  return (
    <main className="app-shell">
      <AppHeader />

      <section className="detail-shell">
        <Link className="text-button detail-back" href="/">
          <ArrowLeft size={17} />
          Tornar als resultats
        </Link>

        <div className="detail-hero">
          <div>
            <div className="detail-badges">
              {workshop.verified && (
                <span className="service-pill">
                  <BadgeCheck size={14} />
                  Taller verificat
                </span>
              )}
              {workshop.dgtLibroTaller && (
                <span className="service-pill">
                  <ShieldCheck size={14} />
                  DGT Libro Taller
                </span>
              )}
              {workshop.brandMatch && (
                <span className="service-pill">
                  <Car size={14} />
                  Encaix alt amb el vehicle
                </span>
              )}
            </div>
            <h1>{workshop.name}</h1>
            <p>{workshop.description}</p>
            <div className="detail-location">
              <MapPin size={18} />
              {workshop.addressLine}, {workshop.municipality}, {workshop.province}
            </div>
          </div>

          <aside className="booking-panel">
            <div className="rating detail-rating">
              <span>{workshop.bayesianScore?.toFixed(1) ?? "-"}</span>
              <small>{workshop.reviewCount} reviews verificades i publiques</small>
            </div>
            <button className="primary-button" type="button">
              <CalendarDays size={17} />
              Demanar cita
            </button>
            <button className="text-button" type="button">
              <MessageSquare size={17} />
              Demanar pressupost
            </button>
          </aside>
        </div>

        <div className="detail-grid">
          <section className="panel">
            <div className="panel-heading">
              <div>
                <h2 className="panel-title">Serveis principals</h2>
                <p className="panel-kicker">Especialitats declarades pel taller.</p>
              </div>
              <Wrench size={20} />
            </div>
            <div className="service-list">
              {workshop.services.map((service) => (
                <span className="service-pill" key={service}>
                  {service}
                </span>
              ))}
            </div>
          </section>

          <section className="panel">
            <div className="panel-heading">
              <div>
                <h2 className="panel-title">Preu i distancia</h2>
                <p className="panel-kicker">Dades orientatives abans de reservar.</p>
              </div>
              <Euro size={20} />
            </div>
            <div className="metric-row">
              <div className="metric">
                <strong>
                  {workshop.hourlyRateEur ? `${workshop.hourlyRateEur} euros` : "-"}
                </strong>
                <span>Preu/hora</span>
              </div>
              <div className="metric">
                <strong>{workshop.distanceKm} km</strong>
                <span>Distancia</span>
              </div>
              <div className="metric">
                <strong>{workshop.brandMatch ? "Alt" : "Mig"}</strong>
                <span>Encaix</span>
              </div>
            </div>
          </section>

          <section className="panel">
            <div className="panel-heading">
              <div>
                <h2 className="panel-title">Puntuacions 0-10</h2>
                <p className="panel-kicker">Mitjanes ponderades per categoria.</p>
              </div>
              <Star size={20} />
            </div>
            <div className="score-list">
              {workshop.scoreBreakdown &&
                Object.entries(workshop.scoreBreakdown).map(([key, value]) => (
                  <div className="score-row" key={key}>
                    <span>{scoreLabels[key as keyof typeof scoreLabels]}</span>
                    <div className="score-track">
                      <span style={{ width: `${value * 10}%` }} />
                    </div>
                    <strong>{value.toFixed(1)}</strong>
                  </div>
                ))}
            </div>
          </section>

          <section className="panel">
            <div className="panel-heading">
              <div>
                <h2 className="panel-title">Contacte i horari</h2>
                <p className="panel-kicker">Informacio per contactar abans de reservar.</p>
              </div>
              <Phone size={20} />
            </div>
            <div className="contact-list">
              {workshop.phone && (
                <a href={`tel:${workshop.phone}`}>
                  <Phone size={16} />
                  {workshop.phone}
                </a>
              )}
              {workshop.website && (
                <a href={workshop.website} target="_blank" rel="noreferrer">
                  <Globe size={16} />
                  Web del taller
                </a>
              )}
              {workshop.openingHours?.map((line) => (
                <span key={line}>
                  <CalendarDays size={16} />
                  {line}
                </span>
              ))}
            </div>
          </section>
        </div>
      </section>
    </main>
  );
}
