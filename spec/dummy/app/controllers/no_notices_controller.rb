class NoNoticesController < ApplicationController

  resource :page, display_notices: false

  def resource_params
    params.require(:page).permit(:title)
  end
end
