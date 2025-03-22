defmodule Lehrstuhl.Persons.Student do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  alias Lehrstuhl.Abschlussarbeiten.KonkreteAbschlussarbeiten

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "students" do
    field :email, :string
    field :matrikelnummer, :string
    field :vorname, :string
    field :nachname, :string
    field :geburtsdatum, :date
    has_one :konkrete_abschlussarbeiten, KonkreteAbschlussarbeiten
    has_many :klausurergebnisse, Lehrstuhl.Klausuren.Klausurergebnis
    has_many :klausuren, Lehrstuhl.Klausuren.Klausur

    timestamps()
  end

  @doc false
  def changeset(student, attrs) do
    student
    |> cast(attrs, [:email, :matrikelnummer, :vorname, :nachname, :geburtsdatum])
    |> validate_required([:email, :matrikelnummer, :vorname, :nachname, :geburtsdatum])
    |> unique_constraint(:matrikelnummer)
    |> unique_constraint(:email)
  end
end
