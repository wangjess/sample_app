class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def about
  end

  def videos
    # get current_user's wistia_project_id & authorization token
    @current_user = current_user
    project_id = @current_user.wistia_project_id
    auth_token = "b85eb878c603fbe6f87bb758ca5cffd93dbdd14d26fabe3174706116bd3912a3"
    request = "https://api.wistia.com/v1/projects/#{project_id}.json?api_password=#{auth_token}"
    @response = HTTP.get(request).body
    list = []
    # get embed code for each video using the hashed_id
    JSON.parse(@response)['medias'].each do |p|
      puts p["hashed_id"]
      list.append(HTTP.get("http://fast.wistia.com/embed/iframe/#{p["hashed_id"]}?version=v1&controlsVisibleOnLoad=true&playerColor=aae3d8").body)
    end
    @videos = list
    puts @videos
  end

  def statistics
  end

  def progress
  end
end
