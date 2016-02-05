require 'rails/generators'

class Natural::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def copy_application_policy
    template 'application_policy.rb', 'app/policies/application_policy.rb'
    helper_path = Rails.root.join('spec', 'rails_helper.rb')
    if File.exists?(helper_path)
      template('pundit.rb', 'spec/support/pundit.rb')
      helper_content = File.read(helper_path)
      support_file_loader = "Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }"
      unless helper_content.include?(support_file_loader)
        helper_content.gsub!("require 'rspec/rails'",
                             "require 'rspec/rails'\n#{support_file_loader}")
        File.open(helper_path, 'w') { |f| f.puts helper_content }
      end
    end
  end
end
