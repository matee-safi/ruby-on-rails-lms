class Users::ProfilePicturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def destroy
    @user.profile_picture.purge_later
    redirect_to edit_user_path(@user)
  end

  private

  def set_user
    @user = current_user
  end
end
