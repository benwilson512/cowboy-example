defmodule HelloWorld do
  use Application

  def start(_type, _args) do
    dispatch = :cowboy_router.compile([
                 {:_, [{"/", HelloWorld.TopPageHandler, []}]}
               ])
    {:ok, _} = :cowboy.start_http(:http, 100,
                                  [port: 8081],
                                  [env: [dispatch: dispatch]])
    import Supervisor.Spec, warn: false

    children = []
    opts = [strategy: :one_for_one, name: Hello.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
