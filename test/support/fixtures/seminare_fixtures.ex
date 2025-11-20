defmodule Lehrstuhl.SeminareFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Lehrstuhl.Seminare` context.
  """

  import Lehrstuhl.PersonsFixtures

  @doc """
  Generate a seminarergebnis.
  """
  def seminarergebnis_fixture(attrs \\ %{}) do
    student = student_fixture()
    seminar = seminar_fixture()

    {:ok, seminarergebnis} =
      attrs
      |> Enum.into(%{
        fachvortrag_titel: "some fachvortrag_titel",
        fachvortrag_datum: ~D[2023-10-24],
        fachvortrag_start: ~T[14:00:00],
        fachvortrag_stop: ~T[14:00:00],
        fachvortrag_notenvorschlag: "120.5",
        fachvortrag_teilnote: "120.5",
        seminararbeit_titel: "some seminararbeit_titel",
        seminararbeit_einreichung: ~D[2023-10-24],
        seminararbeit_notenvorschlag: "120.5",
        seminararbeit_teilnote: "120.5",
        gesamtergebnis: "120.5",
        student_id: student.id,
        seminar_id: seminar.id
      })
      |> Lehrstuhl.Seminare.create_seminarergebnis()

    seminarergebnis
  end

  @doc """
  Generate a seminar.
  """
  def seminar_fixture(attrs \\ %{}) do
    mitarbeiter = mitarbeiter_fixture()
    abstraktes_seminar = abstraktes_seminar_fixture()

    {:ok, seminar} =
      attrs
      |> Enum.into(%{
        abstraktes_seminar_id: abstraktes_seminar.id,
        mitarbeiter_id: mitarbeiter.id,
        titel: "some titel",
        aufnahmekapazitaet: 42,
        semester: "WS-2020",
        praesenzdatum: ~D[2023-10-25],
        ort: "some ort"
      })
      |> Lehrstuhl.Seminare.create_seminar()

    seminar
  end

  @doc """
  Generate a abstraktes_seminar.
  """
  def abstraktes_seminar_fixture(attrs \\ %{}) do
    mitarbeiter = mitarbeiter_fixture()

    {:ok, abstraktes_seminar} =
      attrs
      |> Enum.into(%{
        mitarbeiter_id: mitarbeiter.id,
        thema: "some thema",
        beschreibung: "some beschreibung"
      })
      |> Lehrstuhl.Seminare.create_abstraktes_seminar()

    abstraktes_seminar
  end
end
