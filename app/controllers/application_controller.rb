class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  include SessionsHelper
  
  def hello
    render html: "hello, world!"
  end
end
