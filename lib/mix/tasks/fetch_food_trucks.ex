defmodule Mix.Tasks.FetchFoodTrucks do
  use Mix.Task

  alias RatingAsAService.ApiClient

  @shortdoc "Fetches a user by ID from the API"

  def run(_) do
    Mix.Task.run("app.start")
    url = "https://data.sfgov.org/resource/rqzj-sfat.json"
    case ApiClient.get_user(url) do
      {:ok, user_data} ->
        IO.puts("User Data:")
        IO.inspect(user_data)

      {:error, reason} ->
        IO.puts("Error: #{reason}")
    end
  end
end
