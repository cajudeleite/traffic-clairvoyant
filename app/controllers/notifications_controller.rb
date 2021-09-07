class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.notifications
  end

  def show
    @notification = Notification.find(params[:id])
  end

  def destroy
    @notification = Notification.find(params[:id])
  end
end
