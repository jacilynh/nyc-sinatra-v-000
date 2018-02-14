class LandmarksController < ApplicationController
# allows you to list all landmarks (FAILED - 12)
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end
  # allows you to view form to create a new landmark (FAILED - 10)
  # allows you to create a new landmark (FAILED - 11)
  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    redirect to "/landmarks/#{@landmark.id}"
  end
  # allows you to see a single landmark (FAILED - 13)
  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/show'
  end
  # allows you to view the form to edit a single landmark (FAILED - 14)
  # allows you to edit a single landmark (FAILED - 15)
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.name = params["landmark"]["name"]
    @landmark.year_completed = params["landmark"]["year_completed"]
    @landmark.save
    redirect to "landmarks/#{@landmark.id}"
  end

end
