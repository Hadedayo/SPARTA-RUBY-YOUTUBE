class PostController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), "..")

  set :view, Proc.new { File.join(root, "views") }



  configure:development do
    register Sinatra::Reloader
  end

  #   find out what the $ is used for here
  #  $: identifies a global variable
  $posts = [{
      id: 0,
      title: "Video 1",
      body: "This is the body for page 1 (text)."
    },
    { id: 1,
      title: "Video 2",
      body: "This is the body for page 2 (text)."
    },
    { id: 2,
      title: "Video 3",
      body: "This is the body for page 3 (text)."
    },
    { id: 3,
      title: "Video 4",
      body: "This is the body for page 4 (text)."
    },
    { id: 4,
      title: "Video 5",
      body: "This is the body for page 5 (text)."

    }
  ]

    #static route

    get '/' do
      "<h1>Hello New Page </h1>"
        @title_of_page = "Youtube page"
        @post = $posts
        erb :'posts/index'
    end


    get '/new' do
      "<h1>Hello New Page </h1>"
    end

    # dynamic route
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
