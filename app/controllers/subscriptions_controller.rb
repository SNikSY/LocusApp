class SubscriptionsController < ApplicationController
     def create
       @subscription = Subscription.new(subscription_params)
       
       if @subscription.save
         SubscriptionMailer.launch_notification(@subscription).deliver_later
         flash[:notice] = "Вы успешно подписались на уведомления!"
         redirect_to root_path
       else
         flash[:alert] = "Ошибка при подписке. Проверьте правильность ввода."
         redirect_to root_path
       end
     end
   
     private
   
     def subscription_params
          params.permit(:email)
        end
   end
   