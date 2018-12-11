class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin
        scope.order(created_at: :desc)
      else
        scope.where(user_id: user.id).order(created_at: :desc)
      end
    end
  end

  def index?
    true
  end

  def new?
    create?
  end

  def create?
    true
  end

end
