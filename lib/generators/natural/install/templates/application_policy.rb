class ApplicationPolicy < NaturalResource::Policy
  class Scope < Scope
    # It is recommended to use per-role scopes for Users # simply extend the
    # resolve method with conditions for each "role" and the name of the scope
    # they should call.
    def resolve
      if !user.is_a? User
        anon_user_scope
      else
        standard_user_scope
      end
    end

    def standard_user_scope
      scope
      # scope.where(user: user) # e.g. only show resources that belong to that user
    end

    def anon_user_scope
      scope
      # scope.public # e.g. only display public data
    end
  end
end
