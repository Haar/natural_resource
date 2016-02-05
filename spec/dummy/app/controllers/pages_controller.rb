class PagesController < ApplicationController
  resource :pages

  def resource_params
    params.require(:page).permit(:title)
  end

  def current_context
    :public
  end
end
