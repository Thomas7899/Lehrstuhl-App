defmodule Lehrstuhl.PersonsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Lehrstuhl.Persons` context.
  """

  @doc """
  Generate a unique mitarbeiter email.
  """
  def unique_mitarbeiter_email, do: "some email#{System.unique_integer([:positive])}"

  @doc """
  Generate a mitarbeiter.
  """
  def mitarbeiter_fixture(attrs \\ %{}) do
    {:ok, mitarbeiter} =
      attrs
      |> Enum.into(%{
        email: unique_mitarbeiter_email(),
        nachname: "some nachname",
        vorname: "some vorname",
        rolle: :professor
      })
      |> Lehrstuhl.Persons.create_mitarbeiter()

    mitarbeiter
  end

  @doc """
  Generate a unique student email.
  """
  def unique_student_email, do: "some email#{System.unique_integer([:positive])}"

  @doc """
  Generate a unique student matrikelnummer.
  """
  def unique_student_matrikelnummer,
    do: "some matrikelnummer#{System.unique_integer([:positive])}"

  @doc """
  Generate a student.
  """
  def student_fixture(attrs \\ %{}) do
    {:ok, student} =
      attrs
      |> Enum.into(%{
        email: unique_student_email(),
        matrikelnummer: unique_student_matrikelnummer(),
        vorname: "some vorname",
        nachname: "some nachname",
        geburtsdatum: ~D[2023-10-24]
      })
      |> Lehrstuhl.Persons.create_student()

    student
  end
end
