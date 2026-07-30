module Permissible
  extend ActiveSupport::Concern

  class_methods do
    def permission(action, desc:, key: nil, auto_assign: [])
      permission_key = key || "#{controller_path.tr('/', '.')}.#{action}"

      PermissionRegistry.register(key: permission_key, description: desc, auto_assign: auto_assign)

      before_action(only: action) do
        unless current_user&.can?(permission_key)
          redirect_to root_path, alert: "You don't have permission to do that."
        end
      end
    end
  end
end