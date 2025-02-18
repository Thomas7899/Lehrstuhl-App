defmodule Lehrstuhl.PersonsTest do
  use Lehrstuhl.DataCase

  alias Lehrstuhl.Persons

  describe "mitarbeiter" do
    alias Lehrstuhl.Persons.Mitarbeiter

    import Lehrstuhl.PersonsFixtures

    @invalid_attrs %{email: nil, nachname: nil, vorname: nil, rolle: nil}

    test "list_mitarbeiter/0 returns all mitarbeiter" do
      mitarbeiter = mitarbeiter_fixture()

      # Ensure the created mitarbeiter is in the list
      mitarbeiter_list = Persons.list_mitarbeiter()
      assert Enum.any?(mitarbeiter_list, fn m -> m.id == mitarbeiter.id end)
    end


    test "get_mitarbeiter!/1 returns the mitarbeiter with given id" do
      mitarbeiter = mitarbeiter_fixture()
      assert Persons.get_mitarbeiter!(mitarbeiter.id) == mitarbeiter
    end

    test "create_mitarbeiter/1 with valid data creates a mitarbeiter" do
      valid_attrs = %{
        email: "some email",
        nachname: "some nachname",
        vorname: "some vorname",
        rolle: :professor
      }

      assert {:ok, %Mitarbeiter{} = mitarbeiter} = Persons.create_mitarbeiter(valid_attrs)
      assert mitarbeiter.email == "some email"
      assert mitarbeiter.nachname == "some nachname"
      assert mitarbeiter.vorname == "some vorname"
      assert mitarbeiter.rolle == :professor
    end

    test "create_mitarbeiter/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Persons.create_mitarbeiter(@invalid_attrs)
    end

    test "update_mitarbeiter/2 with valid data updates the mitarbeiter" do
      mitarbeiter = mitarbeiter_fixture()

      update_attrs = %{
        email: "some updated email",
        nachname: "some updated nachname",
        vorname: "some updated vorname",
        rolle: :wissenschaftlicher_mitarbeiter
      }

      assert {:ok, %Mitarbeiter{} = mitarbeiter} =
               Persons.update_mitarbeiter(mitarbeiter, update_attrs)

      assert mitarbeiter.email == "some updated email"
      assert mitarbeiter.nachname == "some updated nachname"
      assert mitarbeiter.vorname == "some updated vorname"
      assert mitarbeiter.rolle == :wissenschaftlicher_mitarbeiter
    end

    test "update_mitarbeiter/2 with invalid data returns error changeset" do
      mitarbeiter = mitarbeiter_fixture()
      assert {:error, %Ecto.Changeset{}} = Persons.update_mitarbeiter(mitarbeiter, @invalid_attrs)
      assert mitarbeiter == Persons.get_mitarbeiter!(mitarbeiter.id)
    end

    test "delete_mitarbeiter/1 deletes the mitarbeiter" do
      mitarbeiter = mitarbeiter_fixture()
      assert {:ok, %Mitarbeiter{}} = Persons.delete_mitarbeiter(mitarbeiter)
      assert_raise Ecto.NoResultsError, fn -> Persons.get_mitarbeiter!(mitarbeiter.id) end
    end

    test "change_mitarbeiter/1 returns a mitarbeiter changeset" do
      mitarbeiter = mitarbeiter_fixture()
      assert %Ecto.Changeset{} = Persons.change_mitarbeiter(mitarbeiter)
    end
  end

  describe "students" do
    alias Lehrstuhl.Persons.Student

    import Lehrstuhl.PersonsFixtures

    @invalid_attrs %{
      email: nil,
      matrikelnummer: nil,
      vorname: nil,
      nachname: nil,
      geburtsdatum: nil
    }

    test "list_students/0 returns all students" do
      student = student_fixture()

      # Ensure only the created student is in the list
      students = Persons.list_students()
      assert Enum.any?(students, fn s -> s.id == student.id end)
    end


    test "get_student!/1 returns the student with given id" do
      student = student_fixture()
      assert Persons.get_student!(student.id) == student
    end

    test "create_student/1 with valid data creates a student" do
      valid_attrs = %{
        email: "some email",
        matrikelnummer: "some matrikelnummer",
        vorname: "some vorname",
        nachname: "some nachname",
        geburtsdatum: ~D[2023-10-24]
      }

      assert {:ok, %Student{} = student} = Persons.create_student(valid_attrs)
      assert student.email == "some email"
      assert student.matrikelnummer == "some matrikelnummer"
      assert student.vorname == "some vorname"
      assert student.nachname == "some nachname"
      assert student.geburtsdatum == ~D[2023-10-24]
    end

    test "create_student/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Persons.create_student(@invalid_attrs)
    end

    test "update_student/2 with valid data updates the student" do
      student = student_fixture()

      update_attrs = %{
        email: "some updated email",
        matrikelnummer: "some updated matrikelnummer",
        vorname: "some updated vorname",
        nachname: "some updated nachname",
        geburtsdatum: ~D[2023-10-25]
      }

      assert {:ok, %Student{} = student} = Persons.update_student(student, update_attrs)
      assert student.email == "some updated email"
      assert student.matrikelnummer == "some updated matrikelnummer"
      assert student.vorname == "some updated vorname"
      assert student.nachname == "some updated nachname"
      assert student.geburtsdatum == ~D[2023-10-25]
    end

    test "update_student/2 with invalid data returns error changeset" do
      student = student_fixture()
      assert {:error, %Ecto.Changeset{}} = Persons.update_student(student, @invalid_attrs)
      assert student == Persons.get_student!(student.id)
    end

    test "delete_student/1 deletes the student" do
      student = student_fixture()
      assert {:ok, %Student{}} = Persons.delete_student(student)
      assert_raise Ecto.NoResultsError, fn -> Persons.get_student!(student.id) end
    end

    test "change_student/1 returns a student changeset" do
      student = student_fixture()
      assert %Ecto.Changeset{} = Persons.change_student(student)
    end
  end
end
