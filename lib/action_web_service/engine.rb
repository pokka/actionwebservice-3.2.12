require "rails/engine"

module ActionWebService
  class Engine < ::Rails::Engine
    initializer "ActionWebService" do |app|
      ActionWebService::Base.class_eval do
        include app.routes.url_helpers
        include ActionWebService::Container::Direct
        include ActionWebService::Invocation
      end
  
      class ActionWebService::WebServiceController < ActionController::Base
        include ActionWebService::Protocol::Discovery
        include ActionWebService::Protocol::Soap
        include ActionWebService::Protocol::XmlRpc
        include ActionWebService::Container::Direct
        include ActionWebService::Container::Delegated
        include ActionWebService::Container::ActionController
        include ActionWebService::Invocation
        include ActionWebService::Dispatcher
        include ActionWebService::Dispatcher::ActionControllerX
        include ActionWebService::Scaffolding
      end

    end

  end
end