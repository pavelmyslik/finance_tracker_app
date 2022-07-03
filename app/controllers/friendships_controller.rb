class FriendshipsController < ApplicationController
  def destroy
    current_user.friendships.where(friend_id: params[:id]).first.destroy
    flash[:notice] = "#{User.find(params[:id]).full_name} was deleted from your friendlist"
    redirect_to my_friends_path
  end

  def create
    friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: friend.id)
    if current_user.save
      flash[:notice] = "Following user"
    else
      flash[:alert] = "Something wrong with following request"
    end
    redirect_to my_friends_path
  end
end