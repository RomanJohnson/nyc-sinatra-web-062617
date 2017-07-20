require 'pry'
class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :"figures/index.html"
  end

  get '/figures/new' do
    erb :'figures/new.html'
  end

  post '/figures' do
    figure = Figure.new(params[])
    redirect '/figures'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"figures/show.html"
  end

  patch '/figures/:id' do
    #to do
    redirect '/figures/:id'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :"figures/edit.html"
  end
end
