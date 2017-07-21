require 'pry'
class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :"figures/index.html"
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new.html'
  end

  post '/figures' do


    @figure = Figure.create(params["figure"])

    if params["figure"]["title_ids"]
      @figure.titles << Title.find(params["figure"]["title_ids"])
    end

    if params["title"]["name"]
      @figure.titles << Title.create(name: params["title"]["name"])
    end
    ######
    if params["figure"]["landmark_ids"]
      @figure.landmarks << Landmark.find(params["figure"]["landmark_ids"])
    end

    if params["title"]["name"]
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
    end
      ###########
      # if !params["figure"]["title_ids"].empty?
      #   @figure.titles << Title.find(params["figure"]["title_ids"])
      # end
      # if !params["title"]["name"].empty?
      #
      # end


    @figure.save
    redirect '/figures'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"figures/show.html"
  end

  patch '/figures/:id' do
    #to do
    @figure = Figure.find(params[:id])
    @figure.update(params["figure"])
    if params["title"]["name"]
    title= Title.find_or_create_by(params["title"]["name"])
    @figure.titles << title
    end
    if params["landmark"]["name"]
    landmark = Landmark.find_or_create_by(params["landmark"]["name"])
    @figure.landmarks << landmark
    end



    @figure.save


  
    # if 1+1
    # end


    redirect "/figures/#{@figure.id}"

  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/edit.html"
  end
end
