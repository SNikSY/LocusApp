module Admin
     class CommentsController < ApplicationController
       before_action :authenticate_user!
       before_action :ensure_admin!
   
       def index
         @comments = Comment.all
       end
   
       def destroy
         @comment = Comment.find(params[:id])
         @comment.destroy
         redirect_to admin_comments_path, notice: 'Комментарий успешно удалён.'
       end
   
       private
   
       def ensure_admin!
         redirect_to root_path, alert: 'У вас нет доступа к этой странице.' unless current_user.admin?
       end
     end
   end
   