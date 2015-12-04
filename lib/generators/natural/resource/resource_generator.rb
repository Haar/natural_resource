require 'pundit'
require 'rails/generators'

class Natural::ResourceGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  argument :model_name, type: :string, default: ''

  def generate_dependencies
    @model_name = name if @model_name.blank?
    invoke 'pundit:policy', [@model_name.singularize]
    invoke 'controller', [name.pluralize]

    c_sentinel = '< ApplicationController'

    # Add resource reference to generated controller
    in_root do
      gsub_file "app/controllers/#{name.pluralize}_controller.rb", /(#{Regexp.escape(c_sentinel)})/mi do |match|
        "#{match}\n  resource :#{@model_name.pluralize.downcase}\n\n  def resource_params\n    params.require(:#{@model_name.singularize}).permit()\n  end\n"
      end
    end

    # Add note to generated Pundit policy
    in_root do
      gsub_file "app/policies/#{@model_name.singularize}_policy.rb", /(def resolve\n\s+scope\n\s+end)/mi do |match|
        '# See ApplicationPolicy.rb to see how a scope is defined and used'
      end
    end
  end
end
