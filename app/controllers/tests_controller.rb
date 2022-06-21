class TestsController < ApplicationController
  
  before_action :find_test, only: %i[show]

  def index
    result = ["Class: #{params.class}", "Parameters:  #{params.inspect}"]
    render plain: result.join("\n")  
    logger.info(self.object_id)
  end
      
  def new
  end

  def create
    test = Test.create(test_params)
    render plain: test.inspect
  end

  def show
    render inline: '<%= @test.title %>' 
    logger.info(self.object_id)
  end
  
  def search
    result = ["Class: #{params.class}", "Parameters:  #{params.inspect}"]
    render plain: result.join("\n")  
  end

  private

  def test_params
    params.require(:test).permit(:title, :level)
  end

  def find_test
    @test = Test.find(params[:id])
  end

end
