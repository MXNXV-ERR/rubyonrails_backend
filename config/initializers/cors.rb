# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin Ajax requests.

# Read more: https://github.com/cyu/rack-cors

# Rails.application.config.middleware.insert_before 0, Rack::Cors do
#   allow do
#     origins "example.com"
#
#     resource "*",
#       headers: :any,
#       methods: [:get, :post, :put, :patch, :delete, :options, :head]
#   end
# end
Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'http://192.168.137.1:3000',
                  'http://localhost:3000',
                  'http://127.0.0.1:3000',
                  'http://127.0.0.1:3001',
                  'http://192.168.137.1:3001',
                  'http://localhost:3001'
                   # Replace with the actual URL of your React app in production
      resource '*', 
      headers: :any, 
      methods: [:get, :post, :put, :patch, :delete, :options],
      credentials: true,
      max_age: 86400
    end
  end