require "../lib/user_repository"

describe "Cassandra Client" do

  it "should connect to a Cassandra client" do
       actual = UserRepository.new.findUserByFirstName
       actual.should eq "Chris"
  end

end