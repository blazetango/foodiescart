class DashboardsController < ApplicationController

 def index   

if user_signed_in? 
@user = current_user.id
@wallet = Wallet.find_all_by_user_id(@user)
end
 
 end

end
