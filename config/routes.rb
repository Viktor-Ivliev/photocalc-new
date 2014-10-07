Rails.application.routes.draw do
  get 'photobook/30x30'

  get 'photobook/20x30'

  get 'photobook/30x20'

  get 'photobook/20x20'

  get 'printbook/24x32'

  get 'printbook/30x30'

  get 'printbook/20x30'

  get 'printbook/30x20'

  get 'printbook/20x20'

  get 'printbook/15x20'

  get 'printbook/20x15'

  get 'printbook/19x19'

  get 'slimbook/30x30'

  get 'slimbook/20x30'

  get 'slimbook/18x24'

  get 'slimbook/23x23'

  get 'slimbook/29x19'

  get 'slimbook/19x19'

  get 'landing_page/index'

  get 'landing_page/photobook'

  get 'landing_page/printbook'

  get 'landing_page/slimbook'


  resources :result

  post 'result/calc' => 'result#calc', as: :result_calc
  post 'result/res' => 'result#res', as: :result_res
  resources :prices

  resources :order_dates

  devise_for :admins
  root 'landing_page#index'
end
