module NaturalResource
  class Railtie < Rails::Railtie
    config.app_generators do |g|
      g.templates.unshit File::expand_path('../../templates', __FILE__)
    end
  end
end
