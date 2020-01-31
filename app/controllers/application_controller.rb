class ApplicationController < ActionController::Base

    # ==========ここから編集する==========
    protect_from_forgery with: :exception

    # 以下のコードにより、全てのページでログインしていないユーザーはdeviseのログイン画面に飛ばされる
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    # nameカラムをdeviseに追加
    protected
        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
            devise_parameter_sanitizer.permit(:account_update, keys: [:name])
        end
    # ==========ここまで編集する==========
end
