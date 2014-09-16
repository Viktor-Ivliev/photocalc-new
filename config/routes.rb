Rails.application.routes.draw do
  get 'landing_page/index'

  get 'landing_page/photobook'

  get 'landing_page/printbook'

  get 'landing_page/slimbook'

  get 'landing_page/planshet'

  resources :order_date

  resources :result

  post 'result/calc' => 'result#calc', as: :result_calc
  post 'result/res' => 'result#res', as: :result_res
  resources :prices

  devise_for :admins
  root 'landing_page#index'
end
