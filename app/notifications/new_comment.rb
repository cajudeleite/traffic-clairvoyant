class NewComment < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  deliver_by :action_cable
  #deliver_by :email, mailer: "UserMailer"
  #deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # def to_database
  #   {
  #     type: self.class.name,
  #     params: params,
  #     #account: current_user
  #   }
  # end

  # Add required params
  #

  # Define helper methods to make rendering easier.
  #

end

#NewComment.with(link: 'isso é um link').deliver_later(@current_user)
#NewComment.with(link: 'isso é um link').deliver(@current_user)
