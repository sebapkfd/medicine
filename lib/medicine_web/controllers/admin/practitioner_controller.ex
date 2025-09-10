defmodule MedicineWeb.Admin.PractitionerController do
  use MedicineWeb, :controller

  alias Medicine.Practitioners
  alias Medicine.Practitioners.Practitioner

  action_fallback MedicineWeb.FallbackController

  def index(conn, _params) do
    practitioners = Practitioners.list_practitioners()
    render(conn, :index, practitioners: practitioners)
  end

  def create(conn, %{"practitioner" => practitioner_params}) do
    with {:ok, %Practitioner{} = practitioner} <- Practitioners.create_practitioner(practitioner_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/admin/practitioners/#{practitioner}")
      |> render(:show, practitioner: practitioner)
    end
  end

  def show(conn, %{"id" => id}) do
    practitioner = Practitioners.get_practitioner!(id)
    render(conn, :show, practitioner: practitioner)
  end

  def update(conn, %{"id" => id, "practitioner" => practitioner_params}) do
    practitioner = Practitioners.get_practitioner!(id)

    with {:ok, %Practitioner{} = practitioner} <- Practitioners.update_practitioner(practitioner, practitioner_params) do
      render(conn, :show, practitioner: practitioner)
    end
  end

  def delete(conn, %{"id" => id}) do
    practitioner = Practitioners.get_practitioner!(id)

    with {:ok, %Practitioner{}} <- Practitioners.delete_practitioner(practitioner) do
      send_resp(conn, :no_content, "")
    end
  end
end
