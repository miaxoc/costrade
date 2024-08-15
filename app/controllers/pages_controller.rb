class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home]

  def home
    @costumes = Costume.limit(9)
  end
end
