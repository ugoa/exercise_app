class Backend::BackendController < ApplicationController
  before_filter :require_login
  
  private
  def require_login
    unless session[:author_id]
      redirect_to root_path
    end
  end
end
