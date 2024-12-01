defmodule Lehrstuhl.Seminare.Seminar do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset
  alias Lehrstuhl.Persons.Mitarbeiter
  alias Lehrstuhl.Seminare.AbstraktesSeminar

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "seminare" do
    field :titel, :string
    field :aufnahmekapazitaet, :integer
    field :semester, :string
    field :praesenzdatum, :date
    field :ort, :string
    belongs_to :mitarbeiter, Mitarbeiter
    belongs_to :abstraktes_seminar, AbstraktesSeminar

    timestamps()
  end

  @doc false
  def changeset(seminar, attrs) do
    seminar
    |> cast(attrs, [
      :abstraktes_seminar_id,
      :titel,
      :aufnahmekapazitaet,
      :semester,
      :praesenzdatum,
      :ort,
      :mitarbeiter_id
    ])
    |> validate_required([
      :abstraktes_seminar_id,
      :titel,
      :aufnahmekapazitaet,
      :semester,
      :praesenzdatum,
      :ort,
      :mitarbeiter_id
    ])
  end
end
