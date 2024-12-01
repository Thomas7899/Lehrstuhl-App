defmodule Lehrstuhl.Repo do
  use Ecto.Repo,
    otp_app: :lehrstuhl,
    adapter: Ecto.Adapters.Postgres
end
