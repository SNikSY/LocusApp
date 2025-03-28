class Api::V1::TopicsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /api/v1/topics
  def index
    topics = Topic.all
    render json: topics
  end

  # GET /api/v1/topics/:id
  def show
    topic = Topic.find(params[:id])
    render json: topic
  end

  # POST /api/v1/topics
  def create
    topic = Topic.new(topic_params)
    if topic.save
      render json: topic, status: :created
    else
      render json: { errors: topic.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PUT/PATCH /api/v1/topics/:id
  def update
    topic = Topic.find(params[:id])
    if topic.update(topic_params)
      render json: topic
    else
      render json: { errors: topic.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/topics/:id
  def destroy
    topic = Topic.find(params[:id])
    topic.destroy
    head :no_content
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :description, :creator_user_id, :category_id, :location_id)
  end
end
