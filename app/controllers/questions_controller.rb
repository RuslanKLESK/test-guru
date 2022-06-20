class QuestionsController < ApplicationController

  before_action :find_test, only: %i[search, create]
  before_action :find_question_body, only: %i[show]

def index
  render inline: '<%= Question.last %>'   # html:   #'<h1>View All Questions</h1>'.html_safe
end

def new
end

def create
  @question = @test.questions.create(question_params)  # @question = Question.create!(test_id: params[:test_id], body: question_params)
  render plain: @question.inspect
end

def show
  render inline: '<%= @question.body %>'     # '<h1>Show one Question by id:</h1>'.html_safe
end

def update
  # question = Questionr.find_by(:id)
  # question.update(:body)
end

def destroy
  question = Question.find_by(params[:id])
  question.destroy
  render html: '<h1>Destroy one Question by id:</h1>'.html_safe
end

def search
  render inline: '<%= @test.title %>'
end

# Напишите обработку исключения для случая когда вопрос не был найден
rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

private # ================================================================================================

# Используйте обратный вызов при поиске теста в контроллере ресурса вопросов
def find_test
  @test = Test.find(params[:test_id])
end

def question_params
  params.require(:question).permit(:body)
end

def find_question_body
  @question = Question.find(params[:id])
end

def rescue_with_question_not_found
  render plain: 'Question was not found!'
end

end
