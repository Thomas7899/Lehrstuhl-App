# Lehrstuhl execution

To start your Phoenix server:

* Install dependencies with mix deps.get
* Create and migrate your database with mix ecto.setup (Use your own username and password)
* Start Phoenix endpoint with mix phx.server or inside IEx with iex -S mix phx.server
* Script for populating the database. You can run it as: mix run priv/repo/seeds.exs

Now you can visit localhost:4000 from your browser.

* First create an Account with your E-Mail!

* Navigate per links to Abschlussarbeiten erstellen, Abschlussarbeit filtern and Ergebnisse Abschlussarbeiten

* Follow link Ergebnisse Abschlussarbeiten to Nach Ergebnis sortieren
* Follow link Abschlussarbeit erstellen to function "Filter!"
* Switch between Abstrakte und Konkrete Abschlussarbeiten

* Return to Homepage per FernUni - Logo


To start the database:
  * Run `make db`
  * OR
  * Run `docker-compose build` to install and `docker compose up` launch postgres

To start your Phoenix server:
  * Run `make app`
  * OR
  * Run `mix setup` to install and setup dependencies
  * Initial Run on machine or DB Changes `mix ecto.migrate`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`  

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

# Debugging

Usage of pgAdmin
* **Hostname** -> `lehrstuhl-database-1` or IP Adress of Docker Container from the postgresql
* **Port** -> `5432`
* **Username** -> `lehrstuhl-mgmt`


Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

# Lint & Test

  * execute formatter: "make format"
  * execute formatter output only: "make format-output"
  * execute credo linter: "make lint"
  * execute tests: "make test"

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## pgAdmin
  * Official website: https://www.pgadmin.org
  * pgAdmin Docker Compose : https://towardsdatascience.com/how-to-run-postgresql-and-pgadmin-using-docker-3a6a8ae918b5

