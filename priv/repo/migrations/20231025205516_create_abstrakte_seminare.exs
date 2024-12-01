defmodule Lehrstuhl.Repo.Migrations.CreateAbstrakteSeminare do
  use Ecto.Migration

  def change do
    create table(:abstrakte_seminare, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :thema, :string
      add :beschreibung, :string
      add :mitarbeiter_id, references(:mitarbeiter, on_delete: :nothing, type: :uuid)

      timestamps()
    end

    create index(:abstrakte_seminare, [:mitarbeiter_id])
  end
end
