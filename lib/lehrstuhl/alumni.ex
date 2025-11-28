defmodule Lehrstuhl.Alumni do
  @moduledoc """
  Auswertungen für Alumni-Management und Semester-Statistiken.
  """

  import Ecto.Query, warn: false

  alias Lehrstuhl.Repo
  alias Lehrstuhl.Persons.Student
  alias Lehrstuhl.Klausuren.Klausurergebnis
  alias Lehrstuhl.Seminare.{Seminar, Seminarergebnis}
  alias Lehrstuhl.Abschlussarbeiten.{KonkreteAbschlussarbeiten, ErgebnisseAbschlussarbeiten}

  # alle Alumni (Status = :alumni)
  def count_alumni do
    from(s in Student, where: s.status == :alumni, select: count(s.id))
    |> Repo.one()
  end

  # einfache Semester-Statistik
  def semester_statistics(semester) do
    %{
      klausur_teilnehmer: count_klausur_teilnehmer(semester),
      seminar_teilnehmer: count_seminar_teilnehmer(semester),
      abschlussarbeiten: count_abschlussarbeiten(semester)
    }
  end

  def list_alumni do
    from(s in Student,
      where: s.status == :alumni,
      order_by: [asc: s.nachname, asc: s.vorname]
    )
    |> Repo.all()
  end

  defp count_klausur_teilnehmer(semester) do
    from(e in Klausurergebnis,
      join: k in assoc(e, :klausur),
      where: k.semester == ^semester,
      select: count(e.id)
    )
    |> Repo.one()
  end

  defp count_seminar_teilnehmer(semester) do
    from(se in Seminarergebnis,
      join: s in assoc(se, :seminar),
      where: s.semester == ^semester,
      select: count(se.id)
    )
    |> Repo.one()
  end

  defp count_abschlussarbeiten(semester) do
    from(e in ErgebnisseAbschlussarbeiten,
      join: k in assoc(e, :konkrete_abschlussarbeiten),
      where: k.semester == ^semester,
      select: count(e.id)
    )
    |> Repo.one()
  end
end
