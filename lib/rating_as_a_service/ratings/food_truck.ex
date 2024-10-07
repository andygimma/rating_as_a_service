defmodule RatingAsAService.Ratings.FoodTruck do
  use Ecto.Schema
  import Ecto.Changeset

  schema "food_trucks" do
    field :name, :string
    field :address, :string
    field :food_items, :string
    field :latitude, :float
    field :longitude, :float

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(food_truck, attrs) do
    food_truck
    |> cast(attrs, [:name, :address, :food_items, :latitude, :longitude])
    |> validate_required([:name, :address, :food_items, :latitude, :longitude])
  end
end
