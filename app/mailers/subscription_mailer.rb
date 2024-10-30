class SubscriptionMailer < ApplicationMailer
     default from: 'no-reply@yourdomain.com'
   
     def launch_notification(subscription)
       @subscription = subscription
       mail(to: @subscription.email, subject: 'Наш проект скоро запустится!')
     end
   end
   