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
    redirect to "/figures/#{@figure.slug}"
  end
  # allows you to see a single Figure (FAILED - 7)
  get '/figures/:slug' do
    @figure = Figure.find_by_slug(params[:slug])
    erb :'/figures/show'
  end
  # allows you to view form to edit a single figure (FAILED - 8)
  # allows you to edit a single figure (FAILED - 9)
  get '/figures/:slug/edit' do
    @figure = Figure.find_by_slug(params[:slug])
    # @song_genres = @figure.genre_ids
    erb :'/figures/edit'
  end

  patch '/figures/:slug' do
    @figure = Figure.find_by_slug(params[:slug])
    @figure.name.update(params["Name"])
    # @figure.artist = Artist.find_or_create_by(params["Artist Name"])
    # @figure.artist.update
    # @figure.genres = Genre.find_by(params["song"]["genre_ids"])
    # @figure.genres.update
    # flash[:message] = "Successfully updated song."
    redirect to "/figures/#{@figure.slug}"
  end

end
