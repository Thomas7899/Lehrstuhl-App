defmodule Lehrstuhl.Persons do
  @moduledoc """
  The Persons context.
  """

  import Ecto.Query, warn: false
  alias Lehrstuhl.Repo

  alias Lehrstuhl.Persons.Mitarbeiter

  @doc """
  Returns the list of mitarbeiter.

  ## Examples

      iex> list_mitarbeiter()
      [%Mitarbeiter{}, ...]

  """
  def list_mitarbeiter do
    Repo.all(Mitarbeiter)
  end

  @doc """
  Gets a single mitarbeiter.

  Raises `Ecto.NoResultsError` if the Mitarbeiter does not exist.

  ## Examples

      iex> get_mitarbeiter!(123)
      %Mitarbeiter{}

      iex> get_mitarbeiter!(456)
      ** (Ecto.NoResultsError)

  """
  def get_mitarbeiter!(id) do
    Mitarbeiter
    |> Repo.get!(id)
    |> Repo.preload([
      :konkrete_abschlussarbeiten,
      :abstrakte_abschlussarbeiten,
      :abstrakte_seminare,
      :seminare,
      :module
    ])
  end


  @doc """
  Creates a mitarbeiter.

  ## Examples

      iex> create_mitarbeiter(%{field: value})
      {:ok, %Mitarbeiter{}}

      iex> create_mitarbeiter(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_mitarbeiter(attrs \\ %{}) do
    %Mitarbeiter{}
    |> Mitarbeiter.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a mitarbeiter.

  ## Examples

      iex> update_mitarbeiter(mitarbeiter, %{field: new_value})
      {:ok, %Mitarbeiter{}}

      iex> update_mitarbeiter(mitarbeiter, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_mitarbeiter(%Mitarbeiter{} = mitarbeiter, attrs) do
    mitarbeiter
    |> Mitarbeiter.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a mitarbeiter.

  ## Examples

      iex> delete_mitarbeiter(mitarbeiter)
      {:ok, %Mitarbeiter{}}

      iex> delete_mitarbeiter(mitarbeiter)
      {:error, %Ecto.Changeset{}}

  """
  def delete_mitarbeiter(%Mitarbeiter{} = mitarbeiter) do
    Repo.delete(mitarbeiter)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking mitarbeiter changes.

  ## Examples

      iex> change_mitarbeiter(mitarbeiter)
      %Ecto.Changeset{data: %Mitarbeiter{}}

  """
  def change_mitarbeiter(%Mitarbeiter{} = mitarbeiter, attrs \\ %{}) do
    Mitarbeiter.changeset(mitarbeiter, attrs)
  end

  alias Lehrstuhl.Persons.Student

  # Zählt alle Studenten
  def count_students do
    Repo.aggregate(Student, :count, :id)
  end

  def search_students(query) do
  search_term = "%#{query}%"

  from(s in Student,
    where: ilike(s.vorname, ^search_term) or
           ilike(s.nachname, ^search_term) or
           ilike(s.matrikelnummer, ^search_term) or
           ilike(s.email, ^search_term)
  )
  |> Repo.all()
end


  def get_student_by_matrikelnummer(matrikelnummer) do
    Repo.get_by(Lehrstuhl.Persons.Student, matrikelnummer: matrikelnummer)
  end

  @doc """
  Returns the list of students.

  ## Examples

      iex> list_students()
      [%Student{}, ...]

  """
  def list_students do
    Repo.all(Student)
  end

  @doc """
  Gets a single student.

  Raises `Ecto.NoResultsError` if the Student does not exist.

  ## Examples

      iex> get_student!(123)
      %Student{}

      iex> get_student!(456)
      ** (Ecto.NoResultsError)

  """

def get_student!(id) do
  Student
  |> Repo.get!(id)
  |> Repo.preload([
    # 1. Abschlussarbeiten laden (inkl. verknüpfte Daten)
    konkrete_abschlussarbeiten: [],
    ergebnisse_abschlussarbeiten: [:konkrete_abschlussarbeiten],

    # 2. Klausurergebnisse laden -> Klausur -> Modul
    klausurergebnisse: [klausur: :modul],

    # 3. Seminarergebnisse laden -> Seminar
    seminarergebnisse: :seminar
  ])
end


  @doc """
  Creates a student.

  ## Examples

      iex> create_student(%{field: value})
      {:ok, %Student{}}

      iex> create_student(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_student(attrs \\ %{}) do
    %Student{}
    |> Student.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a student.

  ## Examples

      iex> update_student(student, %{field: new_value})
      {:ok, %Student{}}

      iex> update_student(student, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_student(%Student{} = student, attrs) do
    student
    |> Student.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a student.

  ## Examples

      iex> delete_student(student)
      {:ok, %Student{}}

      iex> delete_student(student)
      {:error, %Ecto.Changeset{}}

  """
  def delete_student(%Student{} = student) do
    Repo.delete(student)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking student changes.

  ## Examples

      iex> change_student(student)
      %Ecto.Changeset{data: %Student{}}

  """
  def change_student(%Student{} = student, attrs \\ %{}) do
    Student.changeset(student, attrs)
  end
end
