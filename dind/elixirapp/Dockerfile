FROM  elixir:1.14
WORKDIR /app
RUN apt-get update
RUN apt-get install inotify-tools -y

RUN mix local.rebar --force
RUN mix local.hex --force

COPY mix.exs mix.lock ./
RUN mix deps.get
COPY . .

CMD ["mix", "phx.server"]