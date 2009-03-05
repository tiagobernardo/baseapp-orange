class Admin::ContentsController < ApplicationController
  require_role :admin
  layout 'admin'
end
