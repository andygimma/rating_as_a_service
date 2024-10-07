defmodule RatingAsAServiceWeb.FoodTruckJSON do
  alias RatingAsAService.Ratings.FoodTruck

  @doc """
  Renders a list of food_trucks.
  """
  def index(%{food_trucks: food_trucks}) do
    %{data: for(food_truck <- food_trucks, do: data(food_truck))}
  end

  @doc """
  Renders a single food_truck.
  """
  def show(%{food_truck: food_truck}) do
    %{data: data(food_truck)}
  end

  defp data(%FoodTruck{} = food_truck) do
    %{
      id: food_truck.id,
      name: food_truck.name,
      address: food_truck.address,
      food_items: food_truck.food_items,
      latitude: food_truck.latitude,
      longitude: food_truck.longitude
    }
  end
end
