# THe symbol '<' will inherit the properties from another existing class
class PostsController < Sinatra::Base
  # sets the root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')
  # sets the view directory correctly
  set :views, Proc.new { File.join(root, 'views')}

  configure :development do
    register Sinatra::Reloader
  end

  # All the posts that are avaiable to view
  $posts = [{
    id:0,
    title: "The Shawshank Redemption",
    release_year: '1994',
    rating: '9.2'
  },
  {
    id:1,
    title: "The Godfather",
    release_year: '1972',
    rating: '9.2'
  },
  {
    id:2,
    title: "The Godfather: Part II",
    release_year: '1974',
    rating: '9.0'
  },
  {
    id:3,
    title: "The Dark Knight",
    release_year: '2008',
    rating: '9.0'
  },
  {
    id:4,
    title: "12 Angry Men",
    release_year: '1957',
    rating: '8.9'
  },
  {
    id:5,
    title: "Schindler's List",
    release_year: '1993',
    rating: '8.9'
  },
  {
    id:6,
    title: "Lord of the Rings: The Return of the King",
    release_year: '2003',
    rating: '8.9'
  }]

  get "/movies" do
    @title = "Top Rated Movies"
    @posts = $posts
    erb :'posts/index'
  end

  get "/movies/new" do
    @title = "Request new Movie"
    @post = {
      id: "",
      title: "",
      release_year: "",
      rating: ""
    }
    erb :'posts/new'
  end

  post "/movies" do
    new_movie = {
      id: $posts.length,
      title: params[:title],
      release_year: params[:release_year],
      rating: params[:rating]
    }

    $posts.push(new_movie)

    redirect "/"
  end

  get "/movies/:id" do
    id = params[:id].to_i
    @title = "Movie #{id}"
    @post = $posts[id]
    erb :'posts/show'
  end

  get "/movies/:id/edit" do
    id = params[:id].to_i
    @title = "Edit Movie #{id}"

    @post = $posts[id]

    erb :'posts/edit'
  end

  put "/movies/:id" do
    id = params[:id].to_i
    "Updates a specifc #{id}"
  end

  delete "/movies/:id" do
    id = params[:id]
    "Delete a specifc #{id}"
  end
end
