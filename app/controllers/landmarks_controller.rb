class LandmarksController < ApplicationController
  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do

  end
end
