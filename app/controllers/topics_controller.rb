class TopicsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @topics = Topic.order(created_at: :desc)
  end

  def show
    @topic = Topic.find(params[:id])
    @comments = @topic.comments
  end

  def new
  end

  def create
    @topic = current_user.topics.build(topic_params)
    if @topic.save
      redirect_to @topic, notice: 'Тема успешно создана.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      redirect_to @topic, notice: 'Тема успешно обновлена.'
    else
      render :edit
    end
  end
  def like
    @topic = Topic.find(params[:id])
    @topic.increment!(:likes_count) # Увеличивает значение likes_count на 1
    redirect_to @topic, notice: 'Вы поставили лайк!'
  end
  
  def destroy
    @topic = Topic.find(params[:id])
    authorize! :destroy, @topic
    @topic.destroy
    redirect_to topics_path, notice: 'Тема успешно удалена.'
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :description, :category_id, :location_id, images: [])
  end
end