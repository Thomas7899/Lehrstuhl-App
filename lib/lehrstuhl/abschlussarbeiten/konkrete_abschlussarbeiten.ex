defmodule Lehrstuhl.Abschlussarbeiten.KonkreteAbschlussarbeiten do
  use Ecto.Schema
  import Ecto.Changeset

  alias Lehrstuhl.Persons.{Student, Mitarbeiter}
  alias Lehrstuhl.Abschlussarbeiten.{ErgebnisseAbschlussarbeiten, AbstrakteAbschlussarbeiten}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "konkrete_abschlussarbeiten" do
    field :betreuer, Ecto.Enum, values: [:hansen, :becker, :müller]
    field :forschungsprojekt, Ecto.Enum, values: [:sport, :tool, :imp]
    field :semester, :string
    field :matrikelnummer, :string
    field :angepasste_themenskizze, :string
    field :gesetzte_schwerpunkte, :string
    field :anmeldung_pruefungsamt, :date
    field :abgabedatum, :date
    field :studienniveau, Ecto.Enum, values: [:bachelor, :master, :diplom]
    belongs_to :mitarbeiter, Mitarbeiter # Assoziation hinzugefügt
    belongs_to :student, Student # Assoziation hinzugefügt
    belongs_to :abstrakte_abschlussarbeiten, AbstrakteAbschlussarbeiten # Assoziation hinzugefügt
    has_one :ergebnisse_abschlussarbeiten, ErgebnisseAbschlussarbeiten # Assoziation hinzugefügt

    timestamps()
  end

  @doc false
  def changeset(konkrete_abschlussarbeiten, attrs) do
    konkrete_abschlussarbeiten
    |> cast(attrs, [:betreuer, :forschungsprojekt, :semester, :matrikelnummer, :angepasste_themenskizze, :gesetzte_schwerpunkte, :anmeldung_pruefungsamt, :abgabedatum, :studienniveau])
    |> validate_required([:betreuer, :forschungsprojekt, :semester, :matrikelnummer, :angepasste_themenskizze, :gesetzte_schwerpunkte, :anmeldung_pruefungsamt, :abgabedatum, :studienniveau])
    |> unique_constraint(:matrikelnummer)
    |> validate_format(:semester, ~r/(WS|SS)[0-9]{4}/,
      message: "Please use WS-YYYY or SS-YYYY Notation"
    )
  end
end
