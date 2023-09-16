Rails.application.routes.draw do
  # get "/blog_posts/:id/edit" to: "blog_posts#edit", as: :edit_blog_post
  resources :blog_posts, only: [:new, :show, :create, :edit]

  # Defines the root path route ("/")
  root "blog_posts#index"
end
