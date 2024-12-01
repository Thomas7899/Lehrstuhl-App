defmodule Lehrstuhl.Repo.Migrations.CreateSeminare do
  use Ecto.Migration

  def change do
    create table(:seminare, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :titel, :string
      add :aufnahmekapazitaet, :integer
      add :semester, :string
      add :praesenzdatum, :date
      add :ort, :string
      add :mitarbeiter_id, references(:mitarbeiter, on_delete: :nothing, type: :uuid)

      add :abstraktes_seminar_id,
          references(:abstrakte_seminare, on_delete: :nothing, type: :uuid)

      timestamps()
    end

    create index(:seminare, [:mitarbeiter_id])
  end
end
