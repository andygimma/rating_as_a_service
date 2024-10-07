defmodule RatingAsAService.Repo.Migrations.CreateFoodTrucks do
  use Ecto.Migration

  def change do
    create table(:food_trucks) do
      add :name, :string
      add :address, :string
      add :food_items, :string
      add :latitude, :float
      add :longitude, :float

      timestamps(type: :utc_datetime)
    end
  end
end
