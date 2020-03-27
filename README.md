# FunboxTest for Elixir developers

Variables needed to connect application to running Redis server are defined in `/config/dev.secret.exs`<br>
Defaults are:<br>
`redis_host: "http://localhost"`<br>
`redis_port: "6379"`

You can execute the following to download and start Redis server with the above prerequisites<br>
`bash install.sh`<br>
`cd redis-5.0.8 && src/redis-server`

Database record keys are prefixed with 'funbox_test.'

To start Phoenix server:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`
  
Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

To run tests execute<br>
`mix test`<br>
It will automaticly populate test data to database in order for tests to succeed.

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
