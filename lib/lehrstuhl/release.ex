defmodule Lehrstuhl.Release do
  @moduledoc """
  Used for executing DB release tasks when run in production without Mix
  installed.
  """
  @app :lehrstuhl

  @doc """
  alias Lehrstuhl.Repo
  require Logger

  def migrate do
    Logger.info("Running migrations...")
    {:ok, _} = Application.ensure_all_started(:lehrstuhl)
    Ecto.Migrator.run(Repo, Application.app_dir(:lehrstuhl, "priv/repo/migrations"), :up, all: true)
  end

  def seed do
    Logger.info("Running seeds...")
    {:ok, _} = Application.ensure_all_started(:lehrstuhl)
    Code.eval_file(Application.app_dir(:lehrstuhl, "priv/repo/seeds.exs"))
  end
  """


  def migrate do
    load_app()

    for repo <- repos() do
      {:ok, _, _} = Ecto.Migrator.with_repo(repo, &Ecto.Migrator.run(&1, :up, all: true))
    end
  end

  def rollback(repo, version) do
    load_app()
    {:ok, _, _} = Ecto.Migrator.with_repo(repo, &Ecto.Migrator.run(&1, :down, to: version))
  end

  defp repos do
    Application.fetch_env!(@app, :ecto_repos)
  end

  defp load_app do
    Application.load(@app)
  end
end
