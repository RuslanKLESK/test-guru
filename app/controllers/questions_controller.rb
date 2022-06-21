class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index search create]
  before_action :find_question, only: %i[show destroy]

  def index
    render inline: '<%= @test.questions.inspect %>' 
  end

  def new
  end

  def create
    @question = @test.questions.new(question_params)
      if @question.save
        render plain: @question.inspect
      else
        render html: '<h1>Save error</h1>'.html_safe
      end
    
  end

  def show
    render inline: '<%= @question.inspect %>'
  end

  def destroy
    @question.destroy
    render html: '<h1>Question deleted</h1>'.html_safe
  end

  def search
    render inline: '<%= @test.title %>'
  end

  # Исключение для случая, когда вопрос не найден
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found!'
  end

end
