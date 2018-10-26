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
      title: "Beyonce",
      body: "This is the body for page 1 (text).",
      embed: "BB5zLq1zcdo",
      description: "Lemonade",
    },
    { id: 1,
      title: "Jessie J",
      body: "This is the body for page 2 (text).",
      embed: "j2WWrupMBAE&spfreload=10",
      description: "Who You are",
    },
    { id: 2,
      title: "Little Mix",
      body: "This is the body for page 3 (text).",
      embed: "Dw8B1q1tKgs",
      description: "Power"
    },
    { id: 3,
      title: "JoJo",
      body: "This is the body for page 4 (text).",
      embed: "ggWyUEuGcWY",
      description: "Leave Get Out`"
    },
    { id: 4,
      title: "Jennifer Hudson",
      body: "This is the body for page 5 (text).",
      embed: "CSE_S8WXQrI",
      description: "And I'm telling you I'm not going anywhere"
    }
  ]

    #static route
    get '/' do
      "<h1>Hello Youtube Page </h1>"
        @title_of_page = "Youtube page"
        @link = $posts
        erb :'posts/index'
    end

    # get '/new' do
    #   "<h1>Hello New Page </h1>"
    # end

    get "/:artist_name" do
      id = params[:artist_name].to_i
      @link = $posts[id]
      erb :"posts/show"
    end

end
