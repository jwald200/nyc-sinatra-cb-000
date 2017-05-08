class LandmarksController < ApplicationController

  # create
  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do
    landmark = Landmark.new(params[:landmark])
    landmark.save
  end

  # read
  get '/landmarks' do
    @landmarks = Landmark.all

    erb :'landmarks/index'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by(id: params[:id])

    erb :'landmarks/show'
  end

  # update

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by(id: params[:id])

    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    landmark = Landmark.find_by(id: params[:id])
    landmark.update(params[:landmark])

    redirect "/landmarks/#{landmark.id}"
  end
end
