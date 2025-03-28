defmodule Lehrstuhl.Repo.Migrations.CreateKlausuren do
  use Ecto.Migration

  def change do
    create table(:klausuren, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :kenner, :string
      add :beschreibung, :string
      add :punkteGesamt, :integer
      add :semester, :string
      add :klausurdatum, :date
      add :ort, :string
      add :modul_id, references(:module, on_delete: :nothing, type: :uuid)

      timestamps()
    end

    create unique_index(:klausuren, [:kenner])
  end
end
