class Admin::BaseController < ApplicationController
    layout 'admin'
    before_action :authenticate_user!
    before_action :ensure_admin
  end