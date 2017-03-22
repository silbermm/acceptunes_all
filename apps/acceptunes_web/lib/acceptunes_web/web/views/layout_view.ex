defmodule AcceptunesWeb.LayoutView do
  use AcceptunesWeb.Web, :view
  
  alias AcceptunesWeb.Schema.User

  def user_info(conn) do
    case Guardian.Plug.current_resource(conn) do
      %User{email: email} = user -> user
      _ -> nil
    end
  end
end
