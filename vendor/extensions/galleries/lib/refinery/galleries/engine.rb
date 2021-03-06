module Refinery
  module Galleries
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Galleries

      engine_name :refinery_galleries

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "galleries"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.galleries_admin_galleries_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Galleries)
      end
    end
  end
end
