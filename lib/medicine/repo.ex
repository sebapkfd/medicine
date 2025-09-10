defmodule Medicine.Repo do
  use Ecto.Repo,
    otp_app: :medicine,
    adapter: Ecto.Adapters.Postgres
end
