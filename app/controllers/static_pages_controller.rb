class StaticPagesController < ApplicationController
  skip_before_action :check_logged_in, only: :top
  def top
  end
end
