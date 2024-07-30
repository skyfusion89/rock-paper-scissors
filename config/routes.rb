Rails.application.routes.draw do
  root 'rps_game#index'
  get 'result/:id', to: 'rps_game#result', as: 'result_rps'
end
