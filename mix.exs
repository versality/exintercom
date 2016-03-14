defmodule ExIntercom.Mixfile do
  use Mix.Project

  def project do
    [app: :exintercom,
     version: "0.1.6",
     elixir: "~> 1.2",
     description: description,
     package: package,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     preferred_cli_env: [
        vcr: :test, "vcr.delete": :test, "vcr.check": :test, "vcr.show": :test
      ],
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:poison, "~> 1.5 or ~> 2.0"},
     {:httpoison, "~> 0.8.0"},
     {:exvcr, "~> 0.7", only: :test},
     {:earmark, "~> 0.1", only: :dev},
     {:ex_doc, "~> 0.11", only: :dev},
     {:credo, "~> 0.3", only: [:dev, :test]},
     {:inch_ex, "~> 0.5", only: :docs}]
  end

  defp description do
    """
    Intercom client library.
    """
  end

  defp package do
    [# These are the default files included in the package
     maintainers: ["Artyom Pertsovsky"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/versality/exintercom"}]
  end
end
