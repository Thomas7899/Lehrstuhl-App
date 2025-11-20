defmodule LehrstuhlWeb.AbstraktesSeminarLiveTest do
  use LehrstuhlWeb.ConnCase

  import Phoenix.LiveViewTest
  import Lehrstuhl.AccountsFixtures
  import Lehrstuhl.SeminareFixtures

  @create_attrs %{thema: "some thema", beschreibung: "some beschreibung"}
  @update_attrs %{thema: "some updated thema", beschreibung: "some updated beschreibung"}
  @invalid_attrs %{thema: nil, beschreibung: nil}

  defp create_abstraktes_seminar(_) do
    abstraktes_seminar = abstraktes_seminar_fixture()
    %{abstraktes_seminar: abstraktes_seminar}
  end

  describe "Index" do
    setup [:create_abstraktes_seminar]

    test "lists all abstrakte_seminare", %{conn: conn, abstraktes_seminar: abstraktes_seminar} do
      {:ok, _index_live, html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/abstrakte_seminare")

      assert html =~ "Listing Abstrakte seminare"
      assert html =~ abstraktes_seminar.thema
    end

    test "saves new abstraktes_seminar", %{conn: conn} do
      {:ok, index_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/abstrakte_seminare")

      assert index_live |> element("a", "New Abstraktes seminar") |> render_click() =~
               "New Abstraktes seminar"

      assert_patch(index_live, ~p"/abstrakte_seminare/new")

      assert index_live
             |> form("#abstraktes_seminar-form", abstraktes_seminar: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#abstraktes_seminar-form", abstraktes_seminar: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/abstrakte_seminare")

      # TODO: better assertion for testing success
      # html = render(index_live)
      # assert html =~ "Abstraktes seminar created successfully"
      # assert html =~ "some thema"
    end

    test "updates abstraktes_seminar in listing", %{
      conn: conn,
      abstraktes_seminar: abstraktes_seminar
    } do
      {:ok, index_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/abstrakte_seminare")

      assert index_live
             |> element("#abstrakte_seminare-#{abstraktes_seminar.id} a", "Edit")
             |> render_click() =~
               "Edit Abstraktes seminar"

      assert_patch(index_live, ~p"/abstrakte_seminare/#{abstraktes_seminar}/edit")

      assert index_live
             |> form("#abstraktes_seminar-form", abstraktes_seminar: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#abstraktes_seminar-form", abstraktes_seminar: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/abstrakte_seminare")

      html = render(index_live)
      assert html =~ "Abstraktes seminar updated successfully"
      assert html =~ "some updated thema"
    end

    test "deletes abstraktes_seminar in listing", %{
      conn: conn,
      abstraktes_seminar: abstraktes_seminar
    } do
      {:ok, index_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/abstrakte_seminare")

      assert index_live
             |> element("#abstrakte_seminare-#{abstraktes_seminar.id} a", "Delete")
             |> render_click()

      refute has_element?(index_live, "#abstrakte_seminare-#{abstraktes_seminar.id}")
    end
  end

  describe "Show" do
    setup [:create_abstraktes_seminar]

    test "displays abstraktes_seminar", %{conn: conn, abstraktes_seminar: abstraktes_seminar} do
      {:ok, _show_live, html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/abstrakte_seminare/#{abstraktes_seminar}")

      assert html =~ "Show Abstraktes seminar"
      assert html =~ abstraktes_seminar.thema
    end

    test "updates abstraktes_seminar within modal", %{
      conn: conn,
      abstraktes_seminar: abstraktes_seminar
    } do
      {:ok, show_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/abstrakte_seminare/#{abstraktes_seminar}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Abstraktes seminar"

      assert_patch(show_live, ~p"/abstrakte_seminare/#{abstraktes_seminar}/show/edit")

      assert show_live
             |> form("#abstraktes_seminar-form", abstraktes_seminar: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#abstraktes_seminar-form", abstraktes_seminar: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/abstrakte_seminare/#{abstraktes_seminar}")

      html = render(show_live)
      assert html =~ "Abstraktes seminar updated successfully"
      assert html =~ "some updated thema"
    end
  end
end
