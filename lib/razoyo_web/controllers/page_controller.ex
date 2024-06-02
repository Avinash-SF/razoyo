defmodule RazoyoWeb.PageController do
  use RazoyoWeb, :controller

  alias Razoyo.Banking

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.


    # TODO Hard coding the client secret for now, have to modify this to dynamic client secret.. I don't have much time
    # TODO also use Task for Async/Await
    data =  HTTPoison.post("https://exam.razoyo.com/api/banking/accounts", "{\"client_secret\": \"qRIAKP5ywR5i6sGcv3dFbYDEKoUmV5V5\"}", [{"accept", "application/json"}, {"Content-Type", "application/json"}])
    {:ok, %HTTPoison.Response{status_code: 200, body: body}} = data

    body_decoded = body
    |> Jason.decode!()

    acc = Map.get(body_decoded, "account")
    access_token = Map.get(body_decoded, "access_token")

    # IO.inspect(acc)
    # IO.inspect access_token

    Banking.create_account(%{account_number: acc, access_token: access_token})

    actual_req_data = HTTPoison.post("https://exam.razoyo.com/api/banking/operations", "{\"type\": \"ListTransactions\"}", [{"Authorization", "Bearer " <> access_token  }, {"accept", "application/json"}, {"Content-Type", "application/json"}])
    {:ok, %HTTPoison.Response{status_code: 200, body: actual_data_body}} = actual_req_data

    decoded_actual_data = actual_data_body
    |> Jason.decode!()



    # IO.inspect(Map.get(decoded_actual_data, "transactions"))

    render(conn, :home, transactions: Map.get(decoded_actual_data, "transactions"), layout: false)
  end
end
