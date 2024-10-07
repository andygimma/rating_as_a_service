defmodule RatingAsAService.RatingsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `RatingAsAService.Ratings` context.
  """

  @doc """
  Generate a food_truck.
  """
  def food_truck_fixture(attrs \\ %{}) do
    {:ok, food_truck} =
      attrs
      |> Enum.into(%{
        address: "some address",
        food_items: "some food_items",
        latitude: 120.5,
        longitude: 120.5,
        name: "some name"
      })
      |> RatingAsAService.Ratings.create_food_truck()

    food_truck
  end
end
