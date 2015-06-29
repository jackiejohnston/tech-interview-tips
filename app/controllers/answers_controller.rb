class AnswersController < ApplicationController
  before_action :check_current_user, only: [:new, :create, :edit, :update, :destroy ]
  before_action :check_answer_owner, only: [:edit, :update, :destroy]

  def show
    @answer = Answer.find params[:id]
  end

  def new
    @answer = Answer.new
  end

  def create
    user = User.find(current_user.id)
    question = Question.find(params[:answer][:question_id])
    answer = Answer.new(answer_params)
    user.answers << answer
    question.answers << answer
    if answer.save
      redirect_to question_path(question)
    else
      redirect_to question_path(question), flash: { notice: "Answer can't be blank."}
    end
  end

  def update
    @answer = Answer.find params[:id]
    @question = @answer.question
      if @answer.update_attributes answer_params
        redirect_to question_path(@question)
      else
        render :edit
      end
  end

  def destroy
    answer = Answer.find params[:id]
    question = Question.find(answer.question_id)
    answer.destroy
    redirect_to question_path(question)
  end

  private
  def answer_params
    params.require(:answer).permit(:content)
  end

  def check_current_user
    unless current_user
      redirect_to root_url, flash: { alert: "Please sign in first" }
    end
  end

  def check_answer_owner
    unless current_user.id == @answer.user.id
      redirect_to root_url, flash: { alert: "This is not your answer" }
    end
  end
end