defmodule Lehrstuhl.Seminare do
  @moduledoc """
  The Seminare context.
  """

  import Ecto.Changeset
  import Ecto.Query, warn: false

  alias Lehrstuhl.Repo
  alias Lehrstuhl.Seminare.Seminarergebnis
  alias Lehrstuhl.Seminare.Seminar

    #Suchfunktion
def filter_seminare(filter) do
  Seminare
  |> search_by(filter["q"])
  |> Repo.all()
end

defp search_by(query, q) when q in ["", nil], do: query

defp search_by(query, q) do
  where(query, [i], ilike(i.titel, ^"%#{q}%"))
end

  @doc """
  Returns the list of seminarergebnisse.

  ## Examples

      iex> list_seminarergebnisse()
      [%Seminarergebnis{}, ...]

  """
  def list_seminarergebnisse do
    Seminarergebnis
    |> Repo.all()
    |> Repo.preload([:seminar, :student])
  end

  @doc """
  Returns the list of seminarergebnisse without preloading.
  """
  def list_seminarergebnisse_wo_preload do
    Repo.all(Seminarergebnis)
  end

  @doc """
  Gets a single seminarergebnis.

  Raises `Ecto.NoResultsError` if the Seminarergebnis does not exist.
  """
  def get_seminarergebnis!(id),
    do: Repo.get!(Seminarergebnis, id) |> Repo.preload([:seminar, :student])

  @doc """
  Gets a single seminarergebnis without preloading student.

  Raises `Ecto.NoResultsError` if the Seminarergebnis does not exist.
  """
  def get_seminarergebnis_wo_preload!(id), do: Repo.get!(Seminarergebnis, id)

  @doc """
  Creates a seminarergebnis.

  ## Examples

      iex> create_seminarergebnis(%{field: value})
      {:ok, %Seminarergebnis{}}

      iex> create_seminarergebnis(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_seminarergebnis(attrs \\ %{}) do
    %Seminarergebnis{}
    |> Seminarergebnis.changeset(attrs)
    |> unsafe_validate_unique([:seminar_id, :student_id], Lehrstuhl.Repo,
      error_key: :student_id,
      message: "students must be unique within seminars"
    )
    |> Repo.insert()
  end

  @doc """
  Updates a seminarergebnis.

  ## Examples

      iex> update_seminarergebnis(seminarergebnis, %{field: new_value})
      {:ok, %Seminarergebnis{}}

      iex> update_seminarergebnis(seminarergebnis, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_seminarergebnis(%Seminarergebnis{} = seminarergebnis, attrs) do
    seminarergebnis
    |> Seminarergebnis.changeset(attrs)
    |> Repo.update()
    |> case do
      {:ok, seminarergebnis} -> {:ok, Repo.preload(seminarergebnis, [:seminar, :student])}
      error -> error
    end
  end

  @doc """
  Deletes a seminarergebnis.

  ## Examples

      iex> delete_seminarergebnis(seminarergebnis)
      {:ok, %Seminarergebnis{}}

      iex> delete_seminarergebnis(seminarergebnis)
      {:error, %Ecto.Changeset{}}

  """
  def delete_seminarergebnis(%Seminarergebnis{} = seminarergebnis) do
    Repo.delete(seminarergebnis)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking seminarergebnis changes.

  ## Examples

      iex> change_seminarergebnis(seminarergebnis)
      %Ecto.Changeset{data: %Seminarergebnis{}}

  """
  def change_seminarergebnis(%Seminarergebnis{} = seminarergebnis, attrs \\ %{}) do
    Seminarergebnis.changeset(seminarergebnis, attrs)
  end

  alias Lehrstuhl.Seminare.Seminar

  @doc """
  Returns the list of seminare.

  ## Examples

      iex> list_seminare()
      [%Seminar{}, ...]

  """
  def list_seminare do
    Seminar
    |> Repo.all()
    |> Repo.preload([:mitarbeiter, :abstraktes_seminar])
  end

  def list_seminare_without_preload do
    Repo.all(Seminar)
  end

  def list_seminarergebnisse_for_seminar(seminar_id) do
    # Create a schemaless query
    alias Lehrstuhl.Seminare.Seminarergebnis

    query =
      from(s in Seminarergebnis,
        where: s.seminar_id == ^seminar_id,
        join: p in assoc(s, :student),
        preload: [student: p]
      )

    # Call query
    Repo.all(query)
  end

  @doc """
  Gets a single seminar.

  Raises `Ecto.NoResultsError` if the Seminar does not exist.

  ## Examples

      iex> get_seminar!(123)
      %Seminar{}

      iex> get_seminar!(456)
      ** (Ecto.NoResultsError)

  """
  def get_seminar!(id),
    do: Repo.get!(Seminar, id) |> Repo.preload([:mitarbeiter, :abstraktes_seminar])

  def get_seminar_without_preload!(id), do: Repo.get!(Seminar, id)

  @doc """
  Creates a seminar.

  ## Examples

      iex> create_seminar(%{field: value})
      {:ok, %Seminar{}}

      iex> create_seminar(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_seminar(attrs \\ %{}) do
    %Seminar{}
    |> Seminar.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a seminar.

  ## Examples

      iex> update_seminar(seminar, %{field: new_value})
      {:ok, %Seminar{}}

      iex> update_seminar(seminar, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_seminar(%Seminar{} = seminar, attrs) do
    seminar
    |> Seminar.changeset(attrs)
    |> Repo.update()
    |> case do
      {:ok, seminar} -> {:ok, Repo.preload(seminar, [:mitarbeiter, :abstraktes_seminar])}
      error -> error
    end
  end

  def update_seminar_without_preload(%Seminar{} = seminar, attrs) do
    seminar
    |> Seminar.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a seminar.

  ## Examples

      iex> delete_seminar(seminar)
      {:ok, %Seminar{}}

      iex> delete_seminar(seminar)
      {:error, %Ecto.Changeset{}}

  """
  def delete_seminar(%Seminar{} = seminar) do
    Repo.delete(seminar)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking seminar changes.

  ## Examples

      iex> change_seminar(seminar)
      %Ecto.Changeset{data: %Seminar{}}

  """
  def change_seminar(%Seminar{} = seminar, attrs \\ %{}) do
    Seminar.changeset(seminar, attrs)
  end

  alias Lehrstuhl.Seminare.AbstraktesSeminar

  @doc """
  Returns the list of abstrakte_seminare.

  ## Examples

      iex> list_abstrakte_seminare()
      [%AbstraktesSeminar{}, ...]

  """
  def list_abstrakte_seminare do
    AbstraktesSeminar
    |> Repo.all()
    |> Repo.preload(:mitarbeiter)
  end

  def list_abstrakte_seminare_without_preload do
    Repo.all(AbstraktesSeminar)
  end

  def list_seminare_for_abstraktes_seminar(abstraktes_seminar_id) do
    # Create a schemaless query
    alias Lehrstuhl.Seminare.Seminar

    query =
      from(s in Seminar,
        where: s.abstraktes_seminar_id == ^abstraktes_seminar_id,
        join: m in assoc(s, :mitarbeiter),
        preload: [mitarbeiter: m]
      )

    # Call query
    Repo.all(query)
  end

  ## Custom Queries
  # 1. Welches Seminar wurde in welchem Semester angeboten?
  def list_seminare_for_semester(semester) do
    # Create a schemaless query
    alias Lehrstuhl.Seminare.Seminar

    query =
      from(s in Seminar,
        where: s.semester == ^semester,
        join: m in assoc(s, :mitarbeiter),
        preload: [mitarbeiter: m]
      )

    # Call query
    Repo.all(query)
  end

  @doc """
  Gets a single abstraktes_seminar.

  Raises `Ecto.NoResultsError` if the Abstraktes seminar does not exist.

  ## Examples

      iex> get_abstraktes_seminar!(123)
      %AbstraktesSeminar{}

      iex> get_abstraktes_seminar!(456)
      ** (Ecto.NoResultsError)

  """
  def get_abstraktes_seminar!(id),
    do: Repo.get!(AbstraktesSeminar, id) |> Repo.preload(:mitarbeiter)

  def get_abstraktes_seminar_without_preload!(id), do: Repo.get!(AbstraktesSeminar, id)

  @doc """
  Creates a abstraktes_seminar.

  ## Examples

      iex> create_abstraktes_seminar(%{field: value})
      {:ok, %AbstraktesSeminar{}}

      iex> create_abstraktes_seminar(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_abstraktes_seminar(attrs \\ %{}) do
    %AbstraktesSeminar{}
    |> AbstraktesSeminar.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a abstraktes_seminar.

  ## Examples

      iex> update_abstraktes_seminar(abstraktes_seminar, %{field: new_value})
      {:ok, %AbstraktesSeminar{}}

      iex> update_abstraktes_seminar(abstraktes_seminar, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_abstraktes_seminar(%AbstraktesSeminar{} = abstraktes_seminar, attrs) do
    abstraktes_seminar
    |> AbstraktesSeminar.changeset(attrs)
    |> Repo.update()
    |> case do
      {:ok, abstraktes_seminar} -> {:ok, Repo.preload(abstraktes_seminar, :mitarbeiter)}
      error -> error
    end
  end

  def update_abstraktes_seminar_without_preload(%AbstraktesSeminar{} = abstraktes_seminar, attrs) do
    abstraktes_seminar
    |> AbstraktesSeminar.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a abstraktes_seminar.

  ## Examples

      iex> delete_abstraktes_seminar(abstraktes_seminar)
      {:ok, %AbstraktesSeminar{}}

      iex> delete_abstraktes_seminar(abstraktes_seminar)
      {:error, %Ecto.Changeset{}}

  """
  def delete_abstraktes_seminar(%AbstraktesSeminar{} = abstraktes_seminar) do
    Repo.delete(abstraktes_seminar)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking abstraktes_seminar changes.

  ## Examples

      iex> change_abstraktes_seminar(abstraktes_seminar)
      %Ecto.Changeset{data: %AbstraktesSeminar{}}

  """
  def change_abstraktes_seminar(%AbstraktesSeminar{} = abstraktes_seminar, attrs \\ %{}) do
    AbstraktesSeminar.changeset(abstraktes_seminar, attrs)
  end
end
