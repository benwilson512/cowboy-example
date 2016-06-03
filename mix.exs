defmodule HelloWorld.Mixfile do
  use Mix.Project

  def project do
    [ app: :hello_world,
      version: "0.0.1",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [ mod: { HelloWorld, [] },
      applications: [:cowboy] ]
  end

  defp deps do
    [
      {:cowboy, "1.0.4"}
    ]
  end
end
