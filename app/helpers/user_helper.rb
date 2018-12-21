module UserHelper

  def image
    if @user.avatar.url != "/avatars/original/missing.png"
      image_tag @user.avatar.url(:medium)
    else
      "NO IMAGE AVAILABLE"
    end
  end

  def profile_head
    if current_user == @user
      "Welcome, #{@user.first_name}!"
    else
      "Welcome to #{@user.first_name}'s profile!"
    end
  end

end
