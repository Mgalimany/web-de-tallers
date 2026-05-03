"use client";

import { Star, Car, User } from "lucide-react";

type Review = {
  id: string;
  userName: string;
  overallScore: number;
  comment: string;
  createdAt: string;
  vehicleName: string | null;
  scoreBreakdown: Record<string, number>;
};

export function ReviewList({ reviews }: { reviews: Review[] }) {
  if (reviews.length === 0) {
    return (
      <div className="p-12 text-center bg-slate-50 rounded-3xl border-2 border-dashed border-slate-200">
        <p className="text-slate-400 font-medium italic">Encara no hi ha opinions per aquest taller. Sigues el primer!</p>
      </div>
    );
  }

  return (
    <div className="space-y-6">
      {reviews.map((review) => (
        <div key={review.id} className="bg-white rounded-2xl p-6 border border-slate-100 shadow-sm transition-all hover:shadow-md">
          <div className="flex justify-between items-start mb-4">
            <div className="flex items-center gap-3">
              <div className="w-10 h-10 rounded-full bg-teal-50 flex items-center justify-center text-teal-600">
                <User size={20} />
              </div>
              <div>
                <h4 className="font-bold text-slate-900 leading-none mb-1">{review.userName}</h4>
                <div className="flex items-center gap-2 text-xs text-slate-400 font-medium">
                  {new Date(review.createdAt).toLocaleDateString('ca-ES', { day: 'numeric', month: 'long', year: 'numeric' })}
                  {review.vehicleName && (
                    <>
                      <span className="w-1 h-1 rounded-full bg-slate-300" />
                      <span className="flex items-center gap-1">
                        <Car size={12} />
                        {review.vehicleName}
                      </span>
                    </>
                  )}
                </div>
              </div>
            </div>
            
            <div className={`px-3 py-1 rounded-lg font-black text-sm ${
              review.overallScore >= 8 ? 'bg-teal-50 text-teal-600' :
              review.overallScore >= 5 ? 'bg-amber-50 text-amber-600' :
              'bg-rose-50 text-rose-600'
            }`}>
              {review.overallScore.toFixed(1)}
            </div>
          </div>

          <p className="text-slate-600 leading-relaxed">
            {review.comment}
          </p>

          <div className="mt-6 pt-4 border-t border-slate-50 flex flex-wrap gap-4">
            {Object.entries(review.scoreBreakdown).map(([key, val]) => (
              <div key={key} className="flex items-center gap-1.5">
                <span className="text-[10px] uppercase tracking-wider text-slate-400 font-bold">{key}:</span>
                <span className="text-xs font-bold text-slate-700">{val}</span>
              </div>
            ))}
          </div>
        </div>
      ))}
    </div>
  );
}
