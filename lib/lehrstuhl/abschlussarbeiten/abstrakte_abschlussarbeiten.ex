defmodule Lehrstuhl.Abschlussarbeiten.AbstrakteAbschlussarbeiten do
  use Ecto.Schema
  import Ecto.Changeset

  #alias Lehrstuhl.Persons.Mitarbeiter
  #alias Lehrstuhl.Abschlussarbeiten.KonkreteAbschlussarbeiten

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "abstrakte_abschlussarbeiten" do
    field :betreuer, Ecto.Enum, values: [:hansen, :becker, :müller]
    field :forschungsprojekt, Ecto.Enum, values: [:sport, :tool, :imp]
    field :semester, :string
    field :thema, :string
    field :themenskizze, :string
    #has_many :konkrete_abschlussarbeiten, KonkreteAbschlussarbeiten
    belongs_to :mitarbeiter, Mitarbeiter

    timestamps()
  end

  @doc false
  def changeset(abstrakte_abschlussarbeiten, attrs) do
    abstrakte_abschlussarbeiten
    |> cast(attrs, [:betreuer,:forschungsprojekt, :semester, :thema, :themenskizze, :mitarbeiter_id])
    |> validate_required([:betreuer, :forschungsprojekt, :semester, :thema, :themenskizze, :mitarbeiter_id])
  end
end
