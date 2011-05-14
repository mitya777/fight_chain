class QuestsController < ApplicationController
  
  def new
    @quest = current_user.quests.new
    @quest.inspiration = Inspiration.new
    @quest.question = Question.new
    @quest.answer = Answer.new
    @title = "Begin Quest"
  end

  def index
    @title = "All Quests"
    @quests = Quest.paginate :page => params[:page]
  end

  def create
    @quest = current_user.quests.build(params[:quest])
    @quest.save!
  end
    
end
