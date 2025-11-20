defmodule LehrstuhlWeb.KlausurergebnisLiveTest do
  use LehrstuhlWeb.ConnCase

  import Phoenix.LiveViewTest
  import Lehrstuhl.KlausurenFixtures
  import Lehrstuhl.AccountsFixtures

  @create_attrs %{punkte: 42}

  @update_attrs %{
    punkte: 43
  }

  defp create_klausurergebnis(_) do
    klausurergebnis = klausurergebnis_fixture()
    %{klausurergebnis: klausurergebnis}
  end

  describe "Index" do
    setup [:create_klausurergebnis]

    test "lists all klausurergebnisse", %{conn: conn} do
      {:ok, _index_live, html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/klausurergebnisse")

      assert html =~ "Listing Klausurergebnisse"
    end

    test "saves new klausurergebnis", %{conn: conn} do
      {:ok, index_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/klausurergebnisse")

      assert index_live |> element("a", "New Klausurergebnis") |> render_click() =~
               "New Klausurergebnis"

      assert_patch(index_live, ~p"/klausurergebnisse/new")

      assert index_live
             |> form("#klausurergebnis-form", klausurergebnis: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/klausurergebnisse")
    end

    test "updates klausurergebnis in listing", %{conn: conn, klausurergebnis: klausurergebnis} do
      {:ok, index_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/klausurergebnisse")

      assert index_live
             |> element("#klausurergebnisse-#{klausurergebnis.id} a", "Edit")
             |> render_click() =~
               "Edit Klausurergebnis"

      assert_patch(index_live, ~p"/klausurergebnisse/#{klausurergebnis}/edit")

      assert index_live
             |> form("#klausurergebnis-form", klausurergebnis: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/klausurergebnisse")

      html = render(index_live)
      assert html =~ "Klausurergebnis updated successfully"
    end

    test "deletes klausurergebnis in listing", %{conn: conn, klausurergebnis: klausurergebnis} do
      {:ok, index_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/klausurergebnisse")

      assert index_live
             |> element("#klausurergebnisse-#{klausurergebnis.id} a", "Delete")
             |> render_click()

      refute has_element?(index_live, "#klausurergebnisse-#{klausurergebnis.id}")
    end
  end

  describe "Show" do
    setup [:create_klausurergebnis]

    test "displays klausurergebnis", %{conn: conn, klausurergebnis: klausurergebnis} do
      {:ok, _show_live, html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/klausurergebnisse/#{klausurergebnis}")

      assert html =~ "Show Klausurergebnis"
    end

    test "updates klausurergebnis within modal", %{conn: conn, klausurergebnis: klausurergebnis} do
      {:ok, show_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/klausurergebnisse/#{klausurergebnis}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Klausurergebnis"

      assert_patch(show_live, ~p"/klausurergebnisse/#{klausurergebnis}/show/edit")

      assert show_live
             |> form("#klausurergebnis-form", klausurergebnis: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/klausurergebnisse/#{klausurergebnis}")

      html = render(show_live)
      assert html =~ "Klausurergebnis updated successfully"
    end
  end
end
