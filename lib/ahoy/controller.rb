module Ahoy
  module Controller

    def self.included(base)
      base.helper_method :current_visit
      base.before_filter do
        RequestStore.store[:ahoy_controller] ||= self
      end
    end

    protected

    def current_visit
      if cookies[:ahoy_visit]
        @current_visit ||= Ahoy.visit_model.where(visit_token: cookies[:ahoy_visit]).first
      end
    end

  end
end
