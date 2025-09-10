defmodule MedicineWeb.Admin.PatientControllerTest do
  use MedicineWeb.ConnCase

  import Medicine.PatientsFixtures
  alias Medicine.Patients.Patient

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
    test "lists all patients", %{conn: conn} do
      conn = get(conn, ~p"/api/admin/patients")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create patient" do
    test "renders patient when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/admin/patients", patient: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/admin/patients/#{id}")

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
      conn = post(conn, ~p"/api/admin/patients", patient: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update patient" do
    setup [:create_patient]

    test "renders patient when data is valid", %{conn: conn, patient: %Patient{id: id} = patient} do
      conn = put(conn, ~p"/api/admin/patients/#{patient}", patient: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/admin/patients/#{id}")

      assert %{
               "id" => ^id,
               "birthdate" => "some updated birthdate",
               "email" => "some updated email",
               "first_name" => "some updated first_name",
               "last_name" => "some updated last_name",
               "phone" => "some updated phone"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, patient: patient} do
      conn = put(conn, ~p"/api/admin/patients/#{patient}", patient: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete patient" do
    setup [:create_patient]

    test "deletes chosen patient", %{conn: conn, patient: patient} do
      conn = delete(conn, ~p"/api/admin/patients/#{patient}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/admin/patients/#{patient}")
      end
    end
  end

  defp create_patient(_) do
    patient = patient_fixture()

    %{patient: patient}
  end
end
