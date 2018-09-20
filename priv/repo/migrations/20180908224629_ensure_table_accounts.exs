defmodule PostgresPubSub.Repo.Migrations.EnsureTableAccounts do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:accounts) do
      add(:username, :string, null: true)
    end
  end
end
