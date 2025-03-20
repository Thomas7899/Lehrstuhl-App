defmodule LehrstuhlWeb.Router do
  use LehrstuhlWeb, :router

  import LehrstuhlWeb.UserAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {LehrstuhlWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end
 

  scope "/", LehrstuhlWeb do
    pipe_through :browser

    get "/", PageController, :home

    pipe_through :require_authenticated_user

    #Filter abstrakte Abschlussarbeiten
    live "/filter_abstrakt", FilterAbstraktLive
    live "/filter_abstrakt_konkret", FilterAbstraktKonkretLive

    #Filter konkrete Abschlussarbeiten
     live "/filter_konkret", FilterKonkretLive
     live "/ergebnisse-abschlussarbeiten", ErgebnisseAbschlussarbeitenLive
     live "/featured_abschlussarbeiten", FeaturedAbschlussarbeitenLive

     #Filter Seminare
     live "/filterseminare", FilterSeminarLive
  end

  scope "/", LehrstuhlWeb do

    pipe_through  [:browser, :require_admin, :require_authenticated_user]

     live_session :admin,
     on_mount: [
        {LehrstuhlWeb.UserAuth, :ensure_authenticated},
        {LehrstuhlWeb.UserAuth, :ensure_admin}
      ] do

      #  get "/", PageController, :home

        ##Abschlussarbeiten
    #Abstrakte Abschlussarbeiten
        live "/abstrakte_abschlussarbeiten", AbstrakteAbschlussarbeitenLive.Index, :index
        live "/abstrakte_abschlussarbeiten/new", AbstrakteAbschlussarbeitenLive.Index, :new
        live "/abstrakte_abschlussarbeiten/:id/edit", AbstrakteAbschlussarbeitenLive.Index, :edit

        live "/abstrakte_abschlussarbeiten/:id", AbstrakteAbschlussarbeitenLive.Show, :show
        live "/abstrakte_abschlussarbeiten/:id/show/edit", AbstrakteAbschlussarbeitenLive.Show, :edit

          #Konkrete Abschlussarbeiten
    live "/konkrete_abschlussarbeiten", KonkreteAbschlussarbeitenLive.Index, :index
    live "/konkrete_abschlussarbeiten/new", KonkreteAbschlussarbeitenLive.Index, :new
    live "/konkrete_abschlussarbeiten/:id/edit", KonkreteAbschlussarbeitenLive.Index, :edit

    live "/konkrete_abschlussarbeiten/:id", KonkreteAbschlussarbeitenLive.Show, :show
    live "/konkrete_abschlussarbeiten/:id/show/edit", KonkreteAbschlussarbeitenLive.Show, :edit

    #Ergebnisse Abschlussarbeiten
    live "/ergebnisse_abschlussarbeiten", ErgebnisseAbschlussarbeitenLive.Index, :index
    live "/ergebnisse_abschlussarbeiten/new", ErgebnisseAbschlussarbeitenLive.Index, :new
    live "/ergebnisse_abschlussarbeiten/:id/edit", ErgebnisseAbschlussarbeitenLive.Index, :edit

    live "/ergebnisse_abschlussarbeiten/:id", ErgebnisseAbschlussarbeitenLive.Show, :show
    live "/ergebnisse_abschlussarbeiten/:id/show/edit", ErgebnisseAbschlussarbeitenLive.Show, :edit

        ## Mitarbeiter
        live "/mitarbeiter", MitarbeiterLive.Index, :index
        live "/mitarbeiter/new", MitarbeiterLive.Index, :new
        live "/mitarbeiter/:id/edit", MitarbeiterLive.Index, :edit
        live "/mitarbeiter/:id", MitarbeiterLive.Show, :show
        live "/mitarbeiter/:id/show/edit", MitarbeiterLive.Show, :edit

               ## Students
    live "/students", StudentLive.Index, :index
    live "/students/new", StudentLive.Index, :new
    live "/students/:id/edit", StudentLive.Index, :edit
    live "/students/:id", StudentLive.Show, :show
    live "/students/:id/show/edit", StudentLive.Show, :edit

        ## Klausur
        # Modul
        live "/module", ModulLive.Index, :index
        live "/module/new", ModulLive.Index, :new
        live "/module/:id/edit", ModulLive.Index, :edit
        live "/module/:id", ModulLive.Show, :show
        live "/module/:id/show/edit", ModulLive.Show, :edit

        # Klausur
        live "/klausuren", KlausurLive.Index, :index
        live "/klausuren/new", KlausurLive.Index, :new
        live "/klausuren/:id/edit", KlausurLive.Index, :edit
        live "/klausuren/:id", KlausurLive.Show, :show
        live "/klausuren/:id/show/edit", KlausurLive.Show, :edit

        # Klausurergebnisse
        live "/klausurergebnisse", KlausurergebnisLive.Index, :index
        live "/klausurergebnisse/new", KlausurergebnisLive.Index, :new
        live "/klausurergebnisse/:id/edit", KlausurergebnisLive.Index, :edit
        live "/klausurergebnisse/:id", KlausurergebnisLive.Show, :show
        live "/klausurergebnisse/:id/show/edit", KlausurergebnisLive.Show, :edit

        ## Seminar
        # Seminarergebnisse
        live "/seminarergebnisse", SeminarergebnisLive.Index, :index
        live "/seminarergebnisse/new", SeminarergebnisLive.Index, :new
        live "/seminarergebnisse/:id/edit", SeminarergebnisLive.Index, :edit
        live "/seminarergebnisse/:id", SeminarergebnisLive.Show, :show
        live "/seminarergebnisse/:id/show/edit", SeminarergebnisLive.Show, :edit

        # Seminare
        live "/seminare", SeminarLive.Index, :index
        live "/seminare/new", SeminarLive.Index, :new
        live "/seminare/:id/edit", SeminarLive.Index, :edit
        live "/seminare/:id", SeminarLive.Show, :show
        live "/seminare/:id/show/edit", SeminarLive.Show, :edit

        # Abstrakte Seminare
        live "/abstrakte_seminare", AbstraktesSeminarLive.Index, :index
        live "/abstrakte_seminare/new", AbstraktesSeminarLive.Index, :new
        live "/abstrakte_seminare/:id/edit", AbstraktesSeminarLive.Index, :edit
        live "/abstrakte_seminare/:id", AbstraktesSeminarLive.Show, :show
        live "/abstrakte_seminare/:id/show/edit", AbstraktesSeminarLive.Show, :edit
      end
    end

  # Other scopes may use custom stacks.
  # scope "/api", LehrstuhlWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:lehrstuhl, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: LehrstuhlWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end

  ## Authentication routes

  scope "/", LehrstuhlWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    live_session :redirect_if_user_is_authenticated,
      on_mount: [{LehrstuhlWeb.UserAuth, :redirect_if_user_is_authenticated}] do
      live "/users/register", UserRegistrationLive, :new
      live "/users/log_in", UserLoginLive, :new
      live "/users/reset_password", UserForgotPasswordLive, :new
      live "/users/reset_password/:token", UserResetPasswordLive, :edit
    end

    post "/users/log_in", UserSessionController, :create
  end

  scope "/", LehrstuhlWeb do
    pipe_through [:browser, :require_authenticated_user]

    live_session :require_authenticated_user,
      on_mount: [{LehrstuhlWeb.UserAuth, :ensure_authenticated}] do
      live "/users/settings", UserSettingsLive, :edit
      live "/users/settings/confirm_email/:token", UserSettingsLive, :confirm_email
    end
  end

  scope "/", LehrstuhlWeb do
    pipe_through [:browser]

    delete "/users/log_out", UserSessionController, :delete

    live_session :current_user,
      on_mount: [{LehrstuhlWeb.UserAuth, :mount_current_user}] do
      live "/users/confirm/:token", UserConfirmationLive, :edit
      live "/users/confirm", UserConfirmationInstructionsLive, :new
    end
  end
end
