"use client";

import { CalendarDays, Car, Fuel, Plus, Save, Wrench } from "lucide-react";
import { useEffect, useState } from "react";
import { AppHeader } from "@/components/app-header";
import { fetchVehicleMakes, fetchVehicleModels } from "@/lib/vehicles";
import type {
  VehicleDraft,
  VehicleMakeOption,
  VehicleModelOption
} from "@/lib/types";

const initialVehicles: VehicleDraft[] = [
  { make: "BMW", model: "Serie 3", year: "2021", fuelType: "Diesel" },
  { make: "Toyota", model: "Corolla", year: "2020", fuelType: "Hybrid" }
];

export function VehicleGarage() {
  const [vehicles, setVehicles] = useState(initialVehicles);
  const [makes, setMakes] = useState<VehicleMakeOption[]>([]);
  const [models, setModels] = useState<VehicleModelOption[]>([]);
  const [draft, setDraft] = useState<VehicleDraft>({
    makeId: "",
    modelId: "",
    make: "",
    model: "",
    year: "",
    fuelType: "Gasoline"
  });

  useEffect(() => {
    fetchVehicleMakes().then(setMakes);
  }, []);

  useEffect(() => {
    if (!draft.makeId) {
      setModels([]);
      return;
    }

    fetchVehicleModels(draft.makeId).then(setModels);
  }, [draft.makeId]);

  function addVehicle() {
    if (!draft.make || !draft.model) {
      return;
    }

    setVehicles([...vehicles, draft]);
    setDraft({
      makeId: "",
      modelId: "",
      make: "",
      model: "",
      year: "",
      fuelType: "Gasoline"
    });
  }

  return (
    <main className="app-shell">
      <AppHeader />
      <section className="garage-shell">
        <div className="results-toolbar">
          <div>
            <h1>Els meus vehicles</h1>
            <p>
              Aquests vehicles serviran per prioritzar tallers compatibles,
              especialistes i serveis recomanats.
            </p>
          </div>
        </div>

        <div className="garage-grid">
          <section className="panel">
            <div className="panel-heading">
              <div>
                <h2 className="panel-title">Afegir vehicle</h2>
                <p className="panel-kicker">Marca, model, any i combustible.</p>
              </div>
              <Plus size={20} />
            </div>

            <div className="search-grid">
              <div className="filters">
                <div className="field">
                  <label htmlFor="garage-make">Marca</label>
                  <select
                    id="garage-make"
                    value={draft.makeId}
                    onChange={(event) => {
                      const make = makes.find(
                        (item) => item.id === event.target.value
                      );

                      setDraft({
                        ...draft,
                        makeId: make?.id ?? "",
                        make: make?.name ?? "",
                        modelId: "",
                        model: ""
                      });
                    }}
                  >
                    <option value="">Selecciona marca</option>
                    {makes.map((make) => (
                      <option key={make.id} value={make.id}>
                        {make.name}
                      </option>
                    ))}
                  </select>
                </div>
                <div className="field">
                  <label htmlFor="garage-model">Model</label>
                  <select
                    id="garage-model"
                    value={draft.modelId}
                    disabled={!draft.makeId}
                    onChange={(event) => {
                      const model = models.find(
                        (item) => item.id === event.target.value
                      );

                      setDraft({
                        ...draft,
                        modelId: model?.id ?? "",
                        model: model?.name ?? ""
                      });
                    }}
                  >
                    <option value="">
                      {draft.makeId ? "Selecciona model" : "Tria marca abans"}
                    </option>
                    {models.map((model) => (
                      <option key={model.id} value={model.id}>
                        {model.name}
                      </option>
                    ))}
                  </select>
                </div>
              </div>

              <div className="filters">
                <div className="field">
                  <label htmlFor="garage-year">Any</label>
                  <input
                    id="garage-year"
                    value={draft.year}
                    onChange={(event) =>
                      setDraft({ ...draft, year: event.target.value })
                    }
                    placeholder="2022"
                  />
                </div>
                <div className="field">
                  <label htmlFor="garage-fuel">Combustible</label>
                  <select
                    id="garage-fuel"
                    value={draft.fuelType}
                    onChange={(event) =>
                      setDraft({ ...draft, fuelType: event.target.value })
                    }
                  >
                    <option>Gasoline</option>
                    <option>Diesel</option>
                    <option>Hybrid</option>
                    <option>Plug-in hybrid</option>
                    <option>Electric</option>
                  </select>
                </div>
              </div>

              <button className="primary-button" type="button" onClick={addVehicle}>
                <Save size={17} />
                Guardar vehicle
              </button>
            </div>
          </section>

          <section className="garage-list">
            {vehicles.map((vehicle) => (
              <article className="workshop-card" key={`${vehicle.make}-${vehicle.model}`}>
                <div className="vehicle-card">
                  <span className="vehicle-icon">
                    <Car size={21} />
                  </span>
                  <div>
                    <strong>
                      {vehicle.make} {vehicle.model}
                    </strong>
                    <span>
                      {vehicle.year || "Any pendent"} · {vehicle.fuelType}
                    </span>
                  </div>
                </div>
                <div className="metric-row">
                  <div className="metric">
                    <strong>
                      <Fuel size={15} /> {vehicle.fuelType}
                    </strong>
                    <span>Motor</span>
                  </div>
                  <div className="metric">
                    <strong>
                      <CalendarDays size={15} /> {vehicle.year || "-"}
                    </strong>
                    <span>Any</span>
                  </div>
                  <div className="metric">
                    <strong>
                      <Wrench size={15} /> 4
                    </strong>
                    <span>Serveis recomanats</span>
                  </div>
                </div>
              </article>
            ))}
          </section>
        </div>
      </section>
    </main>
  );
}
