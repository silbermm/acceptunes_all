defmodule AcceptunesWeb.RegistrationAcceptanceTest do
  use AcceptunesWeb.AcceptanceCase, async: true

  test "able to register", %{session: session} do
    session
    |> visit("/registration/new")
    |> fill_in("Email", with: "Joseph@sdfas")
    |> fill_in("Password", with: "basdadf")
    |> click_on("Signup")

    
  end
end
