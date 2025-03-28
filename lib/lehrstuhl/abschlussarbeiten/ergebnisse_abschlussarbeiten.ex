defmodule Lehrstuhl.Abschlussarbeiten.ErgebnisseAbschlussarbeiten do
  use Ecto.Schema
  import Ecto.Changeset

  alias Lehrstuhl.Abschlussarbeiten.KonkreteAbschlussarbeiten
  alias Lehrstuhl.Persons.Student

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "ergebnisse_abschlussarbeiten" do
    field :status, Ecto.Enum, values: [:bestanden, :nichtbestanden]
    field :matrikelnummer, :string
    field :studienniveau, Ecto.Enum, values: [:bachelorarbeit, :masterarbeit]
    field :korrekturdatum, :date
    field :note, :decimal
    field :versuche, :integer, default: 0

    belongs_to :student, Student
    belongs_to :konkrete_abschlussarbeiten, KonkreteAbschlussarbeiten

    timestamps()
  end

  @doc false
  def changeset(ergebnisse_abschlussarbeiten, attrs) do
    ergebnisse_abschlussarbeiten
    |> cast(attrs, [:matrikelnummer, :studienniveau, :status, :korrekturdatum, :note, :student_id, :konkrete_abschlussarbeiten_id, :versuche])
    |> validate_required([:matrikelnummer, :studienniveau, :status, :korrekturdatum, :note])
    |> foreign_key_constraint(:konkrete_abschlussarbeiten_id, name: "ergebnisse_abschlussarbeiten_konkrete_abschlussarbeiten_id_fkey")
end
end
