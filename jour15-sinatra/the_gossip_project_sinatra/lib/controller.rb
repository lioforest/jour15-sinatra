require "gossip"

class ApplicationController < Sinatra::Base
  get '/' do
	erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
  	erb :new_gossip
  end

  post '/gossips/new/' do
	Gossip.new(params["gossip_author"], params["gossip_content"]).save
	redirect '/'

  end


  get '/gossip/:id' do
  	
  	erb :show, locals: {gossips: Gossip.find(params['id'])}
  
  end


  get '/gossip/:id/edit/' do
  	
  	erb :edit, locals: {gossips: Gossip.find(params['id'])}
  
  end

  post '/gossip/:id/edit/' do
  	


#	Gossip.new(params["gossip_author"], params["gossip_content"],params(['id']).update

 	Gossip.update(params['id'].to_i, params["gossip_author"], params["gossip_content"])
	redirect '/'
 
  end


end
