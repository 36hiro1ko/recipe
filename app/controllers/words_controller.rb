class WordsController < ApplicationController
  
  # def new
  # end
    
  def show
    #@instagrams = Instagram.tag_recent_media(URI.encode("forever21"))
    if params[:q]
      @instagrams = Instagram.tag_recent_media(URI.encode(params[:q]))
    end
  end
    
        
end
