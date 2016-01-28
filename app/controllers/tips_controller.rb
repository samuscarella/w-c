class TipsController < ApplicationController
  before_filter :require_login
  respond_to :html, :js

end
