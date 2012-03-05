module UsersHelper
  
  def user_list(users)
    users.map do |user|
      link_to user.name, user
    end.join(", ").html_safe
  end
  
end
