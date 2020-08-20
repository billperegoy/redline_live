defmodule RedlineLive.Repo do
  use Ecto.Repo,
    otp_app: :redline_live,
    adapter: Ecto.Adapters.Postgres
end
