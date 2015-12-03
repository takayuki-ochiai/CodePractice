class QiitaClient
 def initialize
   @test = "hoge"
 end

 def test
   puts @test
 end
end

client = QiitaClient.new

client.test
