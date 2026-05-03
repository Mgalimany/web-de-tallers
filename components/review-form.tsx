"use client";

import { useState } from "react";
import { Star, MessageSquare, Send, X } from "lucide-react";
import { submitReview } from "@/lib/workshops";

const categories = [
  { id: "score_service", label: "Servei" },
  { id: "score_treatment", label: "Tracte" },
  { id: "score_knowledge", label: "Coneixement" },
  { id: "score_price_value", label: "Preu/valor" },
  { id: "score_would_return", label: "Hi tornaria" }
];

export function ReviewForm({ workshopId, onSuccess, onClose }: { 
  workshopId: string; 
  onSuccess: () => void;
  onClose: () => void;
}) {
  const [loading, setLoading] = useState(false);
  const [comment, setComment] = useState("");
  const [scores, setScores] = useState<Record<string, number>>({
    score_service: 10,
    score_treatment: 10,
    score_knowledge: 10,
    score_price_value: 10,
    score_would_return: 10
  });

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);
    try {
      await submitReview(workshopId, {
        ...scores,
        comment,
        service_date: new Date().toISOString().split('T')[0]
      });
      onSuccess();
    } catch (err) {
      alert("Error al enviar la ressenya. Has d'estar registrat.");
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-900/60 backdrop-blur-sm">
      <div className="bg-white rounded-3xl w-full max-w-xl shadow-2xl overflow-hidden animate-in fade-in zoom-in duration-300">
        <div className="p-6 border-b border-slate-100 flex justify-between items-center bg-slate-50">
          <h3 className="text-xl font-bold text-slate-900 flex items-center gap-2">
            <Star className="text-teal-600 fill-teal-600" size={20} />
            Escriu la teva opinió
          </h3>
          <button onClick={onClose} className="p-2 hover:bg-slate-200 rounded-full transition-colors text-slate-400">
            <X size={20} />
          </button>
        </div>

        <form onSubmit={handleSubmit} className="p-8 space-y-6">
          <div className="grid gap-6">
            {categories.map((cat) => (
              <div key={cat.id} className="space-y-2">
                <div className="flex justify-between items-center text-sm font-bold text-slate-600">
                  <span>{cat.label}</span>
                  <span className="text-teal-600">{scores[cat.id]}/10</span>
                </div>
                <input 
                  type="range" 
                  min="0" 
                  max="10" 
                  value={scores[cat.id]} 
                  onChange={(e) => setScores({ ...scores, [cat.id]: parseInt(e.target.value) })}
                  className="w-full h-2 bg-slate-100 rounded-lg appearance-none cursor-pointer accent-teal-500"
                />
              </div>
            ))}
          </div>

          <div className="space-y-2 pt-2">
            <label className="text-sm font-bold text-slate-600 flex items-center gap-2">
              <MessageSquare size={16} />
              El teu comentari
            </label>
            <textarea 
              value={comment}
              onChange={(e) => setComment(e.target.value)}
              placeholder="Explica la teva experiència al taller..."
              className="w-full h-32 p-4 bg-slate-50 rounded-2xl border border-slate-100 focus:border-teal-500 focus:ring-4 focus:ring-teal-500/10 transition-all outline-none resize-none text-slate-700"
              required
            />
          </div>

          <div className="pt-4 flex gap-3">
            <button 
              type="button"
              onClick={onClose}
              className="flex-1 py-4 font-bold text-slate-400 hover:text-slate-600 transition-colors"
            >
              Cancel·lar
            </button>
            <button 
              type="submit" 
              disabled={loading}
              className="flex-[2] bg-teal-500 hover:bg-teal-400 disabled:opacity-50 text-slate-900 font-bold py-4 rounded-2xl transition-all shadow-lg shadow-teal-500/25 flex items-center justify-center gap-2"
            >
              {loading ? "Enviant..." : <><Send size={18} /> Publicar opinió</>}
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}
