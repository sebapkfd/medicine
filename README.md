# Medicine

To start your Phoenix server:

* Run `mix setup` to install and setup dependencies
* Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

* Official website: https://www.phoenixframework.org/
* Guides: https://hexdocs.pm/phoenix/overview.html
* Docs: https://hexdocs.pm/phoenix
* Forum: https://elixirforum.com/c/phoenix-forum
* Source: https://github.com/phoenixframework/phoenix

## Comandos

`mix phx.new medic`

`cd  medic`

`mix ecto.create`

`mix phx.gen.json Patients Patient patients first_name:string last_name:string phone:string birthdate:string email:string --web admin`

`mix ecto.migrate`

`mix phx.gen.json Practitioners Practitioner practitioners first_name:string last_name:string phone:string birthdate:string email:string --web admin`

`mix ecto.migrate`

`mix phx.gen.json Prescriptions Prescription prescriptions detail:text --web admin`

`mix ecto.migrate`

`mix ecto.gen.migration add_patient_id_to_prescriptions`

`mix ecto.migrate`

`mix ecto.gen.migration add_practitioner_id_to_prescriptions`

`mix ecto.migrate`