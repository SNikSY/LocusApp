module Admin
     class TopicsController < ApplicationController
       before_action :authenticate_user!
       before_action :ensure_admin!
   
       def index
         @topics = Topic.all
       end
   
       def destroy
         @topic = Topic.find(params[:id])
         @topic.destroy
         redirect_to admin_topics_path, notice: 'Тема успешно удалена.'
       end
   
       private
   
       def ensure_admin!
         redirect_to root_path, alert: 'У вас нет доступа к этой странице.' unless current_user.admin?
       end
     end
   end
   