defmodule MedicineWeb.Admin.PatientController do
  use MedicineWeb, :controller

  alias Medicine.Patients
  alias Medicine.Patients.Patient

  action_fallback MedicineWeb.FallbackController

  def index(conn, _params) do
    patients = Patients.list_patients()
    render(conn, :index, patients: patients)
  end

  def create(conn, %{"patient" => patient_params}) do
    with {:ok, %Patient{} = patient} <- Patients.create_patient(patient_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/admin/patients/#{patient}")
      |> render(:show, patient: patient)
    end
  end

  def show(conn, %{"id" => id}) do
    patient = Patients.get_patient!(id)
    render(conn, :show, patient: patient)
  end

  def update(conn, %{"id" => id, "patient" => patient_params}) do
    patient = Patients.get_patient!(id)

    with {:ok, %Patient{} = patient} <- Patients.update_patient(patient, patient_params) do
      render(conn, :show, patient: patient)
    end
  end

  def delete(conn, %{"id" => id}) do
    patient = Patients.get_patient!(id)

    with {:ok, %Patient{}} <- Patients.delete_patient(patient) do
      send_resp(conn, :no_content, "")
    end
  end
end
