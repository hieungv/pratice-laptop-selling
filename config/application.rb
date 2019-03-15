require_relative "boot"

require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "rails"
require "sprockets/railtie"
Bundler.require(*Rails.groups)

module PraticeLaptopSelling
  class Application < Rails::Application
    config.generators.system_tests = nil
    config.action_view.embed_authenticity_token_in_remote_forms = true
  end
end
