Rails.application.routes.draw do
  devise_for :users
  mount Cap::Table::Engine => "/cap-table"
end
