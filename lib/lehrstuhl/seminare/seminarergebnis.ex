defmodule Lehrstuhl.Seminare.Seminarergebnis do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset
  alias Lehrstuhl.Persons.Student
  alias Lehrstuhl.Seminare.Seminar

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "seminarergebnisse" do
    field :fachvortrag_titel, :string
    field :fachvortrag_datum, :date
    field :fachvortrag_start, :time
    field :fachvortrag_stop, :time
    field :fachvortrag_notenvorschlag, :decimal
    field :fachvortrag_teilnote, :decimal
    field :seminararbeit_titel, :string
    field :seminararbeit_einreichung, :date
    field :seminararbeit_notenvorschlag, :decimal
    field :seminararbeit_teilnote, :decimal
    field :gesamtergebnis, :decimal
    field :versuche, :integer, default: 0
    belongs_to :student, Student
    belongs_to :seminar, Seminar

    timestamps()
  end

  @doc false
  def changeset(seminarergebnis, attrs) do
    seminarergebnis
    |> cast(attrs, [
      :fachvortrag_titel,
      :fachvortrag_datum,
      :fachvortrag_start,
      :fachvortrag_stop,
      :fachvortrag_notenvorschlag,
      :fachvortrag_teilnote,
      :seminararbeit_titel,
      :seminararbeit_einreichung,
      :seminararbeit_notenvorschlag,
      :seminararbeit_teilnote,
      :gesamtergebnis,
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
