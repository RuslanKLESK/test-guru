class TestsController < ApplicationController
  
  before_action :find_test, only: %i[show]

  def index
    result = ["Class: #{params.class}", "Parameters:  #{params.inspect}"]
     render plain: result.join("\n")  
    # respond_to do |format|
    #    format.html { render html: '<h1>All tests</h1>'.html_safe }
    #    format.json { render json: { tests: Test.all } }
    #  end
    # render html: '<h1>All tests</h1>'.html_safe
    logger.info(self.object_id) # rails log clear
  end
      
  def new
  end

  def create
    test = Test.create!(test_params)
    render plain: test.inspect
  end

  def show
    render inline: '<%= @test.title %>' # render html: 'Show test'.html_safe
    logger.info(self.object_id)
  end
 
  def update
    render html: 'update test'.html_safe
    logger.info(self.object_id)
  end
  
  def delete
    render html: 'delete test'.html_safe
    logger.info(self.object_id)
  end
  
  def search
    result = ["Class: #{params.class}", "Parameters:  #{params.inspect}"]
    render plain: result.join("\n")  
  end

  private # ================================================================================================

  def test_params
    params.require(:test).permit(:title, :level)
  end

  def find_test
    @test = Test.find(params[:id])
  end

end
