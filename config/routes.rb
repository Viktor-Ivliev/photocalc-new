Rails.application.routes.draw do


  get 'landing_page/index'

  get 'landing_page/photobook'

  get 'landing_page/printbook'

  get 'landing_page/slimbook'

  get 'landing_page/delivery'
  


  resources :result

  get 'result/select_an_item_1/:type_photo' => 'result#select_an_item_1'
  get 'result/select_an_item_2/:type_photo/:form' => 'result#select_an_item_2'
  get 'result/select_an_item_price/:type_photo/:form/:type_paper' => 'result#select_an_item_price'
  post 'result/calc' => 'result#calc', as: :result_calc
  post 'result/res' => 'result#res', as: :result_res
  
  
  resources :prices

  resources :order_dates

  devise_for :admins
  root 'landing_page#index'
end
