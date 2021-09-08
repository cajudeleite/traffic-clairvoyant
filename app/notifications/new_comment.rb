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
  def message
    "You have a notification"
  end

  def url
    notification_path(params[:id])
  end
end

#NewComment.with(post: @post).deliver_later(@current_user)
#NewComment.with(post: @post).deliver(@current_user)
