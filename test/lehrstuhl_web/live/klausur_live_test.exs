defmodule LehrstuhlWeb.KlausurLiveTest do
  use LehrstuhlWeb.ConnCase

  import Phoenix.LiveViewTest
  import Lehrstuhl.KlausurenFixtures
  import Lehrstuhl.AccountsFixtures

  @create_attrs %{
    kenner: "some kenner",
    beschreibung: "some beschreibung",
    punkteGesamt: 42,
    # modul_id: "66e68a9e-069e-4e28-96d5-3d85c5849fba", # How to get the Real
    semester: "WS-2020",
    praesenzdatum: "2023-10-28",
    ort: "some ort"
  }
  @update_attrs %{
    kenner: "some updated kenner",
    beschreibung: "some updated beschreibung",
    punkteGesamt: 43,
    semester: "WS-2021",
    praesenzdatum: "2023-10-29",
    ort: "some updated ort"
  }
  @invalid_attrs %{
    kenner: nil,
    beschreibung: nil,
    punkteGesamt: nil,
    semester: "WS-2020",
    praesenzdatum: nil,
    ort: nil
  }

  defp create_klausur(_) do
    klausur = klausur_fixture()
    %{klausur: klausur}
  end

  describe "Index" do
    setup [:create_klausur]

    test "lists all klausuren", %{conn: conn, klausur: klausur} do
      {:ok, _index_live, html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/klausuren")

      assert html =~ "Listing Klausuren"
      assert html =~ klausur.kenner
    end

    test "saves new klausur", %{conn: conn} do
      {:ok, index_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/klausuren")

      assert index_live |> element("a", "New Klausur") |> render_click() =~
               "New Klausur"

      assert_patch(index_live, ~p"/klausuren/new")

      assert index_live
             |> form("#klausur-form", klausur: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#klausur-form", klausur: @create_attrs)
             |> render_submit()
    end

    test "updates klausur in listing", %{conn: conn, klausur: klausur} do
      {:ok, index_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/klausuren")

      assert index_live |> element("#klausuren-#{klausur.id} a", "Edit") |> render_click() =~
               "Edit Klausur"

      assert_patch(index_live, ~p"/klausuren/#{klausur}/edit")

      assert index_live
             |> form("#klausur-form", klausur: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#klausur-form", klausur: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/klausuren")

      html = render(index_live)
      assert html =~ "Klausur updated successfully"
      assert html =~ "some updated kenner"
    end

    test "deletes klausur in listing", %{conn: conn, klausur: klausur} do
      {:ok, index_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/klausuren")

      assert index_live |> element("#klausuren-#{klausur.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#klausuren-#{klausur.id}")
    end
  end

  describe "Show" do
    setup [:create_klausur]

    test "displays klausur", %{conn: conn, klausur: klausur} do
      {:ok, _show_live, html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/klausuren/#{klausur}")

      assert html =~ "Show Klausur"
      assert html =~ klausur.kenner
    end

    test "updates klausur within modal", %{conn: conn, klausur: klausur} do
      {:ok, show_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/klausuren/#{klausur}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Klausur"

      assert_patch(show_live, ~p"/klausuren/#{klausur}/show/edit")

      assert show_live
             |> form("#klausur-form", klausur: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#klausur-form", klausur: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/klausuren/#{klausur}")

      html = render(show_live)
      assert html =~ "Klausur updated successfully"
      assert html =~ "some updated kenner"
    end
  end
end
