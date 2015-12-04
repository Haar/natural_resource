class PagesController < ApplicationController
  resource :pages

  def resource_params
    params.require(:page).permit(:title)
  end
end
