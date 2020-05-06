class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?

    #seeds.rbで作成したユーザの編集や削除を禁止する
    def check_default
        email = resource&.email || params[:user][:email].downcase
        if email == 'admin@example.com' || 'professor@example.com' || 'student@example.com' || 'guest@example.com' || 'guest-browse@example.com'
            redirect_to root_path, alert: 'ゲストユーザーの変更・削除はできません。'
        end
    end

    protected

        def set_current_user
            @current_user = current_user
        end

        def configure_permitted_parameters
            added_attrs = [ :email, :username, :password, :password_confirmation ]
            devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
            devise_parameter_sanitizer.permit :account_update, keys: added_attrs
            devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
        end
        
end
