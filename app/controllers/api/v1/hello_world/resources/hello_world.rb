class Api::V1::HelloWorld::Resources::HelloWorld < Grape::API
  resource :test do
    get "/" do
      env["api.response.message"] = "Hello World"
      present :test, nil
    end
  end
end
