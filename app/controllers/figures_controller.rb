class FiguresController < ApplicationController
  # create

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all

    erb :'figures/new'
  end

  post '/figures' do
    figure = Figure.new(params[:figure])
    figure.landmarks.build(params[:landmark]) unless params[:landmark][:name].empty?
    figure.titles.build(params[:title]) unless params[:title][:name].empty?
    figure.save
  end

  # read

  get '/figures' do
    @figures = Figure.all

    erb :'figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])

    erb :'figures/show'
  end

  # update

  get '/figures/:id/edit' do
    @figure = Figure.find_by(id: params[:id])
    @landmarks = Landmark.all
    @titles = Title.all

    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    figure = Figure.find_by(id: params[:id])
    figure.update(params[:figure])
    figure.landmarks.build(params[:landmark]) unless params[:landmark][:name].empty?
    figure.titles.build(params[:title]) unless params[:title][:name].empty?
    figure.save

    redirect "/figures/#{figure.id}"
  end
end
