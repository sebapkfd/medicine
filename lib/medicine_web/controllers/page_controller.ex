defmodule MedicineWeb.PageController do
  use MedicineWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
