class QuestionsController < ApplicationController

  before_action :find_test, only: :show

def index
  # redirect_to:  'https://ya.ru'
  render html: '<h1>View All Questions</h1>'.html_safe
end

def new
end

def create
end

def show
    render inline: '<%= @test.title %>'     # '<h1>Show one Question by id:</h1>'.html_safe
end

def destroy
    render html: '<h1>Destroy one Question by id:</h1>'.html_safe
end

# Напишите обработку исключения для случая когда вопрос не был найден
rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

private

# Используйте обратный вызов при поиске теста в контроллере ресурса вопросов
def find_test
  @test = Test.find(params[:id])
end

def rescue_with_question_not_found
  render plain: 'Question was not found!'
end

end
