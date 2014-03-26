module SelfserviceHelper
  def user?
    User.table_exists? && User
  end
  
  def user
    if user?
      if  u = User.find_by_netid(session[:cas_user])
        u.user_name
      else
        session[:cas_user]
      end
    end
  end
end
