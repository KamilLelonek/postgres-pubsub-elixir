defmodule PostgresPubSub.Repo.Migrations.CreateTriggerForAccounts do
  use Ecto.Migration

  @table_name "accounts"
  @function_name "notify_account_changes"
  @trigger_name "accounts_changed"

  def change do
    execute("DROP TRIGGER IF EXISTS #{@trigger_name} ON #{@table_name}")

    execute("""
      CREATE TRIGGER #{@trigger_name}
      AFTER INSERT OR UPDATE
      ON #{@table_name}
      FOR EACH ROW
      EXECUTE PROCEDURE #{@function_name}()
    """)
  end

  def down do
    execute("DROP TRIGGER IF EXISTS #{@trigger_name} ON #{@table_name}")
  end
end
