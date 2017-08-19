class LikesController < ApplicationController
  def create
  	@did_like = Like.find_by_sql("select * from likes where bright_idea_id = #{params[:idea_id].to_i} and user_id = #{current_user.id.to_i}")
  	
  	if @did_like.length > 0
  		flash[:errors] = ["This post has already been liked"]
  		return redirect_to '/'
  	else
  		liked = Like.create(user_id: current_user.id, bright_idea_id: params[:idea_id])
  		return redirect_to '/'
  	end	
  	
  	return redirect_to '/'
  end

  def delete
  	@did_like = Like.find_by_sql("select * from likes where bright_idea_id = #{params[:idea_id].to_i} and user_id = #{current_user.id.to_i}")
  	
  	if @did_like.length == 0
  		flash[:errors] = ["This post has already been unliked"]
  		return redirect_to '/'
  	else
  		@did_like.first.destroy
  		return redirect_to '/'
  	end	
  	
  	return redirect_to '/'
  end
end
