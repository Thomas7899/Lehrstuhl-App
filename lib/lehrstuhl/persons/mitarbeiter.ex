defmodule Lehrstuhl.Persons.Mitarbeiter do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  alias Lehrstuhl.Abschlussarbeiten.{KonkreteAbschlussarbeiten, AbstrakteAbschlussarbeiten}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "mitarbeiter" do
    field :email, :string
    field :nachname, :string
    field :vorname, :string
    field :rolle, Ecto.Enum, values: [:professor, :wissenschaftlicher_mitarbeiter, :nicht_wissenschaftlicher_mitarbeiter, :betreuer, :prüfer]
    has_many :konkrete_abschlussarbeiten, KonkreteAbschlussarbeiten
    has_many :abstrakte_abschlussarbeiten, AbstrakteAbschlussarbeiten

    timestamps()
  end

  @doc false
  def changeset(mitarbeiter, attrs) do
    mitarbeiter
    |> cast(attrs, [:email, :nachname, :vorname, :rolle])
    |> validate_required([:email, :nachname, :vorname, :rolle])
    |> unique_constraint(:email)
  end
end
