# FunboxTest

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Make request to:
POST http://localhost:4000/visited_links
Data example for POST request
{
"links": [
"https://ya.ru",
"https://ya.ru?q=123",
"funbox.ru",
"https://stackoverflow.com/questions/11828270/how-to-exit-the-vim-editor"
]
}

GET http://localhost:4000/visited_domains?from=1545221231&to=1545217638

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
