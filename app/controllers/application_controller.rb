class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper

    before_action :check_logged_in

    def check_logged_in
      return if current_user
  
      redirect_to root_path
    end
  end
