# Link sinatra server
require 'sinatra'
require 'sinatra/contrib'
# To allow you to continue working on the code and see changes in the broswer without having to restart the server
require 'sinatra/reloader' if development?
# The debugger
require 'pry'
# To link the config file to the controller
require_relative './controllers/posts_controller'

use Rack::Reloader
use Rack::MethodOverride
# Direct the request to the correct controller
run PostsController
