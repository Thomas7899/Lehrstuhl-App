defmodule Lehrstuhl.Repo.Migrations.CreateModule do
  use Ecto.Migration

  def change do
    create table(:module, primary_key: false) do
      add :id, :binary_id, primary_key: true
      # add :betreuer, :string
      add :mitarbeiter_id, references(:mitarbeiter, on_delete: :nothing, type: :uuid)
      add :lehrstuhlinhaber_id, references(:mitarbeiter, on_delete: :nothing, type: :uuid)
      add :name, :string

      timestamps()
    end
  end
end
