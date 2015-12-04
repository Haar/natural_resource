class PagePolicy < ApplicationPolicy

  def create?
    user.present?
  end
  alias_method :new?, :create?

  def update?
    user.present?
  end
  alias_method :edit?, :update?

  class Scope < Scope
    # See ApplicationPolicy.rb to see how a scope is defined and used
    def standard_user_scope
      scope.user
    end

    def anon_user_scope
      scope.none
    end
  end
end
