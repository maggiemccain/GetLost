module Api
  class HobbiesController < ApplicationController

    def list_hobbies
      hobby_list = Hobby.all
      flag = "1"
      render json: hobby_list
    end

  end
end
