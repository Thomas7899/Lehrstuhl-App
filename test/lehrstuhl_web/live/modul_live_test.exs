defmodule LehrstuhlWeb.ModulLiveTest do
  use LehrstuhlWeb.ConnCase

  import Phoenix.LiveViewTest
  import Lehrstuhl.KlausurenFixtures
  import Lehrstuhl.AccountsFixtures

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  defp create_modul(_) do
    modul = modul_fixture()
    %{modul: modul}
  end

  describe "Index" do
    setup [:create_modul]

    test "lists all module", %{conn: conn, modul: modul} do
      {:ok, _index_live, html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/module")

      assert html =~ "Listing Module"
      assert html =~ modul.name
    end

    test "saves new modul", %{conn: conn} do
      {:ok, index_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/module")

      assert index_live |> element("a", "New Modul") |> render_click() =~
               "New Modul"

      assert_patch(index_live, ~p"/module/new")

      assert index_live
             |> form("#modul-form", modul: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#modul-form", modul: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/module")

      # html = render(index_live)
      # assert html =~ "Modul created successfully"
      # assert html =~ "some name"
    end

    test "updates modul in listing", %{conn: conn, modul: modul} do
      {:ok, index_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/module")

      assert index_live |> element("#module-#{modul.id} a", "Edit") |> render_click() =~
               "Edit Modul"

      assert_patch(index_live, ~p"/module/#{modul}/edit")

      assert index_live
             |> form("#modul-form", modul: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#modul-form", modul: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/module")

      html = render(index_live)
      assert html =~ "Modul updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes modul in listing", %{conn: conn, modul: modul} do
      {:ok, index_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/module")

      assert index_live |> element("#module-#{modul.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#module-#{modul.id}")
    end
  end

  describe "Show" do
    setup [:create_modul]

    test "displays modul", %{conn: conn, modul: modul} do
      {:ok, _show_live, html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/module/#{modul}")

      assert html =~ "Show Modul"
      assert html =~ modul.name
    end

    test "updates modul within modal", %{conn: conn, modul: modul} do
      {:ok, show_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/module/#{modul}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Modul"

      assert_patch(show_live, ~p"/module/#{modul}/show/edit")

      assert show_live
             |> form("#modul-form", modul: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#modul-form", modul: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/module/#{modul}")

      html = render(show_live)
      assert html =~ "Modul updated successfully"
      assert html =~ "some updated name"
    end
  end
end
