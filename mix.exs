defmodule Web3x.MixProject do
  use Mix.Project

  def project do
    [
      app: :web3x,
      version: "0.6.5",
      elixir: "~> 1.10",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      name: "web3x",
      source_url: "https://github.com/Metalink-App/web3x",
      dialyzer: [
        remove_defaults: [:unknown]
      ]
    ]
  end

  def application do
    [applications: [:logger, :ex_abi, :ethereumex, :ex_secp256k1]]
  end

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:ssl_verify_fun, "~> 1.1.7", manager: :rebar3, override: true},
      {:ethereumex, "~> 0.7.0"},
      {:ex_keccak, "~> 0.7.1"},
      {:ex_secp256k1, "~> 0.7.0"},
      {:ex_abi, "~> 0.6"},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false},
      {:jason, "~> 1.4"}
    ]
  end

  defp description do
    "(Another) high level Ethereum JSON RPC Client for Elixir"
  end

  defp package do
    [
      name: "web3x",
      files: ["lib", "mix.exs", "README*"],
      maintainers: ["William Leong"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/Metalink-App/web3x"}
    ]
  end
end
