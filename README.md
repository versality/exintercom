# ExIntercom

[![Build Status](https://travis-ci.org/versality/exintercom.svg?branch=master)](https://travis-ci.org/versality/exintercom) [![Inline docs](http://inch-ci.org/github/versality/exintercom.svg?branch=master&style=flat)](http://inch-ci.org/github/versality/exintercom) [![hex.pm version](https://img.shields.io/hexpm/v/exintercom.svg)](https://hex.pm/packages/exintercom)

Elixir library for the [Intercom API](https://api.intercom.io)

**Currently has very limited functionality with read-only access.**

## Roadmap

- [x] Fetch conversations / conversation
- [x] Fetch user
- [ ] Fetch companies
- [ ] Fetch admins
- [ ] Fetch segments
- [ ] Fetch leads
- [ ] Fetch notes

## Documentation

http://hexdocs.pm/exintercom

## Installation

1. Add exintercom to your list of dependencies in `mix.exs`:

  ```elixir
  def deps do
    [{:exintercom, "~> 0.1.0"}]
  end
  ```

2. Ensure exintercom is started before your application:
  ```elixir
  def application do
    [applications: [:exintercom]]
  end
  ```

3. Add Intercom `app_id` and `app_key` to `config.exs`:
  ```elixir
  config :exintercom,
    intercom_app_id: "...",
    intercom_app_key: "..."
    ```

## Usage

```elixir
iex> ExIntercom.Conversation.find_all
[%{"assignee" => %{"id" => "...", "type" => "..."}, ...]

iex> ExIntercom.Conversation.find(id: "1")
%{...}

iex> ExIntercom.User.find(id: "1")
%{...}
```
