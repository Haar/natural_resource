require 'rails/generators'

class Natural::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def copy_application_policy
    template 'application_policy.rb', 'app/policies/application_policy.rb'
  end
end
