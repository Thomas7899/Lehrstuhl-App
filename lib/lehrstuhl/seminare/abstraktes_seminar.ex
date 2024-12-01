defmodule Lehrstuhl.Seminare.AbstraktesSeminar do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset
  alias Lehrstuhl.Persons.Mitarbeiter

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "abstrakte_seminare" do
    field :thema, :string
    field :beschreibung, :string
    belongs_to :mitarbeiter, Mitarbeiter

    timestamps()
  end

  @doc false
  def changeset(abstraktes_seminar, attrs) do
    abstraktes_seminar
    |> cast(attrs, [:thema, :beschreibung, :mitarbeiter_id])
    |> validate_required([:thema, :beschreibung, :mitarbeiter_id])
  end
end
