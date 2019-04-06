require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SaleFactory
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Permite que seja criada arquivos durante os generates
    config.generators do |g|
      g.test_framework :rspec,
                       fixtures: true,
                       view_specs: true,
                       helper_specs: true,
                       routing_specs: false,
                       controller_specs: false,
                       request_specs: false
      g.factory_bot dir: "spec/factories"
    end

    config.i18n.default_locale = "pt-BR"
    config.autoload_paths << "#{Rails.root}/lib"
  end
end
