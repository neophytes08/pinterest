class CommentsController < ApplicationController
  
  def index
    puts @comment
  end

  def create

    puts @comment
    @comment = Comment.create(comment_params)

    if @comment.save
      redirect_to pin_path(@comment.pin_id)
      session[:return_to] ||= request.referer
    else
      redirect_to pin_path
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to session.delete(:return_to)
  end

  private
    def comment_params
      params.require(:comment).permit(:pin_id, :comment_text, :pin_id)
    end

end
