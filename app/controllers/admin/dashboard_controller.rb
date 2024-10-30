module Admin
     class DashboardController < ApplicationController
       before_action :authenticate_user!
       before_action :ensure_admin!
   
       def index
       end
   
       private
   
       def ensure_admin!
         redirect_to root_path, alert: 'У вас нет доступа к этой странице.' unless current_user.admin?
       end
     end
   end
   