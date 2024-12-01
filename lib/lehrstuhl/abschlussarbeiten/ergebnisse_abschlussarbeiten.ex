defmodule Lehrstuhl.Abschlussarbeiten.ErgebnisseAbschlussarbeiten do
  use Ecto.Schema
  import Ecto.Changeset

  alias Lehrstuhl.Persons.Student
  alias Lehrstuhl.Abschlussarbeiten.KonkreteAbschlussarbeiten

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "ergebnisse_abschlussarbeiten" do
    field :status, Ecto.Enum, values: [:bestanden, :nichtbestanden]
    field :matrikelnummer, :string
    field :studienniveau, Ecto.Enum, values: [:bachelorarbeit, :masterarbeit]
    field :korrekturdatum, :date
    field :note, :decimal
    belongs_to :student, Student # Assoziation hinzugefügt
    belongs_to :konkrete_abschlussarbeiten, KonkreteAbschlussarbeiten # Assoziation hinzugefügt

    timestamps()
  end

  @doc false
  def changeset(ergebnisse_abschlussarbeiten, attrs) do
    ergebnisse_abschlussarbeiten
    |> cast(attrs, [:matrikelnummer, :studienniveau, :status, :korrekturdatum, :note])
    |> validate_required([:matrikelnummer, :studienniveau, :status, :korrekturdatum, :note])
  end
end
