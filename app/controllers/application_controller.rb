class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :increment_count

  def increment_count
    if session[:count].nil?
      session[:count] = 0
    end
    session[:count] += 1
    @count = session[:count]
  end
end
