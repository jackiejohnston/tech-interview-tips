class FavoritesController < ApplicationController

  # This action is untested and flog rates its complexity at 22.1. I've outlined
  # a possible spec for you in the favorites_controller_spec
  def create
    favorite = Favorite.new
    question = Question.find(params[:question_id])
    if question.favorites.where(user_id: current_user.id).count == 0
      favorite.user_id = current_user.id
      question.favorites << favorite
      favorite.save
    end
    redirect_to question_path(question)
  end
end