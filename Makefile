db:
	bash -c 'docker compose up'

app:
	bash -c 'mix ecto.drop && mix setup && mix phx.server'

format-output:
	bash -c 'mix format --check-formatted'

format:
	bash -c 'mix format'

lint:
	bash -c 'mix credo --strict'

test:
	bash -c 'mix test'