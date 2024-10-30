module Admin
     class UsersController < ApplicationController
       before_action :authenticate_user!
       before_action :ensure_admin!
   
       def index
         @users = User.all
       end
   
       def destroy
         @user = User.find(params[:id])
         @user.destroy
         redirect_to admin_users_path, notice: 'Пользователь успешно удалён.'
       end
   
       private
   
       def ensure_admin!
         redirect_to root_path, alert: 'У вас нет доступа к этой странице.' unless current_user.admin?
       end
     end
   end
   