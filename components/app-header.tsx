"use client";

import Link from "next/link";
import { Car, Menu, Moon, ShieldCheck, Sun, Wrench } from "lucide-react";
import { useEffect, useState } from "react";

type Theme = "light" | "dark";

export function AppHeader() {
  const [theme, setTheme] = useState<Theme>("light");

  useEffect(() => {
    const savedTheme = window.localStorage.getItem("tallermatch-theme") as
      | Theme
      | null;
    const preferredTheme =
      savedTheme ??
      (window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light");

    setTheme(preferredTheme);
    document.documentElement.dataset.theme = preferredTheme;
  }, []);

  function toggleTheme() {
    const nextTheme = theme === "dark" ? "light" : "dark";
    setTheme(nextTheme);
    document.documentElement.dataset.theme = nextTheme;
    window.localStorage.setItem("tallermatch-theme", nextTheme);
  }

  return (
    <header className="topbar">
      <Link className="brand" href="/">
        <span className="brand-mark">
          <Wrench size={20} strokeWidth={2.4} />
        </span>
        <span>TallerMatch</span>
      </Link>
      <nav className="nav-actions" aria-label="Navegacio principal">
        <Link className="text-button" href="/vehicles">
          <Car size={17} />
          Els meus vehicles
        </Link>
        <Link className="text-button" href="/?verified=1">
          <ShieldCheck size={17} />
          Tallers verificats
        </Link>
        <Link className="primary-button" href="/login">
          <Car size={17} />
          Entrar amb Google
        </Link>
        <button
          className="icon-button"
          type="button"
          aria-label={theme === "dark" ? "Activar mode clar" : "Activar mode fosc"}
          onClick={toggleTheme}
        >
          {theme === "dark" ? <Sun size={19} /> : <Moon size={19} />}
        </button>
        <button className="icon-button" type="button" aria-label="Obrir menu">
          <Menu size={20} />
        </button>
      </nav>
    </header>
  );
}
