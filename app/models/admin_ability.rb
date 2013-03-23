# All back end users (i.e. Active Admin users) are authorized using this class
class AdminAbility
include CanCan::Ability
 
def initialize(admin_user)
admin_user ||= AdminUser.new
 
# We operate with three role levels:
# - Editor
# - Moderator
# - Manager
 
# An editor can do the following:


 
# A moderator can do the following:
if admin_user.role == 'admin'
can :manage, :all	
end
 
# A manager can do the following:
if admin_user.role == 'blogger'
can :manage , Recipe

 
end
end
end
