class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.pluck(:description)
  end

  def show
    render plain: @question.description
  end

  def new
  end

  def destroy  #Многое перепробовал, но этот метод не работает, вместо delete вызывается get запрос
    @question.destroy!
    render plain: "#{@question.id} вопрос удален"
  end

  def create
    @question = @test.questions.create!(question_params)
    render plain: "Вопрос создан"
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
