Iso639Config::Engine.routes.draw do
 resources :langs

 match "/" => "langs#index"

end
