# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  include RoleRequirementSystem
  
  helper :all # include all helpers, all the time
  helper_method :s 
  filter_parameter_logging :password, :password_confirmation
  before_filter :set_locale_and_keywords
  
  def set_locale_and_keywords
    #change this to search the locale on subdomain, on cookie or whatever you like
    if !session[:locale].nil? 
      I18n.locale = session[:locale].to_s  
      params[:locale] = session[:locale].to_s
    else
      params[:locale] = I18n.default_locale.to_s
      session[:locale] = I18n.default_locale.to_s
      I18n.locale= I18n.default_locale.to_s
    end
    
    @page_description = configatron.meta_keywords
    @page_keywords = configatron.meta_keywords
  end
  
  # Return the value for a given setting
  def s(identifier)
    Setting.get(identifier)
  end

  #used for sorting in backoffice
  def sort_order(default)
    "#{(params[:order] || default.to_s).gsub(/[\s;'\"]/,'')} #{params[:dir] == 'down' ? 'DESC' : 'ASC'}"
  end

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '9fe6825f97cc334d88925fde5c4808a8'
end
