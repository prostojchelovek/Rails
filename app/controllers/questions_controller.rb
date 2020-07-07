class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[new create]
  before_action :find_question, only: %i[edit update show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show
  end

  def new
    @question = @test.questions.new
  end

  def edit
  end

  def destroy
    @question.destroy!
    redirect_to @question.test
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to @question.test
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question.test
    else
      render :edit
    end
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:description)
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end
end
