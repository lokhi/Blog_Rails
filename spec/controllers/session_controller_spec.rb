require 'spec_helper'

describe SessionController do
  describe "GET '/session/new'" do
    it "should redirect to the Sauth" do
      get 'new'
      response.should redirect_to("http://sauth:4567/lokhilabs/session/new?origin=/session&amp;secret=blog")
    end
  end
  describe "GET '/session'" do
    before(:each) do
      @login="591r9civmBm7WDumkoao8Ji6Nd0i7RX31n2UtK5jezFSbchDJ-jQX5FXAPoClEAbNny5zTSkjlN6Ci7TvU9Dxi4mXhOPtI74vuK4gJNULyoDLcjYQm-ViB9at9nPI3sH7FaOkTfszAP3w1LH-fOAc867QH7L7uZZLQQQ5wrkeWI="
       @key="-----BEGIN RSA PRIVATE KEY-----
MIICXwIBAAKBgQDvqAuECzBu8JYrYleC245UZVyB3N11guYosh0fHaAstywPWblH
wq0es92nxEtp/qin051s+48/0lu1eKQnpfhRqOImxRhnyn9Vl7eR2Ssjg/yIhu+Q
1nQgAnviWa6ktFbKgnxayy4Jd2a0XDsnxDWr21bQmEbgekzzcZIEijHeLQIDAQAB
AoGBAKndvmvVUnsP5CDUD5sc7AE95xfU6NOF+IUX2jRX11RacMxgmEcY4YRFkPJ8
28dBTWHHSGoa1Co0e/RgklnX9ezsT5sYIcqH2CBw8p1U8o8182FcgIyd/4/3vuyq
Qbl6xJz0WpSkKVM8NGs03/ZczHW7MPvXzbok0V4WSHa5EbIxAkEA+30OEzsXcfBu
9bU8UpqfoApd5BwbnIDhizEucwMqWdm2b32/vLZGYeCCdMn+oxExQvb0A6or3jeW
gR2T+9yt6wJBAPP0pudcba2GMR1O0KrT8p2tN0Sez1+UKAG2vUkP72I8lBRzuKs8
Wyi0YYM2G7jsePdCkfTToQrbyhq4v9GWZkcCQQCexzC4wYkm3bcgmGFSgd8gKwtm
dryUDebYe5+o66m0erktIQaKPcaoCxgyZknHaJZiggpDug/iR9RVBnik/oorAkEA
3cnpC6JuXDoJ4PlMoGI8yrk16/7tzZlmndhDUm9YVVl5zvY+R/+BaQpFNQM2RPNI
LpOpGopkePjFT3HzglpX9QJBANm8xkkaGZQ76zbxIKMxWyyDY14wQ46RfFUtMD8i
6d/TDWlkVLVH4PszANlp1AmHvRyuCLSbkQA6NwLFRkBO6Ho=
-----END RSA PRIVATE KEY-----"
	   File.stub(:read){@key}
	   SessionController.stub(:decypher)
     @params={"login"=>@login, "secret"=>"blog" }
    end
    
    it"should include crypteencode" do
      SessionController.included_modules.should include(SessionHelper)
    end
    
    it "should read the private key" do
      File.should_receive(:read)
      get 'create',@params
    end
    
    it "should put the decrypt login into the session current_user" do
      get 'create',@params
      session["current_user"].should == "toto"
    end
    
    it "should redirect to the posts page" do
      get 'create',@params
      response.should redirect_to(posts_path)
    end
  end
  
  
  describe "DELETE '/session'" do
    it "should put the session[current_user] to nil" do
      get 'delete'
      session["current_user"].should be_nil
    end
  end
end
