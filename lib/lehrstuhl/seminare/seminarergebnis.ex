defmodule Lehrstuhl.Seminare.Seminarergebnis do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset
  alias Lehrstuhl.Persons.Student
  alias Lehrstuhl.Seminare.Seminar

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "seminarergebnisse" do
    field :mündlich_note, :float
    field :schriftlich_note, :float
    field :gesamt, :float
    field :versuche, :integer, default: 0
    belongs_to :student, Student
    belongs_to :seminar, Seminar

    timestamps()
  end

  @doc false
  def changeset(seminarergebnis, attrs) do
    seminarergebnis
    |> cast(attrs, [
      :mündlich_note,
      :schriftlich_note,
      :gesamt,
      :seminar_id,
      :student_id,
      :versuche
    ])
    |> validate_required([
      :seminar_id,
      :student_id
    ])
    |> unique_constraint([:seminar_id, :student_constraint])
  end
end
