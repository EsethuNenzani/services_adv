Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :galleries do
    resources :galleries, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :galleries, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :galleries, :except => :show do
        collection do
          post :update_positions
        end
        get "remove_item/:item_id" => "galleries#remove_item", as: :remove_item
        get "show_add_image_panel" => "galleries#show_add_image_panel", as: :show_add_image_panel
        post "add_items" => "galleries#add_items", as: :add_items
      end

      get ':gallery_id/get_presigned_url' => 'items#get_presigned_url'
      post ':gallery_id/add_item_to_gallery' => 'items#add_item_to_gallery'

    end
  end

end
