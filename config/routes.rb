Rails.application.routes.draw do
  def draw(routes_name)
    instance_eval(File.read(Rails.root.join("config/routes/#{routes_name}.rb")))
  end

  draw :admin

  get "/login", to: "login#new"
  post "/login", to: "login#create"
  
  resource :subject, only: [:show]
end

