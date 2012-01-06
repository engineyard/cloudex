Cloudex::Application.routes.draw do
  match 'vm/:name' => 'vm#show'
   match 'vm' => 'vm#index'

   root :to => 'vm#index'
end
