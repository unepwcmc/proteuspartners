Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :tools do
    resources :tools, :path => '', :only => [:show]
  end

  # Admin routes
  namespace :tools, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :tools, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
