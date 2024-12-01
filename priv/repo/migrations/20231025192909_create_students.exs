defmodule Lehrstuhl.Repo.Migrations.CreateStudents do
  use Ecto.Migration

  def change do
    create table(:students, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :email, :string
      add :matrikelnummer, :string
      add :vorname, :string
      add :nachname, :string
      add :geburtsdatum, :date

      timestamps()
    end

    create unique_index(:students, [:matrikelnummer])
    create unique_index(:students, [:email])
  end
end
