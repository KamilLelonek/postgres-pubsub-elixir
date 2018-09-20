defmodule PostgresPubSub.Repo.Migrations.CreateNotificationFunctionForAccounts do
  use Ecto.Migration

  @table_name "accounts"
  @function_name "notify_account_changes"
  @event_name "accounts_changed"

  def up do
    execute("""
      CREATE OR REPLACE FUNCTION #{@function_name}()
      RETURNS trigger AS $$
      BEGIN
        PERFORM pg_notify(
          '#{@event_name}',
          json_build_object(
            'operation', TG_OP,
            'record', row_to_json(NEW)
          )::text
        );

        RETURN NEW;
      END;
      $$ LANGUAGE plpgsql;
    """)
  end

  def down do
    execute("DROP FUNCTION IF EXISTS #{@function_name} CASCADE")
  end
end
