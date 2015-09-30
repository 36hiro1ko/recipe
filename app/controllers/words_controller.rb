class WordsController < ApplicationController
  
  def new
    @recipes = recipe_search
    #binding.pry
  end
  
  def recipe_search
    @applicationId = ENV['APPLICATION_ID']
    uri = "https://app.rakuten.co.jp"
    conn = Faraday::Connection.new(:url => uri) do |builder|
        builder.use Faraday::Request::UrlEncoded
        builder.use Faraday::Response::Logger
        builder.use Faraday::Adapter::NetHttp 
    end
    
    res = conn.post do |req|
      req.url '/services/api/Recipe/CategoryRanking/20121121'
      req.body = {
        :format =>  "json",
        :applicationId => @applicationId,
        :elements => "recipeTitle,recipeUrl,foodImageUrl"     
      }
    end
   @json_hash = JSON.parse(res.body)
   #puts body #コンソール出力用
   #return @json_hash

  end
    
  def show
    if params[:q]
      @instagrams = Instagram.tag_recent_media(URI.encode(params[:q]))
    end
  end
    
        
end
