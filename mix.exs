defmodule Tus.MixProject do
  use Mix.Project

  @version File.read!("VERSION") |> String.trim()

  def project do
    [
      app: :tus,
      version: @version,
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      description: "An Elixir sever for the resumable upload protocol “tus”",
      deps: deps(),
      package: package(),
      dialyzer: [ignore_warnings: "dialyzer.ignore-warnings"]
    ]
  end

  def package() do
    [
      files: ~w(lib mix.exs README.md LICENSE VERSION),
      licenses: ["BSD 3-Clause License"],
      maintainers: ["Juan-Pablo Scaletti", "juanpablo@jpscaletti.com"],
      links: %{github: "https://github.com/jpscaletti/elixir-tus"}
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Tus.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug, "~> 1.3"},
      {:uuid, "~> 1.1"},

      # Dependencies for Tus.Cache.redis
      # {:redix, ">= 0.0.0"},

      # Dependencies for Tus.Storage.S3
      # {:ex_aws, "~> 2.0"},
      # {:ex_aws_s3, "~> 2.0"},
      # {:hackney, "~> 1.9"},
      # {:sweet_xml, "~> 0.6"},

      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end
end