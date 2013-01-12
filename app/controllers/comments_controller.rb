class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    comment = params[:comment]
    rating = params[:rating]
    type = comment[:c_type]
    commentable = type.constantize.find(rating.keys.first.to_i)
    new_comment = Comment.build_from(commentable, current_user.id, comment[:body])
    new_comment.title = comment[:title]
    new_comment.rating = rating.values.first.to_i
    new_comment.save unless new_comment.spam?
    redirect_to commentable
  end
end
