require 'set'
require 'natural_resource/policy_preconditions'

# Starting block for ApplicationPolicy, set up for easy overriding
module NaturalResource
  class Policy
    include NaturalResource::PolicyPreconditions
    attr_reader :user, :record

    def initialize(user, record)
      @user = user
      @record = record
      @errors = Hash.new { |h,k| h[k]= Set.new([]) }
      @failure_status = nil
    end

    def failure_status
      @failure_status.presence || :unauthorized
    end

    def errors
      if @errors.keys.empty?
        {user: ['does not have permission to perform this action']}
      else
        @errors
      end
    end

    def index?
      false
    end

    def show?
      scope.where(id: record.id).exists?
    end

    def create?
      false
    end

    def new?
      create?
    end

    def update?
      false
    end

    def edit?
      update?
    end

    def destroy?
      false
    end

    def own_record?
      user && record.user == user
    end

    def anon?
      user.nil?
    end

    def scope
      Pundit.policy_scope!(user, record.class)
    end

    # Base Scope class to infer/scope what a user should see
    class Scope
      attr_reader :user, :scope

      def initialize(user, scope)
        @user = user
        @scope = scope
      end

      def resolve
        if !user.is_a?(User)
          anon_user_scope
        else
          standard_user_scope
        end
      end

      def standard_user_scope
        raise NotImplementedError, [self.class.name, __method__].join('#')
      end

      def anon_user_scope
        raise NotImplementedError, [self.class.name, __method__].join('#')
      end
    end
  end
end
