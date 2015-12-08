require 'active_support/concern'
require 'action_controller'
require 'pundit'
require 'ransack'
require 'will_paginate'

module NaturalResource
  module Controller
    extend ActiveSupport::Concern
    include Pundit

    class_methods do
      def resource(resource_name)
        after_action :verify_authorized, except: :index
        after_action :verify_policy_scoped

        helper_method :current_context, :query, :resource_class, :resource, :resources

        rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_create_or_update

        # GET /:controller_name/new
        define_method :new do; end

        # GET /:controller_name/edit
        define_method :edit do; end

        # GET /:controller_name
        define_method :index do; end

        # POST /:controller_name
        define_method :create do
          resource.update! resource_params
          redirect_to success_path, {notice: "#{resource} was created."}
        end

        # PUT /:controller_name/:id
        define_method :update do
          resource.tap { |r| r.update! resource_params }.touch
          redirect_to success_path, {notice: "#{resource} was updated."}
        end

        # DELETE /:controller_name/:id
        define_method :destroy do
          resource.destroy
          redirect_to success_path, {notice: "#{resource} was deleted."}
        end

        private

        define_method :current_context do; end

        # Resource allocation methods
        define_method :query do
          @query ||= policy_scope(resource_scope).ransack(params[:q])
        end

        define_method :resource_class do
          resource_name.to_s.singularize.camelcase.constantize
        end

        define_method :resource do
          @resource ||= if ['new', 'create'].include?(action_name)
                          policy_scope(resource_scope).new
                        else
                          policy_scope(resource_scope).find(params[:id])
                        end.tap(&method(:authorize))
        end

        define_method :resources do
          @resources ||= query.result.paginate(page: params[:page])
        end

        define_method :resource_scope do
          resource_class.all
        end

        define_method :success_path do
          url_for(action: :index)
        end
      end
    end

    def handle_invalid_create_or_update
      case action_name
      when 'create' then render :new
      when 'update' then render :edit
      else raise NotImplementedError
      end
    end
  end
end

ActionController::Base.send :include, NaturalResource::Controller
