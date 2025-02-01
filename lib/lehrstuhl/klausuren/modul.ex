defmodule Lehrstuhl.Klausuren.Modul do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  alias Lehrstuhl.Persons.Mitarbeiter

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "module" do
    field :name, :string
    belongs_to :mitarbeiter, Mitarbeiter
    belongs_to :lehrstuhlinhaber, Mitarbeiter

    timestamps()
  end

  @doc false
  def changeset(modul, attrs) do
    modul
    |> cast(attrs, [:mitarbeiter_id, :lehrstuhlinhaber_id, :name])
    |> validate_required([:mitarbeiter_id, :name])
  end
end
