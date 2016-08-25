class HobbiesController < ApplicationController

  def index
    @hobbies = Hobby.all
  end
  
end
