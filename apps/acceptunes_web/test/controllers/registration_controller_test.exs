defmodule AcceptunesWeb.RegistrationControllerTest do 
  use AcceptunesWeb.ConnCase

  import AcceptunesWeb.Factory

  test "GET /registration/new", %{conn: conn} do
    conn = get conn, "/registration/new"
    assert html_response(conn, 200) =~ "Create an Account"
  end

  test "POST /registration/create", %{conn: conn} do
    user_params = %{user: %{first_name: "John", last_name: "Smith", email: "blah@blah.com", password: "asdfasdf"}}
    conn = post conn, registration_path(conn, :create), user_params
    assert html_response(conn, 302)
  end

  test "try to register without email", %{conn: conn} do
    user_params = %{user: %{first_name: "John", last_name: "Smith", password: "asdfasdf"}}
    conn = post conn, registration_path(conn, :create), user_params
    assert html_response(conn, 200) =~ "can&#39;t be blank"
    assert get_flash(conn, :error) == "Unable to create your account"
  end

end
