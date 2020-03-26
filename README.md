# FunboxTest

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`
  
Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Application accepts request to:<br>
 - POST [/visited_links]()<br>
Data example:<br>
{<br>
&nbsp;&nbsp;"links": [<br>
&nbsp;&nbsp;&nbsp;&nbsp;"https<span>://</span>ya.ru",<br>
&nbsp;&nbsp;&nbsp;&nbsp;"https<span>://</span>ya.ru?q=123",<br>
&nbsp;&nbsp;&nbsp;&nbsp;"funbox.ru",<br>
&nbsp;&nbsp;&nbsp;&nbsp;"https<span>://</span>stackoverflow.com/questions/11828270/how-to-exit-the-vim-editor"<br>
&nbsp;&nbsp;]<br>
}<br>
Content-Type "application/json" 

 - GET [/visited_domains?from={timestamp_in_seconds}&to={timestamp_in_seconds}]()<br>
Parameter 'from' must be greater then 'to'

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
