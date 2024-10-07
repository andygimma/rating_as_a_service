defmodule RatingAsAService.ApiClient do
  use HTTPoison.Base

  def get_user(url) do
    case get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, parse_body(body)}

      {:ok, %HTTPoison.Response{status_code: status_code}} ->
        {:error, "Received a non-200 status code: #{status_code}"}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, "Request failed: #{reason}"}
    end
  end

  defp parse_body(body) do
    body
    |> Jason.decode!()
  end
end
