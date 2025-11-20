defmodule Lehrstuhl.Klausuren.Klausurergebnis do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  alias Lehrstuhl.Klausuren.Klausur
  alias Lehrstuhl.Persons.Student

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "klausurergebnisse" do
    field :punkte, :integer
    field :note, :float
    field :status, Ecto.Enum, values: [:bestanden, :nicht_bestanden]
    field :pruefungsdatum, :date
    field :versuche, :integer, default: 0
    belongs_to :student, Student
    belongs_to :klausur, Klausur

    timestamps()
  end

  @doc false
  def changeset(klausurergebnis, attrs) do
    klausurergebnis
    |> cast(attrs, [:punkte, :note, :status, :pruefungsdatum, :student_id, :klausur_id, :versuche])
    |> validate_required([:student_id, :klausur_id])
    |> validate_inclusion(:versuche, 0..3, message: "Attempt must be between 0 and 3")
  end
end
