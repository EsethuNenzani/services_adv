class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :determine_layout

  def determine_layout
    if home_page?
      "home"
    elsif controller_name == 'products'
      "products"
    else
      "application"
    end
  end
end
