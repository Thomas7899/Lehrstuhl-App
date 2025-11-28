defmodule Lehrstuhl.Repo.Migrations.AddAlumniFieldsToStudents do
  use Ecto.Migration

  def change do
    alter table(:students) do
      add :status, :string, default: "aktiv", null: false
      add :abschluss_datum, :date
      add :abschluss_art, :string
    end
  end
end
