Cap::Table::Engine.routes.draw do
  resources :investors do
    member do
      put :negotiate
      put :invest
      put :re_invest
    end
  end
end
