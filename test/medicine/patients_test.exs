defmodule Medicine.PatientsTest do
  use Medicine.DataCase

  alias Medicine.Patients

  describe "patients" do
    alias Medicine.Patients.Patient

    import Medicine.PatientsFixtures

    @invalid_attrs %{first_name: nil, last_name: nil, phone: nil, birthdate: nil, email: nil}

    test "list_patients/0 returns all patients" do
      patient = patient_fixture()
      assert Patients.list_patients() == [patient]
    end

    test "get_patient!/1 returns the patient with given id" do
      patient = patient_fixture()
      assert Patients.get_patient!(patient.id) == patient
    end

    test "create_patient/1 with valid data creates a patient" do
      valid_attrs = %{first_name: "some first_name", last_name: "some last_name", phone: "some phone", birthdate: "some birthdate", email: "some email"}

      assert {:ok, %Patient{} = patient} = Patients.create_patient(valid_attrs)
      assert patient.first_name == "some first_name"
      assert patient.last_name == "some last_name"
      assert patient.phone == "some phone"
      assert patient.birthdate == "some birthdate"
      assert patient.email == "some email"
    end

    test "create_patient/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Patients.create_patient(@invalid_attrs)
    end

    test "update_patient/2 with valid data updates the patient" do
      patient = patient_fixture()
      update_attrs = %{first_name: "some updated first_name", last_name: "some updated last_name", phone: "some updated phone", birthdate: "some updated birthdate", email: "some updated email"}

      assert {:ok, %Patient{} = patient} = Patients.update_patient(patient, update_attrs)
      assert patient.first_name == "some updated first_name"
      assert patient.last_name == "some updated last_name"
      assert patient.phone == "some updated phone"
      assert patient.birthdate == "some updated birthdate"
      assert patient.email == "some updated email"
    end

    test "update_patient/2 with invalid data returns error changeset" do
      patient = patient_fixture()
      assert {:error, %Ecto.Changeset{}} = Patients.update_patient(patient, @invalid_attrs)
      assert patient == Patients.get_patient!(patient.id)
    end

    test "delete_patient/1 deletes the patient" do
      patient = patient_fixture()
      assert {:ok, %Patient{}} = Patients.delete_patient(patient)
      assert_raise Ecto.NoResultsError, fn -> Patients.get_patient!(patient.id) end
    end

    test "change_patient/1 returns a patient changeset" do
      patient = patient_fixture()
      assert %Ecto.Changeset{} = Patients.change_patient(patient)
    end
  end
end
