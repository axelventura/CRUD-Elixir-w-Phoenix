FROM elixir:1.18.2

RUN mix local.hex --force && \
    mix local.rebar --force

RUN apt-get update && apt-get install -y nodejs npm git build-essential

WORKDIR /app

COPY . .

RUN HEX_HTTP_CONCURRENCY=1 HEX_HTTP_TIMEOUT=120 mix deps.get

RUN mix compile

EXPOSE 4000

CMD ["mix", "phx.server"]
