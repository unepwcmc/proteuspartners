module Refinery
  module Tools
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Tools

      engine_name :refinery_tools

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "tools"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.tools_admin_tools_path }
          plugin.pathname = root
          # plugin.activity = {
          #   :class_name => :'refinery/tools/tool'
          # }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Tools)
      end
    end
  end
end
