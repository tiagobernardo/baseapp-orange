class Admin::AdminController < ApplicationController
  #note: this controller does... nothing
  #it's just a placeholder to put common admin code. 
  #just remember to make other controllers inherit Admin::AdminController
  #enjoy
  inherit_resources  
  layout 'admin'
  respond_to :html, :xml
  require_role :admin
  defaults :route_prefix=>'admin'
end
