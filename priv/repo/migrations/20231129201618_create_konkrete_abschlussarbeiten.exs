defmodule Lehrstuhl.Repo.Migrations.CreateKonkreteAbschlussarbeiten do
  use Ecto.Migration

  def change do
    create table(:konkrete_abschlussarbeiten, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :betreuer, :string
      add :forschungsprojekt, :string
      add :semester, :string
      add :matrikelnummer, :string
      add :angepasste_themenskizze, :string
      add :gesetzte_schwerpunkte, :string
      add :anmeldung_pruefungsamt, :date
      add :abgabedatum, :date
      add :studienniveau, :string
      add :student_id, references(:students, on_delete: :delete_all, type: :binary_id)
      add :mitarbeiter_id, references(:mitarbeiter, on_delete: :delete_all, type: :binary_id)
      add :abstrakte_abschlussarbeiten_id, references(:abstrakte_abschlussarbeiten, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

  end
end
