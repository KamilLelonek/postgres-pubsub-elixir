defmodule PostgresPubSub.Listener do
  use GenServer

  alias PostgresPubSub.Repo

  require Logger

  @event_name "accounts_changed"

  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]}
    }
  end

  def start_link(opts \\ []),
    do: GenServer.start_link(__MODULE__, opts)

  def init(opts) do
    with {:ok, _pid, _ref} <- Repo.listen(@event_name) do
      {:ok, opts}
    else
      error -> {:stop, error}
    end
  end

  def handle_info({:notification, _pid, _ref, @event_name, payload}, _state) do
    with {:ok, data} <- Poison.decode(payload, keys: :atoms) do
      data
      |> inspect()
      |> Logger.info()

      {:noreply, :event_handled}
    else
      error -> {:stop, error, []}
    end
  end

  def handle_info(_, _state), do: {:noreply, :event_received}
end
