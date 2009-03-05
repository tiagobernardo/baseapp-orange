class Admin::NewsController < ApplicationController
  require_role :admin
  layout 'admin'
end
