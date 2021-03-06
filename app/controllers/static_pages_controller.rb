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
    request = "https://api.wistia.com/v1/projects/#{project_id}.json?api_password=#{ENV['AUTH_TOKEN']}"

    media_ids = []
    @each_video_stats = []

    @response = HTTP.get(request)
    @project_name = JSON.parse(@response)["name"]

    # handle errors (4xx & 5xx)
    if @response.status.client_error? || @response.status.server_error?
      flash[:info] = "We are currently verifying and setting up your account. Videos and statistics will be available after we verify you!"
      redirect_to root_path
      return
    end

    @response = HTTP.get(request).body # didnt get body to handle errors

    # 1: get embed code for each video using the hashed_id, put in list
    @video_iframe_urls = JSON.parse(@response)['medias'].map do |p|
      # get the media id for each video for 3
      media_ids.push(p['id'])
      "https://fast.wistia.com/embed/iframe/#{p["hashed_id"]}?version=v1&controlsVisibleOnLoad=true&playerColor=aae3d8"
    end

    # 2: get title for each video, put in list
    @video_names = JSON.parse(@response)['medias'].map do |p|
      p["name"]
    end

    # 3: get individual stats for each video using the media_ids for each video, put in list
    media_ids.each do |p|
      request = "https://api.wistia.com/v1/stats/medias/#{p}.json?api_password=#{ENV['AUTH_TOKEN']}"
      # use intermediate hash variable to convert to minutes
      @hash = JSON.parse(HTTP.get(request).body)
      @hash["hours_watched"] = @hash["hours_watched"] * 60
      # all stats should be WHOLE numbers except for play_rate & engagement
      @hash["load_count"] = @hash["load_count"]
      @hash["play_count"] = @hash["play_count"].to_i
      @hash["play_rate"] = @hash["play_rate"] * 100
      @hash["hours_watched"] = @hash["hours_watched"].to_i
      @hash["engagement"] = @hash["engagement"] * 100
      @hash["visitors"] = @hash["visitors"].to_i
      @each_video_stats.push(@hash)
    end
  end

  def statistics
    @cities = []
    @media_ids = []

    # get current_user's wistia_project_id & authorization token
    @current_user = current_user
    project_id = @current_user.wistia_project_id
    request = "https://api.wistia.com/v1/stats/projects/#{project_id}.json?api_password=#{ENV['AUTH_TOKEN']}"

    @statistics = HTTP.get(request)

    # handle errors (4xx & 5xx)
    if @statistics.status.client_error? || @statistics.status.server_error?
      flash[:info] = "We are currently verifying and setting up your account. Videos and statistics will be available after we verify you!"
      redirect_to root_path
      return
    end

    # statisticsd
    @statistics = JSON.parse(HTTP.get(request).body) # didnt get body to handle errors

    # obtain city statistics for all videos
    request = "https://api.wistia.com/v1/projects/#{project_id}.json?api_password=#{ENV['AUTH_TOKEN']}"
    @hash = @response = HTTP.get(request)

    # first, collect hashed IDs
    JSON.parse(@hash)["medias"].map do |m|
      @media_ids.push(m["hashed_id"])
    end

    # then, create city list from each video using hashed IDs
    @media_ids.map do |m|
      request = "https://api.wistia.com/v1/stats/events.json?api_password=#{ENV['AUTH_TOKEN']}&media_id=#{m}"
      @result = JSON.parse(HTTP.get(request).body)
      @hash = @result
      # iterate through that events list for each video
      @hash.map do |h|
        if not h["city"].to_s.empty?
          city_region = "#{h["city"]},&nbsp;#{h["region"]}".html_safe
          @cities.push(city_region)
        end
      end
    end
    
    # remove blanks
    @noEmptyCities = @cities.reject { |c| c.empty? }

    # finally, get top three cities for entire videos
    @hashmap = Hash.new(0)
    @noEmptyCities.map do |key|
      @hashmap[key] += 1
    end
    @topThreeHash = Hash[@hashmap.sort_by { |k,v| -v }[0..2]]
    @topThree = @topThreeHash.keys
  end

  def progress
    flash[:info] = "Current under construction! Please email leigh@flowvideo.com if you have project status questions."
    redirect_to videos_url
  end 
end