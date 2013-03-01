class AdminAbility
include CanCan::Ability
 
 def initialize(admin_user)
  admin_user ||= AdminUser.new
   if admin_user.role=='admin'
    can :manage, :all
   end

   if admin_user.role=='blogger'
    can :manage,  :recipes
   end
 end

end


