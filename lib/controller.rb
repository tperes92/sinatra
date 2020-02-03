require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
  	erb :index #oriente vers le fichier index rangé dans le fichier views
  end

  get '/gossips/new/' do
  	erb :new_gossip #oriente vers le fichier new_gossip rangé dans le fichier views
  end

  post '/gossips/new/' do
  	Gossip.new(params["gossip_author"], params["gossip_content"]).save
  	redirect '/'
  end

  get '/' do
  	erb :index, locals: {gossips: Gossip.all}
  end
end

