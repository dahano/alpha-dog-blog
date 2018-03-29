# Welcome controller
class WelcomeController < ApplicationController
  def pets
    redirect_to articles_path if logged_in?
  end
end
