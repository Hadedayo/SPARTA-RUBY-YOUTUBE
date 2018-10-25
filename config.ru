#ALl the pre-requisites come here

require "sinatra"
require "sinatra/contrib"
# require "color_text"
require "sinatra/reloader" if development?
require_relative "./controllers/post_controller.rb"

use Rack::Reloader
run PostController
