class Api::V1::Books::Resources::Books < Grape::API
    resource :books do
        desc "Get List Books"
        get "/" do
            if Rails.cache.read("books").present?
                Rails.logger.info("Get book from cache")
        
                data = JSON.parse(Rails.cache.read("books"))        
                data = paginate data
            else
                Rails.logger.info("Get book from database")
        
                data = Book.all
                cache = Rails.cache.write("book", data.to_json, expires_in: 1.minute)
            end
    
            present :books, data
        end
    end
end