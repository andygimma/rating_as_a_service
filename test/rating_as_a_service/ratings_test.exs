defmodule RatingAsAService.RatingsTest do
  use RatingAsAService.DataCase

  alias RatingAsAService.Ratings

  describe "food_trucks" do
    alias RatingAsAService.Ratings.FoodTruck

    import RatingAsAService.RatingsFixtures

    @invalid_attrs %{name: nil, address: nil, food_items: nil, latitude: nil, longitude: nil}

    test "list_food_trucks/0 returns all food_trucks" do
      food_truck = food_truck_fixture()
      assert Ratings.list_food_trucks() == [food_truck]
    end

    test "get_food_truck!/1 returns the food_truck with given id" do
      food_truck = food_truck_fixture()
      assert Ratings.get_food_truck!(food_truck.id) == food_truck
    end

    test "create_food_truck/1 with valid data creates a food_truck" do
      valid_attrs = %{name: "some name", address: "some address", food_items: "some food_items", latitude: 120.5, longitude: 120.5}

      assert {:ok, %FoodTruck{} = food_truck} = Ratings.create_food_truck(valid_attrs)
      assert food_truck.name == "some name"
      assert food_truck.address == "some address"
      assert food_truck.food_items == "some food_items"
      assert food_truck.latitude == 120.5
      assert food_truck.longitude == 120.5
    end

    test "create_food_truck/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ratings.create_food_truck(@invalid_attrs)
    end

    test "update_food_truck/2 with valid data updates the food_truck" do
      food_truck = food_truck_fixture()
      update_attrs = %{name: "some updated name", address: "some updated address", food_items: "some updated food_items", latitude: 456.7, longitude: 456.7}

      assert {:ok, %FoodTruck{} = food_truck} = Ratings.update_food_truck(food_truck, update_attrs)
      assert food_truck.name == "some updated name"
      assert food_truck.address == "some updated address"
      assert food_truck.food_items == "some updated food_items"
      assert food_truck.latitude == 456.7
      assert food_truck.longitude == 456.7
    end

    test "update_food_truck/2 with invalid data returns error changeset" do
      food_truck = food_truck_fixture()
      assert {:error, %Ecto.Changeset{}} = Ratings.update_food_truck(food_truck, @invalid_attrs)
      assert food_truck == Ratings.get_food_truck!(food_truck.id)
    end

    test "delete_food_truck/1 deletes the food_truck" do
      food_truck = food_truck_fixture()
      assert {:ok, %FoodTruck{}} = Ratings.delete_food_truck(food_truck)
      assert_raise Ecto.NoResultsError, fn -> Ratings.get_food_truck!(food_truck.id) end
    end

    test "change_food_truck/1 returns a food_truck changeset" do
      food_truck = food_truck_fixture()
      assert %Ecto.Changeset{} = Ratings.change_food_truck(food_truck)
    end
  end
end
