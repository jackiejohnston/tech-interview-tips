class KudosController < ApplicationController

  # I was incorrect in describing the QuestionsController#index the most
  # complicated method in your codebase. This create method is the most
  # complicated code committed to your codebase. I have outlined a test for you
  # in the kudos_controller_spec.
  def create
    @kudo = Kudo.new
    @question = Question.find(params[:question_id])
    if params[:answer_id]
      @answer = Answer.find(params[:answer_id])
      if @answer.kudos.where(user_id: current_user.id).count == 0
        @kudo.user_id = current_user.id
        @answer.kudos << @kudo
        @kudo.save
      end
    else
      @question = Question.find(params[:question_id])
      if @question.kudos.where(user_id: current_user.id).count == 0
        @kudo.user_id = current_user.id
        @question.kudos << @kudo
        @kudo.save
      end
    end
    redirect_to question_path(@question)
  end

end