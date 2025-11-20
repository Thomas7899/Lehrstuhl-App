defmodule LehrstuhlWeb.MitarbeiterLiveTest do
  use LehrstuhlWeb.ConnCase

  import Phoenix.LiveViewTest
  import Lehrstuhl.PersonsFixtures
  import Lehrstuhl.AccountsFixtures

  @create_attrs %{
    email: "some email",
    nachname: "some nachname",
    vorname: "some vorname",
    rolle: :professor
  }
  @update_attrs %{
    email: "some updated email",
    nachname: "some updated nachname",
    vorname: "some updated vorname",
    rolle: :wissenschaftlicher_mitarbeiter
  }
  @invalid_attrs %{email: nil, nachname: nil, vorname: nil, rolle: nil}

  defp create_mitarbeiter(_) do
    mitarbeiter = mitarbeiter_fixture()
    %{mitarbeiter: mitarbeiter}
  end

  describe "Index" do
    setup [:create_mitarbeiter]

    test "lists all mitarbeiter", %{conn: conn, mitarbeiter: mitarbeiter} do
      {:ok, _index_live, html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/mitarbeiter")

      assert html =~ "Listing Mitarbeiter"
      assert html =~ mitarbeiter.email
    end

    test "saves new mitarbeiter", %{conn: conn} do
      {:ok, index_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/mitarbeiter")

      assert index_live |> element("a", "New Mitarbeiter") |> render_click() =~
               "New Mitarbeiter"

      assert_patch(index_live, ~p"/mitarbeiter/new")

      assert index_live
             |> form("#mitarbeiter-form", mitarbeiter: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#mitarbeiter-form", mitarbeiter: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/mitarbeiter")

      html = render(index_live)
      assert html =~ "Mitarbeiter created successfully"
      assert html =~ "some email"
    end

    test "updates mitarbeiter in listing", %{conn: conn, mitarbeiter: mitarbeiter} do
      {:ok, index_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/mitarbeiter")

      assert index_live
             |> element("#mitarbeiter_collection-#{mitarbeiter.id} a", "Edit")
             |> render_click() =~
               "Edit Mitarbeiter"

      assert_patch(index_live, ~p"/mitarbeiter/#{mitarbeiter}/edit")

      assert index_live
             |> form("#mitarbeiter-form", mitarbeiter: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#mitarbeiter-form", mitarbeiter: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/mitarbeiter")

      html = render(index_live)
      assert html =~ "Mitarbeiter updated successfully"
      assert html =~ "some updated email"
    end

    test "deletes mitarbeiter in listing", %{conn: conn, mitarbeiter: mitarbeiter} do
      {:ok, index_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/mitarbeiter")

      assert index_live
             |> element("#mitarbeiter_collection-#{mitarbeiter.id} a", "Delete")
             |> render_click()

      refute has_element?(index_live, "#mitarbeiter-#{mitarbeiter.id}")
    end
  end

  describe "Show" do
    setup [:create_mitarbeiter]

    test "displays mitarbeiter", %{conn: conn, mitarbeiter: mitarbeiter} do
      {:ok, _show_live, html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/mitarbeiter/#{mitarbeiter}")

      assert html =~ "Show Mitarbeiter"
      assert html =~ mitarbeiter.email
    end

    test "updates mitarbeiter within modal", %{conn: conn, mitarbeiter: mitarbeiter} do
      {:ok, show_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/mitarbeiter/#{mitarbeiter}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Mitarbeiter"

      assert_patch(show_live, ~p"/mitarbeiter/#{mitarbeiter}/show/edit")

      assert show_live
             |> form("#mitarbeiter-form", mitarbeiter: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#mitarbeiter-form", mitarbeiter: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/mitarbeiter/#{mitarbeiter}")

      html = render(show_live)
      assert html =~ "Mitarbeiter updated successfully"
      assert html =~ "some updated email"
    end
  end
end
