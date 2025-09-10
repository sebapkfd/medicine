defmodule MedicineWeb.Admin.PractitionerControllerTest do
  use MedicineWeb.ConnCase

  import Medicine.PractitionersFixtures
  alias Medicine.Practitioners.Practitioner

  @create_attrs %{
    first_name: "some first_name",
    last_name: "some last_name",
    phone: "some phone",
    birthdate: "some birthdate",
    email: "some email"
  }
  @update_attrs %{
    first_name: "some updated first_name",
    last_name: "some updated last_name",
    phone: "some updated phone",
    birthdate: "some updated birthdate",
    email: "some updated email"
  }
  @invalid_attrs %{first_name: nil, last_name: nil, phone: nil, birthdate: nil, email: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all practitioners", %{conn: conn} do
      conn = get(conn, ~p"/api/admin/practitioners")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create practitioner" do
    test "renders practitioner when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/admin/practitioners", practitioner: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/admin/practitioners/#{id}")

      assert %{
               "id" => ^id,
               "birthdate" => "some birthdate",
               "email" => "some email",
               "first_name" => "some first_name",
               "last_name" => "some last_name",
               "phone" => "some phone"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/admin/practitioners", practitioner: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update practitioner" do
    setup [:create_practitioner]

    test "renders practitioner when data is valid", %{conn: conn, practitioner: %Practitioner{id: id} = practitioner} do
      conn = put(conn, ~p"/api/admin/practitioners/#{practitioner}", practitioner: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/admin/practitioners/#{id}")

      assert %{
               "id" => ^id,
               "birthdate" => "some updated birthdate",
               "email" => "some updated email",
               "first_name" => "some updated first_name",
               "last_name" => "some updated last_name",
               "phone" => "some updated phone"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, practitioner: practitioner} do
      conn = put(conn, ~p"/api/admin/practitioners/#{practitioner}", practitioner: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete practitioner" do
    setup [:create_practitioner]

    test "deletes chosen practitioner", %{conn: conn, practitioner: practitioner} do
      conn = delete(conn, ~p"/api/admin/practitioners/#{practitioner}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/admin/practitioners/#{practitioner}")
      end
    end
  end

  defp create_practitioner(_) do
    practitioner = practitioner_fixture()

    %{practitioner: practitioner}
  end
end
