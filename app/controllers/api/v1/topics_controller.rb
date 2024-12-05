module Api
     module V1
       class TopicsController < ApplicationController
         before_action :set_topic, only: [:show, :update, :destroy]
   
         # GET /api/v1/topics
         def index
           @topics = Topic.all
           render json: @topics
         end
   
         # GET /api/v1/topics/:id
         def show
           render json: @topic
         end
   
         # POST /api/v1/topics
         def create
           @topic = Topic.new(topic_params)
   
           if @topic.save
             render json: @topic, status: :created
           else
             render json: { errors: @topic.errors.full_messages }, status: :unprocessable_entity
           end
         end
   
         # PATCH/PUT /api/v1/topics/:id
         def update
           if @topic.update(topic_params)
             render json: @topic
           else
             render json: { errors: @topic.errors.full_messages }, status: :unprocessable_entity
           end
         end
   
         # DELETE /api/v1/topics/:id
         def destroy
           @topic.destroy
           head :no_content
         end
   
         private
   
         # Устанавливаем текущую тему
         def set_topic
           @topic = Topic.find(params[:id])
         rescue ActiveRecord::RecordNotFound
           render json: { error: 'Topic not found' }, status: :not_found
         end
   
         # Разрешённые параметры
         def topic_params
           params.require(:topic).permit(:title, :body)
         end
       end
     end
   end
   