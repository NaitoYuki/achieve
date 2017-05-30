class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    @blog = @comment.blog
    @notification = @comment.notifications.build(user_id: @blog.user.id)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to blog_path(@blog), notice: 'コメントを投稿しました。' }
        format.js { render :index }
        unless @comment.blog.user_id == current_user.id
           @comment.notify_new_comment
        end
        @comment.notify_num_unread_comments
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to blog_path(@blog), notice: 'コメントを削除しました。' }
      format.js { render :index }
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:blog_id, :content)
    end

    def set_comment
      @comment = Comment.find(params[:id])
      @blog = Blog.find(params[:blog_id])
    end
end
