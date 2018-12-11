class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @lamas = policy_scope(Lama).order(created_at: :desc)
  end
end
