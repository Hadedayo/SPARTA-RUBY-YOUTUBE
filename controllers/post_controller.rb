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
      link: "https://www.youtube.com/watch?v=BB5zLq1zcdo",
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
      "<h1>Hello New Page </h1>"
        @title_of_page = "Youtube page"
        @post = $posts
        erb :'posts/index'
    end


    get '/new' do
      "<h1>Hello New Page </h1>"
    end

    # dynamic route
    get "/beyonce" do
      id = params[:beyonce].to_i
      @link = $posts[id]
      erb :'posts/beyonce'

    end

    get "/jessie_j" do
      id = params[:jessie_j].to_i
      @link = $posts[id]
      erb :'posts/jessiej'
    end

    get "/little_mix" do
      id = params[:little_mix].to_i
      @link = $posts[id]
      erb :'posts/littlemix'
    end

    get "/jojo" do
      id = params[:jojo].to_i
      @link = $posts[id]
      erb :'posts/jojo'
    end

    get "/jennifer_hudson" do
      id = params[:jennifer_hudson].to_i
      @link = $posts[id]
      erb :'posts/jenniferhudson'
    end


end
