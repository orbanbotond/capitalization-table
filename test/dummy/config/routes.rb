Rails.application.routes.draw do
  mount Cap::Table::Engine => "/cap-table"
end
