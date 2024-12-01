defmodule Lehrstuhl.Repo.Migrations.CreateMitarbeiter do
  use Ecto.Migration

  def change do
    create table(:mitarbeiter, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :email, :string
      add :nachname, :string
      add :vorname, :string
      add :rolle, :string

      timestamps()
    end

    create unique_index(:mitarbeiter, [:email])
  end
end
