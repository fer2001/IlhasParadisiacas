class PagesController < ApplicationController
  def home
    redirect_to islands_path
  end
end
