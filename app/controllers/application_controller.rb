class ApplicationController < ActionController::Base
  class MyLogger < Logger
    include LoggerSilence
    include ActiveSupport::LoggerThreadSafeLevel
  end

  before_action :mylogger_test
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :employee_id])

    devise_parameter_sanitizer.permit(:sign_in, keys: [:nickname])
  end

  # # ログイン後にマイページに遷移する(今はしない)
  # def after_sign_in_path_for(resource)
  #   user_path(current_user) # 指定ページのパスを記述
  # end 

  private

  def mylogger_test
    mylogger = MyLogger.new(STDOUT)
    mylogger.silence do
      mylogger.debug("controller = #{controller_name}")
      mylogger.info("action = #{action_name}")
      mylogger.error("controler#action = #{controller_name}##{action_name}")
    end
  end
end
