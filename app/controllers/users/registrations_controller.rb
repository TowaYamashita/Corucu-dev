# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
    before_action :check_default, only: %i[update destroy]
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]

    # GET /resource/sign_up
    def new
        super
    end

    # POST /resource
    def create
        set_status_id
        super
    end

    # GET /resource/edit
    def edit
        super
    end

    # PUT /resource
    def update
        super
    end

    # DELETE /resource
    def destroy
        super
    end

    # GET /resource/cancel
    # Forces the session data which is usually expired after sign
    # in to be expired now. This is useful if the user wants to
    # cancel oauth signing in/up in the middle of the process,
    # removing all OAuth session data.
    def cancel
        super
    end

    protected

        # If you have extra params to permit, append them to the sanitizer.
        def configure_sign_up_params
            devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute, :status_id])
        end

        # If you have extra params to permit, append them to the sanitizer.
        def configure_account_update_params
            devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
        end

        # The path used after sign up.
        def after_sign_up_path_for(resource)
            super(resource)
        end

        # The path used after sign up for inactive accounts.
        def after_inactive_sign_up_path_for(resource)
            super(resource)
        end

        def set_status_id
            email = params.require(:user)[:email]
            if email.include?("@sasebo.ac.jp")
                params.require(:user)[:status_id] = 1
            elsif email.include?("@st.sasebo.ac.jp")
                params.require(:user)[:status_id] = 2
            else
                params.require(:user)[:status_id] = 3
            end
        end

end
