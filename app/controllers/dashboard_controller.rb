class DashboardController < ApplicationController
  # GET /
  # The default dashboard
  def index
  end
  def change_language
    if params[:id] && (LANGUAGES.include?params[:id])
      session[:locale] = params[:id]
      I18n.locale = params[:id]
    end
    
    redirect_to :action=>:index
  end
end
