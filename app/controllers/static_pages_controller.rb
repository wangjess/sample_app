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

    @response = HTTP.get(request)
    @project_name = JSON.parse(@response)["name"]

    # handle errors (4xx & 5xx)
    if @response.status.client_error? || @response.status.server_error?
      flash[:info] = "Looks like you have no videos!"
      redirect_to root_path
      return
    end

    @response = HTTP.get(request).body # didnt get body to handle errors

    puts @response

    # get embed code for each video using the hashed_id, put in list
    @video_iframe_urls = JSON.parse(@response)['medias'].map do |p|
      "https://fast.wistia.com/embed/iframe/#{p["hashed_id"]}?version=v1&controlsVisibleOnLoad=true&playerColor=aae3d8"
    end
  end

  def statistics
    # get current_user's wistia_project_id & authorization token
    @current_user = current_user
    project_id = @current_user.wistia_project_id
    auth_token = "b85eb878c603fbe6f87bb758ca5cffd93dbdd14d26fabe3174706116bd3912a3"
    request = "https://api.wistia.com/v1/stats/projects/#{project_id}.json?api_password=#{auth_token}"

    @response = HTTP.get(request)

    # handle errors (4xx & 5xx)
    if @response.status.client_error? || @response.status.server_error?
      flash[:info] = "Looks like you have no videos!"
      redirect_to root_path
      return
    end

    @response = JSON.parse(HTTP.get(request).body) # didnt get body to handle errors
    
    puts @response
  end

  def progress
  end 
end
