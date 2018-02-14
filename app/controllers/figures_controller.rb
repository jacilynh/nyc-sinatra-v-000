class FiguresController < ApplicationController
  # allows you to list all figures
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end
  # allows you to view form to create a new figure (FAILED - 1)
  # allows you to create a new figure with a title (FAILED - 2)
  # allows you to create a new figure with a landmark (FAILED - 3)
  # allows you to create a new figure with a new title (FAILED - 4)
  # allows you to create a new figure with a new landmark (FAILED - 5)
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])

    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
    end

    if !params["title"]["name"].empty?
      @figure.titles << Title.create(name: params["title"]["name"])
    end

    @figure.save
    redirect to "/figures/#{@figure.id}"
  end
  # allows you to see a single Figure (FAILED - 7)
  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end
  # allows you to view form to edit a single figure (FAILED - 8)
  # allows you to edit a single figure (FAILED - 9)
  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params["figure"])
    if !params["landmark"]["name"].empty?
      @owner.landmarks << Landmark.create(name: params["landmark"]["name"])
    end
    if !params["title"]["name"].empty?
      @owner.titles << Title.create(name: params["title"]["name"])
    end
    redirect to "figures/#{@figure.id}"
  end

end
