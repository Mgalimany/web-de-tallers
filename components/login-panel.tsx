"use client";

import { Chrome, ShieldCheck, Wrench } from "lucide-react";
import { AppHeader } from "@/components/app-header";
import { supabase } from "@/lib/supabase";

export function LoginPanel() {
  async function signInWithGoogle() {
    if (!supabase) {
      return;
    }

    await supabase.auth.signInWithOAuth({
      provider: "google",
      options: {
        redirectTo: `${window.location.origin}/`
      }
    });
  }

  return (
    <main className="app-shell">
      <AppHeader />
      <section className="auth-shell">
        <div className="auth-panel">
          <span className="brand-mark auth-mark">
            <Wrench size={25} />
          </span>
          <h1>Entra per guardar vehicles i valorar tallers</h1>
          <p>
            El compte permet tenir el teu garatge, deixar reviews 0-10 i
            demanar cites o pressupostos als tallers.
          </p>
          <button className="primary-button auth-button" type="button" onClick={signInWithGoogle}>
            <Chrome size={18} />
            Continuar amb Google
          </button>
          <div className="auth-note">
            <ShieldCheck size={17} />
            Mes endavant afegirem MFA/TOTP per comptes de taller.
          </div>
        </div>
      </section>
    </main>
  );
}
