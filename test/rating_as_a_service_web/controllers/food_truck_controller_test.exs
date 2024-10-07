defmodule RatingAsAServiceWeb.FoodTruckControllerTest do
  use RatingAsAServiceWeb.ConnCase

  import RatingAsAService.RatingsFixtures

  alias RatingAsAService.Ratings.FoodTruck

  @create_attrs %{
    name: "some name",
    address: "some address",
    food_items: "some food_items",
    latitude: 120.5,
    longitude: 120.5
  }
  @update_attrs %{
    name: "some updated name",
    address: "some updated address",
    food_items: "some updated food_items",
    latitude: 456.7,
    longitude: 456.7
  }
  @invalid_attrs %{name: nil, address: nil, food_items: nil, latitude: nil, longitude: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all food_trucks", %{conn: conn} do
      conn = get(conn, ~p"/api/food_trucks")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create food_truck" do
    test "renders food_truck when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/food_trucks", food_truck: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/food_trucks/#{id}")

      assert %{
               "id" => ^id,
               "address" => "some address",
               "food_items" => "some food_items",
               "latitude" => 120.5,
               "longitude" => 120.5,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/food_trucks", food_truck: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update food_truck" do
    setup [:create_food_truck]

    test "renders food_truck when data is valid", %{conn: conn, food_truck: %FoodTruck{id: id} = food_truck} do
      conn = put(conn, ~p"/api/food_trucks/#{food_truck}", food_truck: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/food_trucks/#{id}")

      assert %{
               "id" => ^id,
               "address" => "some updated address",
               "food_items" => "some updated food_items",
               "latitude" => 456.7,
               "longitude" => 456.7,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, food_truck: food_truck} do
      conn = put(conn, ~p"/api/food_trucks/#{food_truck}", food_truck: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete food_truck" do
    setup [:create_food_truck]

    test "deletes chosen food_truck", %{conn: conn, food_truck: food_truck} do
      conn = delete(conn, ~p"/api/food_trucks/#{food_truck}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/food_trucks/#{food_truck}")
      end
    end
  end

  defp create_food_truck(_) do
    food_truck = food_truck_fixture()
    %{food_truck: food_truck}
  end
end
