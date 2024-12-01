defmodule Lehrstuhl.Klausuren.Klausur do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  alias Lehrstuhl.Klausuren.Modul

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "klausuren" do
    field :kenner, :string
    field :beschreibung, :string
    field :punkteGesamt, :integer
    field :semester, :string
    field :praesenzdatum, :date
    field :ort, :string
    belongs_to :modul, Modul

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
      :praesenzdatum,
      :ort,
      :modul_id
    ])
    |> validate_required([
      :kenner,
      :beschreibung,
      :punkteGesamt,
      :semester,
      :praesenzdatum,
      :ort,
      :modul_id
    ])
    |> unique_constraint(:kenner)
    |> validate_format(:semester, ~r/(WS|SS)-[0-9]{4}/,
      message: "Please use WS-YYYY or SS-YYYY Notation"
    )
  end
end
