class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    # user = User.from_omniauth env["omniauth.auth"]
    # session["user_id"] = user
    # raise env["omniauth.auth"].inspect
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      sign_in_and_redirect user, notice: "Signed in!"
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end
  def failure
    redirect_to root_path
  end
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  def password_required?
    super && provider.blank?
  end
  alias_method :twitter, :all
end