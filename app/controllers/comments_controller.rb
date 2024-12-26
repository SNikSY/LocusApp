class CommentsController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to topic_path(@topic), notice: 'Комментарий успешно добавлен.'
    else
      redirect_to topic_path(@topic), alert: 'Ошибка при добавлении комментария.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end