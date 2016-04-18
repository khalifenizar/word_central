Rails.application.routes.draw do
  root "site#home"

  get "/text_inspections/new", to: "text_inspections#new"
  post "/text_inspections", to: "text_inspections#create"

  get "/asciis/new", to: "asciis#new"
  post "/asciis", to: "asciis#create"

  get "/flipsums/new", to: "flipsums#new"
  post "/flipsums", to: "flipsums#create"
end
