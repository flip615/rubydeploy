class BrightIdeasController < ApplicationController
	before_action :user_logged
  def index
  	@all_ideas = BrightIdea.all
  	@ideas = BrightIdea.find_by_sql("select bright_ideas.id, count(*) as total_likes from bright_ideas left join likes on bright_ideas.id = likes.bright_idea_id group by bright_ideas.id order by count(*) desc")
  	
  end

  def create
  	idea = BrightIdea.new(content: params[:content], user_id: current_user.id)
  	if idea.valid?
  		idea.save
  		return redirect_to "/bright_ideas"
  	else
  		flash[:errors] = idea.errors.full_messages
  		return redirect_to :back
  	end
  end

  def show
  	@idea = BrightIdea.find(params[:id])

  end

  def delete
  	@idea = BrightIdea.find_by_id(params[:idea_id].to_i)
  	if @idea
	  	if @idea.user_id == current_user.id
	  		@idea.destroy
	  		return redirect_to :back
	  	else
	  		flash[:errors] = ["Cannot delete idea you did not post!"]
	  		return redirect_to '/'
	  	end
	else
		flash[:errors] =["That idea is not found"]
	end	
  	return redirect_to '/'
  end
  private
  	def user_logged
  	if !current_user
  		return redirect_to '/'
  	end
  end
end
