defmodule Lehrstuhl.Repo.Migrations.CreateSeminarergebnisse do
  use Ecto.Migration

  def change do
    create table(:seminarergebnisse, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :fachvortrag_titel, :string
      add :fachvortrag_datum, :date
      add :fachvortrag_start, :time
      add :fachvortrag_stop, :time
      add :fachvortrag_notenvorschlag, :decimal
      add :fachvortrag_teilnote, :decimal
      add :seminararbeit_titel, :string
      add :seminararbeit_einreichung, :date
      add :seminararbeit_notenvorschlag, :decimal
      add :seminararbeit_teilnote, :decimal
      add :gesamtergebnis, :decimal
      add :student_id, references(:students, on_delete: :nothing, type: :uuid)
      add :seminar_id, references(:seminare, on_delete: :nothing, type: :uuid)
      add :versuche, :integer, default: 0

      timestamps()
    end

    create unique_index(:seminarergebnisse, [:student_id, :seminar_id])
  end
end
