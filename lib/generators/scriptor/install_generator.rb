module Scriptor
  class InstallGenerator < Rails::Generators::Base
    desc "Install Scriptor"

    # Mounts the engine in the host application's config/routes.rb
    def mount_engine
      route("mount Scriptor::Engine, at: \"/scriptor\"")
    end

    # Copies engine migrations to host application and migrates the database
    def install_migrations
      rake("scriptor:install:migrations")
      rake("db:migrate")
    end
  end
end
