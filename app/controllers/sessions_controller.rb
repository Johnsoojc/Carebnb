class SessionsController < Clearance::SessionsController

  def create_from_omniauth
    auth_hash = request.env["omniauth.auth"]
    #this line above returns you a a variable, this variable name is auth_hash, and this hash is just returned information from your facebook account, y is this possible? thats because you gave your app your cfacebook app key and secrety key, so this app is authorised to capture authrosied information hash

    # if i used facebook to log in before, my table authentication would have saved this provuder and auth_hash id, so this line below will check if i have ever signed in with facebook before

    authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) || Authentication.create_with_omniauth(auth_hash)
    #if i signed in with facebook before, so authentication.user  is not nil
    if authentication.user
      #look for that user, then go to the next path which is user_path
      user = authentication.user
      authentication.update_token(auth_hash)
      @next = user_path(user)
      @notice = "You're signed in again with fb"
    else #first time logging with facebook , i create this user object with authorised hash frmo facebook and authentication object
      user = User.create_with_auth_and_hash(authentication,auth_hash)
      @next =  user_path(user)
      @notice = "Signed in first time with facebook"
    end
    sign_in(user) #sign_in is a method defined by clearance gem(library())
    redirect_to @next, :notice => @notice
  end

end
