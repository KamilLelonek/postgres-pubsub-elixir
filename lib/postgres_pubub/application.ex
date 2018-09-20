defmodule PostgresPubSub.Application do
  use Application

  alias PostgresPubSub.{Repo, Listener}

  def start(_type, _args),
    do: Supervisor.start_link(children(), opts())

  defp children do
    [
      Repo,
      Listener
    ]
  end

  defp opts do
    [
      strategy: :one_for_one,
      name: PostgresPubSub.Supervisor
    ]
  end
end
