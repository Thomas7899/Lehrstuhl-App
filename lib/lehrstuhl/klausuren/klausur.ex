defmodule Lehrstuhl.Klausuren.Klausur do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  alias Lehrstuhl.Klausuren.{Modul, Klausurergebnis}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "klausuren" do
    field :kenner, :string
    field :beschreibung, :string
    field :punkteGesamt, :integer
    field :semester, :string
    field :klausurdatum, :date
    field :ort, :string

    belongs_to :modul, Modul

    has_many :klausurergebnisse, Klausurergebnis

    timestamps()
  end

  @doc false
  def changeset(klausur, attrs) do
    klausur
    |> cast(attrs, [
      :kenner,
      :beschreibung,
      :punkteGesamt,
      :semester,
      :klausurdatum,
      :ort,
      :modul_id
    ])
    |> validate_required([
      :kenner,
      :beschreibung,
      :punkteGesamt,
      :semester,
      :klausurdatum,
      :ort,
      :modul_id
    ])
    |> unique_constraint(:kenner)
    |> validate_format(:semester, ~r/(WS|SS)-[0-9]{2}/,
      message: "Please use WS-YY/YY or SS-YY notation"
    )
  end
end
