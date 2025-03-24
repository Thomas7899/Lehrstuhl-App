defmodule Lehrstuhl.Repo.Migrations.CreateKlausurergebnisse do
  use Ecto.Migration

  def change do
    create table(:klausurergebnisse, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :punkte, :integer
      add :versuche, :integer, default: 0
      add :student_id, references(:students, on_delete: :nothing, type: :uuid)
      add :klausur_id, references(:klausuren, on_delete: :nothing, type: :uuid)

      timestamps()
    end
  end
end
