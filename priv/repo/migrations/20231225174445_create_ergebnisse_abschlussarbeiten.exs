defmodule Lehrstuhl.Repo.Migrations.CreateErgebnisseAbschlussarbeiten do
  use Ecto.Migration

  def change do
    create table(:ergebnisse_abschlussarbeiten, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :matrikelnummer, :string
      add :studienniveau, :string
      add :status, :string
      add :korrekturdatum, :date
      add :note, :decimal
      add :student_id, references(:students, on_delete: :nothing, type: :uuid)
      add :konkrete_abschlussarbeiten_id, references(:konkrete_abschlussarbeiten, on_delete: :delete_all, type: :uuid)
      timestamps()
    end

    create index(:abstrakte_abschlussarbeiten, [:student_id])

  end
end
