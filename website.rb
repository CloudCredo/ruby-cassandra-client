require 'sinatra'
require 'cfruntime'
require 'lib/user_repository'

get '/' do

  service_props = CFRuntime::CloudApp.service_props 'cassandra'

  username = service_props[:username]
  password = service_props[:password]
  host = service_props[:host]
  port = service_props[:port]

  data = UserRepository.new(username, password, host, port).findUserByFirstName

  "
   <b>Ruby Cassandra Client</b>
   <br>
   Cassandra url: #{url}
   <br>
  Cassandra port: #{port}
   <br>
  Cassandra Username: #{username}
    <br>
  Data read from Cassandra: #{data}
    <br>
  "

end