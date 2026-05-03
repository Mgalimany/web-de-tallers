"use client";

import { useState, useEffect } from "react";
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
  Wrench,
  ChevronRight,
  Clock,
  Camera,
  Plus
} from "lucide-react";
import { AppHeader } from "@/components/app-header";
import { ReviewList } from "@/components/review-list";
import { ReviewForm } from "@/components/review-form";
import { getWorkshopReviews } from "@/lib/workshops";
import type { Workshop } from "@/lib/types";

const scoreLabels = {
  service: "Servei",
  treatment: "Tracte",
  knowledge: "Coneixement",
  priceValue: "Preu/valor",
  wouldReturn: "Hi tornaria"
};

export function WorkshopDetail({ workshop }: { workshop: Workshop }) {
  const [reviews, setReviews] = useState<any[]>([]);
  const [showReviewForm, setShowReviewForm] = useState(false);
  const [loadingReviews, setLoadingReviews] = useState(true);

  useEffect(() => {
    async function loadReviews() {
      const data = await getWorkshopReviews(workshop.id);
      setReviews(data);
      setLoadingReviews(false);
    }
    loadReviews();
  }, [workshop.id]);

  const hasImages = workshop.images && workshop.images.length > 0;

  return (
    <main className="app-shell bg-slate-50/50">
      <AppHeader />

      <section className="detail-shell max-w-6xl mx-auto px-4 py-8">
        <Link className="inline-flex items-center gap-2 text-slate-500 hover:text-teal-600 transition-colors mb-6 font-medium" href="/">
          <ArrowLeft size={18} />
          Tornar als resultats
        </Link>

        {/* Photo Gallery */}
        {hasImages && (
          <div className="relative mb-8 group">
            <div className="flex gap-4 overflow-x-auto pb-4 no-scrollbar scroll-smooth snap-x snap-mandatory">
              {workshop.images?.map((url, idx) => (
                <div key={idx} className="flex-none w-[300px] md:w-[450px] aspect-[16/10] rounded-3xl overflow-hidden shadow-lg snap-start">
                  <img 
                    src={url} 
                    alt={`${workshop.name} photo ${idx + 1}`}
                    className="w-full h-full object-cover transition-transform duration-700 hover:scale-105"
                  />
                </div>
              ))}
            </div>
            <div className="absolute top-4 right-4 bg-black/50 backdrop-blur-md text-white px-3 py-1.5 rounded-full text-xs font-bold flex items-center gap-2">
              <Camera size={14} />
              {workshop.images?.length} fotos
            </div>
          </div>
        )}

        {/* Hero Section */}
        <div className="relative overflow-hidden rounded-3xl bg-gradient-to-br from-slate-900 via-teal-900 to-slate-900 text-white p-8 md:p-12 mb-8 shadow-2xl shadow-teal-900/20">
          <div className="relative z-10 grid md:grid-cols-[1fr,320px] gap-8 items-end">
            <div>
              <div className="flex flex-wrap gap-2 mb-6">
                {workshop.verified && (
                  <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full bg-teal-400/20 text-teal-300 text-xs font-bold uppercase tracking-wider backdrop-blur-md border border-teal-400/30">
                    <BadgeCheck size={14} />
                    Verificat
                  </span>
                )}
                {workshop.dgtLibroTaller && (
                  <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full bg-blue-400/20 text-blue-300 text-xs font-bold uppercase tracking-wider backdrop-blur-md border border-blue-400/30">
                    <ShieldCheck size={14} />
                    DGT Libro Taller
                  </span>
                )}
              </div>
              
              <h1 className="text-4xl md:text-5xl font-black mb-4 tracking-tight">
                {workshop.name}
              </h1>
              
              <p className="text-teal-100/80 text-lg max-w-2xl mb-6 leading-relaxed">
                {workshop.description || "Taller especialitzat amb professionals de confiança al servei del teu vehicle."}
              </p>

              <div className="flex items-center gap-2 text-teal-200/70 font-medium">
                <MapPin size={20} className="text-teal-400" />
                <span className="text-lg">
                  {workshop.addressLine}, {workshop.municipality}
                </span>
              </div>
            </div>

            <aside className="bg-white/10 backdrop-blur-xl border border-white/20 rounded-2xl p-6 shadow-xl">
              <div className="flex items-center justify-between mb-6">
                <div className="text-center">
                  <div className="text-4xl font-black text-white leading-none">
                    {workshop.bayesianScore?.toFixed(1) ?? "-"}
                  </div>
                  <div className="text-[10px] uppercase tracking-widest text-teal-300 font-bold mt-1">
                    Puntuació
                  </div>
                </div>
                <div className="h-10 w-[1px] bg-white/20" />
                <div className="text-right">
                  <div className="text-xl font-bold text-white">
                    {workshop.reviewCount}
                  </div>
                  <div className="text-[10px] uppercase tracking-widest text-teal-300 font-bold mt-1">
                    Opinions
                  </div>
                </div>
              </div>

              <button className="w-full bg-teal-500 hover:bg-teal-400 text-slate-900 font-bold py-4 rounded-xl transition-all shadow-lg shadow-teal-500/25 flex items-center justify-center gap-2 mb-3">
                <CalendarDays size={19} />
                Demanar cita ara
              </button>
              <button className="w-full bg-white/5 hover:bg-white/10 text-white font-bold py-3 rounded-xl transition-all border border-white/10 flex items-center justify-center gap-2">
                <MessageSquare size={17} />
                Pressupost gratis
              </button>
            </aside>
          </div>
          <div className="absolute top-0 right-0 w-96 h-96 bg-teal-500/10 rounded-full blur-3xl -mr-48 -mt-48" />
          <div className="absolute bottom-0 left-0 w-64 h-64 bg-blue-500/10 rounded-full blur-3xl -ml-32 -mb-32" />
        </div>

        <div className="grid lg:grid-cols-[1fr,380px] gap-8">
          <div className="space-y-8">
            <section className="bg-white rounded-3xl p-8 shadow-sm border border-slate-100">
              <div className="flex items-center justify-between mb-8">
                <h2 className="text-2xl font-bold text-slate-900 flex items-center gap-3">
                  <span className="w-10 h-10 rounded-xl bg-teal-50 flex items-center justify-center text-teal-600">
                    <Wrench size={20} />
                  </span>
                  Especialitats del taller
                </h2>
              </div>
              <div className="flex flex-wrap gap-3">
                {workshop.services.length > 0 ? workshop.services.map((service) => (
                  <span className="px-5 py-2.5 rounded-2xl bg-slate-50 text-slate-700 font-semibold border border-slate-100 hover:border-teal-200 hover:bg-teal-50 transition-all cursor-default" key={service}>
                    {service}
                  </span>
                )) : (
                  <p className="text-slate-400 italic">No hi ha serveis llistats per aquest taller.</p>
                )}
              </div>
            </section>

            {/* Reviews Section */}
            <section className="bg-white rounded-3xl p-8 shadow-sm border border-slate-100">
              <div className="flex items-center justify-between mb-8">
                <h2 className="text-2xl font-bold text-slate-900 flex items-center gap-3">
                  <span className="w-10 h-10 rounded-xl bg-teal-50 flex items-center justify-center text-teal-600">
                    <Star size={20} />
                  </span>
                  Opinions dels usuaris
                </h2>
                <button 
                  onClick={() => setShowReviewForm(true)}
                  className="inline-flex items-center gap-2 text-sm font-bold text-teal-600 hover:bg-teal-50 px-4 py-2 rounded-xl transition-all"
                >
                  <Plus size={18} />
                  Escriure opinió
                </button>
              </div>
              
              {loadingReviews ? (
                <div className="py-12 flex justify-center">
                  <div className="w-8 h-8 border-4 border-teal-500 border-t-transparent rounded-full animate-spin" />
                </div>
              ) : (
                <ReviewList reviews={reviews} />
              )}
            </section>
          </div>

          <aside className="space-y-6">
            {/* Pricing Panel */}
            <div className="bg-slate-900 rounded-3xl p-8 text-white">
              <h3 className="text-xl font-bold mb-6 flex items-center gap-3">
                <Euro size={20} className="text-teal-400" />
                Preus i condicions
              </h3>
              <div className="space-y-4">
                <div className="flex justify-between items-center py-3 border-b border-white/10">
                  <span className="text-slate-400 font-medium">Preu/hora</span>
                  <span className="text-xl font-black text-teal-400">
                    {workshop.hourlyRateEur ? `${workshop.hourlyRateEur}€` : "Consultar"}
                  </span>
                </div>
                <div className="flex justify-between items-center py-3">
                  <span className="text-slate-400 font-medium">Pressupost</span>
                  <span className="text-sm font-bold px-3 py-1 rounded-lg bg-white/5">Gratuït</span>
                </div>
              </div>
            </div>

            {/* Ratings Detail */}
            <div className="bg-white rounded-3xl p-8 shadow-sm border border-slate-100">
              <h3 className="text-xl font-bold text-slate-900 mb-8 flex items-center gap-3">
                <Star size={20} className="text-amber-500" />
                Puntuacions 0-10
              </h3>
              <div className="grid gap-6">
                {workshop.scoreBreakdown &&
                  Object.entries(workshop.scoreBreakdown).map(([key, value]) => (
                    <div className="space-y-2" key={key}>
                      <div className="flex justify-between items-center text-xs font-bold text-slate-500 px-1">
                        <span>{scoreLabels[key as keyof typeof scoreLabels]}</span>
                        <span className="text-slate-900">{value.toFixed(1)}</span>
                      </div>
                      <div className="h-2 bg-slate-100 rounded-full overflow-hidden">
                        <div 
                          className="h-full bg-teal-500 rounded-full transition-all duration-1000" 
                          style={{ width: `${value * 10}%` }} 
                        />
                      </div>
                    </div>
                  ))}
              </div>
            </div>

            {/* Contact Panel */}
            <div className="bg-white rounded-3xl p-8 shadow-sm border border-slate-100">
              <h3 className="text-xl font-bold text-slate-900 mb-6 flex items-center gap-3">
                <Phone size={20} className="text-teal-600" />
                Contacte directe
              </h3>
              <div className="space-y-4">
                {workshop.phone && (
                  <a href={`tel:${workshop.phone}`} className="flex items-center gap-4 p-4 rounded-2xl bg-slate-50 hover:bg-teal-50 border border-slate-100 hover:border-teal-100 transition-all group">
                    <span className="w-10 h-10 rounded-xl bg-white flex items-center justify-center text-slate-600 group-hover:text-teal-600 shadow-sm">
                      <Phone size={18} />
                    </span>
                    <span className="font-bold text-slate-700">{workshop.phone}</span>
                  </a>
                )}
                {workshop.website && (
                  <a href={workshop.website} target="_blank" rel="noreferrer" className="flex items-center gap-4 p-4 rounded-2xl bg-slate-50 hover:bg-teal-50 border border-slate-100 hover:border-teal-100 transition-all group">
                    <span className="w-10 h-10 rounded-xl bg-white flex items-center justify-center text-slate-600 group-hover:text-teal-600 shadow-sm">
                      <Globe size={18} />
                    </span>
                    <span className="font-bold text-slate-700">Lloc web</span>
                    <ChevronRight size={16} className="ml-auto text-slate-300" />
                  </a>
                )}
                
                <div className="pt-4 mt-4 border-t border-slate-100">
                  <h4 className="text-[10px] font-black text-slate-400 uppercase tracking-widest mb-4 flex items-center gap-2">
                    <Clock size={12} />
                    Horari
                  </h4>
                  <div className="space-y-1">
                    {workshop.openingHours && workshop.openingHours.length > 0 ? (
                      workshop.openingHours.map((line, idx) => (
                        <div className="text-slate-600 text-xs font-medium" key={idx}>
                          {line}
                        </div>
                      ))
                    ) : (
                      <p className="text-slate-400 text-xs italic">Consultar horari.</p>
                    )}
                  </div>
                </div>
              </div>
            </div>
          </aside>
        </div>
      </section>

      {showReviewForm && (
        <ReviewForm 
          workshopId={workshop.id} 
          onClose={() => setShowReviewForm(false)}
          onSuccess={() => {
            setShowReviewForm(false);
            // Reload reviews
            getWorkshopReviews(workshop.id).then(setReviews);
          }}
        />
      )}
    </main>
  );
}
