defmodule PostgresPubSub.Account do
  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "accounts" do
    field(:username, :string)
  end
end
