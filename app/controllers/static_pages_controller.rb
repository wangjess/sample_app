class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def about
  end

  def videos
    result = HTTP.via("localhost", 8080).get("https://swapi.co/api/people/1")
  end

  def statistics
  end

  def progress
  end
end
