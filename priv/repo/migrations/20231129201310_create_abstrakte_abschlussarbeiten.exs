defmodule Lehrstuhl.Repo.Migrations.CreateAbstrakteAbschlussarbeiten do
  use Ecto.Migration

  def change do
    create table(:abstrakte_abschlussarbeiten, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :betreuer, :string
      add :forschungsprojekt, :string
      add :semester, :string
      add :thema, :string
      add :themenskizze, :string
      add :mitarbeiter_id, references(:mitarbeiter, on_delete: :nothing, type: :uuid)

      timestamps()
    end
    flush()
    create index(:abstrakte_abschlussarbeiten, [:mitarbeiter_id])
  end
end
