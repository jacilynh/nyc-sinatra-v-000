class FiguresController < ApplicationController
  # allows you to list all figures (FAILED - 6)
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
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(:name => params["Name"])
    @figure.title = Title.find_or_create_by(:name => params["Title Name"])
    # @figure.genre_ids = params[:genres]
    @figure.save
    # flash[:message] = "Successfully created figure."
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
