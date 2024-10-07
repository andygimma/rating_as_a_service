defmodule Mix.Tasks.FetchFoodTrucks do
  use Mix.Task

  alias RatingAsAService.ApiClient
  alias RatingAsAService.Ratings.FoodTruck
  alias RatingAsAService.Repo
  alias RatingAsAService.Ratings

  @shortdoc "Fetches all foodtrucks from the API"

  def run(_) do
    Mix.Task.run("app.start")
    url = "https://data.sfgov.org/resource/rqzj-sfat.json"
    case ApiClient.get_user(url) do
      {:ok, user_data} ->
        IO.puts("User Data:")
        Enum.each(user_data, &create_or_skip/1)

      {:error, reason} ->
        IO.puts("Error: #{reason}")
    end
  end

  defp create_or_skip(row) do
    case Repo.get_by(FoodTruck,
      latitude: row["latitude"],
      longitude: row["longitude"]
    ) do
      nil ->
        a = Ratings.create_food_truck(%{
          name: row["applicant"],
          address: row["address"],
          food_items: row["fooditems"],
          latitude: row["latitude"],
          longitude: row["longitude"]
        })
      food_truck ->
        IO.puts("Skipping #{food_truck.name}")
    end
  end
end
