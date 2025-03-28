defmodule Lehrstuhl.Repo.Migrations.CreateSeminarergebnisse do
  use Ecto.Migration

  def change do
    create table(:seminarergebnisse, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :mündlich_note, :float
      add :schriftlich_note, :float
      add :gesamt, :float
      add :student_id, references(:students, on_delete: :nothing, type: :uuid)
      add :seminar_id, references(:seminare, on_delete: :nothing, type: :uuid)
      add :versuche, :integer, default: 0

      timestamps()
    end

    create unique_index(:seminarergebnisse, [:student_id, :seminar_id])
  end
end
