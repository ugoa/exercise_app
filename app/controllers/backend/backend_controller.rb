class Backend::BackendController < ApplicationController
  before_filter :require_login
  
  private
  def require_login
    unless session[:author_id]
  end
end
