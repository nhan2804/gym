class ApplicationController < ActionController::Base
    before_action :set_somethings

  def set_somethings
    @cates = Category::all()

    # You can also have service classes and call them here
 
  end
end
