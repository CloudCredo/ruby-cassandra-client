require "cassandra"

class UserRepository

  def initialize(username, password, host, port)
    @username = username
    @password = password
    @host = host
    @port = port
  end

  def connect()
    @client = Cassandra.new('Test', "#{@host}:#{@port}")
    #Needed as the client will try (and fail) and connect to a Cassandra instance on 127.0.0.1
    @client.disable_node_auto_discovery!
    @client.login!("#{@username}", "#{@password}")
  end

  def findUserByFirstName
    connect
    results = @client.get(:Standard1, "USER")
    results['firstname']
  end

end