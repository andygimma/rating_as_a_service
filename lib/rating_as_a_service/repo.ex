defmodule RatingAsAService.Repo do
  use Ecto.Repo,
    otp_app: :rating_as_a_service,
    adapter: Ecto.Adapters.Postgres
end
