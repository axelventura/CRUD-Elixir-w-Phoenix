FROM elixir:1.18.2

RUN mix local.hex --force && mix local.rebar --force

# Instalar Node.js para assets
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - \
  && apt-get install -y nodejs

WORKDIR /app

COPY mix.exs mix.lock ./
COPY config config
RUN mix deps.get

COPY . .

RUN mix compile

EXPOSE 4000

CMD ["mix", "phx.server"]
