defmodule Lehrstuhl.Persons.Student do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  alias Lehrstuhl.Abschlussarbeiten.KonkreteAbschlussarbeiten
  alias Lehrstuhl.Klausuren.Klausurergebnis

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "students" do
    field :email, :string
    field :matrikelnummer, :string
    field :vorname, :string
    field :nachname, :string
    field :geburtsdatum, :date

    # Seminare
    has_many :seminarergebnisse, Lehrstuhl.Seminare.Seminarergebnis

    # Abschlussarbeiten
    has_many :ergebnisse_abschlussarbeiten, Lehrstuhl.Abschlussarbeiten.ErgebnisseAbschlussarbeiten
    has_one :konkrete_abschlussarbeiten, KonkreteAbschlussarbeiten

    # Klausuren
    has_many :klausurergebnisse, Klausurergebnis
    has_many :klausuren, through: [:klausurergebnisse, :klausur]

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
