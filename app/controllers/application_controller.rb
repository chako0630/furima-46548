class ApplicationController < ActionController::Base
  before_action :basic_auth # Basic認証
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  # Basic認証
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  # deviseのユーザー登録時に、他の各カラムを保存できるようにする
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday])
  end
end
