class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  include SessionsHelper

  def hello
    render html: "hello, world!"
  end

  def goToOuterUrl
  	outerUrl = Shortenurl.find_by(key: params[:key]).originalUrl
  	redirect_to outerUrl
  end

  def nothing

  end
end
