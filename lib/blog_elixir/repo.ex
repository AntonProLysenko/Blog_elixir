defmodule BlogElixir.Repo do
  use Ecto.Repo,
    otp_app: :blog_elixir,
    adapter: Ecto.Adapters.Postgres
end
