class ContentsController < ApplicationController
  def create
    #logger.debug(params.inspect)
    @inspiration = current_user.inspirations.build(params[:content])
    @inspiration.save!
  end

  def destroy
  end

end
