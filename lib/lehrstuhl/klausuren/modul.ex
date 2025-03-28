defmodule Lehrstuhl.Klausuren.Modul do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  alias Lehrstuhl.Persons.Mitarbeiter

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "module" do
    field :modulnummer, :string
    field :titel, :string
    field :einsendearbeiten, :string
    field :ects, Ecto.Enum, values: [fünf: 5, zehn: 10]
    field :hilfsmittel, :string
    field :stoffeingrenzung, :string
    belongs_to :mitarbeiter, Mitarbeiter
    belongs_to :lehrstuhlinhaber, Mitarbeiter

    timestamps()
  end

  @doc false
  def changeset(modul, attrs) do
    modul
    |> cast(attrs, [:modulnummer, :titel, :ects, :hilfsmittel, :stoffeingrenzung, :mitarbeiter_id, :lehrstuhlinhaber_id])
    |> validate_required([:mitarbeiter_id])
  end
end
