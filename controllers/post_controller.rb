class PostController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), "..")

  set :view, Proc.new { File.join(root, "views") }



  configure:development do
    register Sinatra::Reloader
  end

  $posts = [{
      id: 0,
      title: "Page 1",
      body: "This is the body for page 1 (text). Topping danish cheesecake. Biscuit cake topping jelly-o pudding jelly gummies. Powder wafer chupa chups cheesecake jujubes soufflé jelly tootsie roll."
    },
    { id: 1,
      title: "Page 2",
      body: "This is the body for page 2 (text). Topping danish cheesecake. Biscuit cake topping jelly-o pudding jelly gummies. Powder wafer chupa chups cheesecake jujubes soufflé jelly tootsie roll."
    },
    { id: 2,
      title: "Page 3",
      body: "This is the body for page 3 (text). Topping danish cheesecake. Biscuit cake topping jelly-o pudding jelly gummies. Powder wafer chupa chups cheesecake jujubes soufflé jelly tootsie roll."
    },
    { id: 3,
      title: "Page 4",
      body: "This is the body for page 4 (text). Topping danish cheesecake. Biscuit cake topping jelly-o pudding jelly gummies. Powder wafer chupa chups cheesecake jujubes soufflé jelly tootsie roll."
    },
    { id: 4,
      title: "Page 5",
      body: "This is the body for page 4 (text). Topping danish cheesecake. Biscuit cake topping jelly-o pudding jelly gummies. Powder wafer chupa chups cheesecake jujubes soufflé jelly tootsie roll."
    }
  ]

  get "/" do
    "<h1>Main !!</h1>"
    @title_of_this_page = "Youtube page"
    @post = $posts
    erb :'posts/index'
  end

  get "/:id_from_URL" do
    id = params[:id_from_URL].to_i
    @post = $posts[id]
    erb :'posts/show'
  end

  get "/:id_from_URL/edit" do
    id = params[:id_from_URL].to_i
    @post = $posts[id]
    erb :'posts/edit'
  end



end
