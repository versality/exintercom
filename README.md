# ExIntercom

[![Build Status](https://travis-ci.org/versality/exintercom.svg?branch=master)](https://travis-ci.org/versality/exintercom) [![Inline docs](http://inch-ci.org/github/versality/exintercom.svg?branch=master&style=flat)](http://inch-ci.org/github/versality/exintercom) [![hex.pm version](https://img.shields.io/hexpm/v/exintercom.svg)](https://hex.pm/packages/exintercom)

Elixir library for the [Intercom API](https://api.intercom.io)

**Currently has very limited functionality with read-only access.**

## Roadmap

- [x] Fetch conversations / conversation
- [x] Fetch user
- [x] OAuth
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

3. Add **Intercom** credentials to `config.exs`:
  ```elixir
  config :exintercom,
    app_id: "...",
    app_key: "..."
    client_id: "..." # Optional, for OAuth only
    client_secret: "..." # Optional, for OAuth only
    ```

  If no config set, env variables will be used instead with the following names:

  ```bash
  app_id        -> INTERCOM_APP_ID
  app_key       -> INTERCOM_APP_KEY
  client_id     -> INTERCOM_CLIENT_ID
  client_secret -> INTERCOM_CLIENT_SECRET
  ```

4. Do `mix deps.get`


## Usage

```elixir
iex> ExIntercom.Conversation.find_all
[%{"assignee" => %{"id" => "...", "type" => "..."}, ...]

iex> ExIntercom.Conversation.find(id: "1")
%{...}

iex> ExIntercom.User.find(id: "1")
%{...}

iex> ExIntercom.oauth_url("http://your_callback_url.com", "your_state")
https://app.intercom.io/oauth?...
```
