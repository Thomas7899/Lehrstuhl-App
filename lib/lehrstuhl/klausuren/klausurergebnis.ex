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
    belongs_to :student, Student
    belongs_to :klausur, Klausur

    timestamps()
  end

  @doc false
  def changeset(klausurergebnis, attrs) do
    klausurergebnis
    |> cast(attrs, [:punkte, :student_id, :klausur_id])
    |> validate_required([:student_id, :klausur_id])
  end
end
