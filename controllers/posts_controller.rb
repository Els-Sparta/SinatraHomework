# THe symbol '<' will inherit the properties from another existing class
class PostsController < Sinatra::Base
  # sets the root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')
  # sets the view directory correctly
  set :views, Proc.new { File.join(root, 'views')}

  configure :development do
    register Sinatra::Reloader
  end

  get "/movies" do
    "Hello there"
    erb :'posts/index'
  end

  get "/movies/new" do
    "Requesting a new movie to the server"
  end

  post "/movies" do
    "Posting a new movie to the server"
  end

  get "/movies/:id" do
    id = params[:id]
    "Retrieve a specific #{id} (movie)"
  end

  get "/movies/:id/edit" do
    id = params[:id]
    "Edit that specifc #{id} (movie)"
  end

  put "/movies/:id" do
    id = params[:id]
    "Updates a specifc #{id}"
  end

  delete "/movies/:id" do
    id = params[:id]
    "Delete a specifc #{id}"
  end
end
