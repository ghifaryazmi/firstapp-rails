class Api::V1::Users::Resources::Users < Grape::API
    resource :users do
        desc "Get List Users"
        params do
        optional :q, type: String, desc: "Your key search"
        end

        get "/" do
            if Rails.cache.read("user").present?
                Rails.logger.info("Get user from cache")

                data = JSON.parse(Rails.cache.read("user"))
                data = paginate data
            else
                Rails.logger.info("Get user from databse")

                data = User.all
                cache = Rails.cache.write("user", data.to_json, expires_in: 1.minute)
            end
            present :users, data, with: Api::V1::Users::Entities::Users
        end

        desc "Create User"
        params do
            requires :username, type: String
            requires :email, type: String, allow_blank: false, regexp: /.+@.+/
            requires :password, type: String
        end
        post "/" do
            user = User.new
            user.username = params.username
            user.email = params.email
            user.password = BCrypt::Password.create(params.password)
            user.register_at = Time.now
            error!(user.errors) unless user.save

            env["api.response.message"] = "User Created"
            present :users, user, with: Api::V1::Users::Entities::Users
        end

        desc "Show User"
        get "/:id" do
            data = User.find_by_id(params.id)
            error!("User not found", env["api.response.code"] = 422) unless data.present?
            present :users, data, with: Api::V1::Users::Entities::Users
        end

        desc "Delete User"
        delete "/delete/:id" do
            data = User.find_by_id(params.id)
            error!("User not found", env["api.response.code"] = 422) unless data.present?

            User.find(params[:id]).destroy!
            #present :users, data, with: Api::V1::Users::Entities::Users
            env["api.response.message"] = "User Deleted"
            present :users, nil
        end

        desc "Update User"
        params do
            requires :username, type: String
            requires :email, type: String, allow_blank: true, regexp: /.+@.+/
            requires :password, type: String
        end
        post "/update/:id" do
            user = User.find(params[:id])
            error!("User not found", env["api.response.code"] = 422) unless user.present?

            user.username = params.username
            user.email = params.email
            user.password = BCrypt::Password.create(params.password)
            user.register_at = Time.now
            error!(user.errors) unless user.save

            env["api.response.message"] = "User Created"
            present :users, user, with: Api::V1::Users::Entities::Users
        end

        desc "Save My Book"
        params do
            requires :name, type: String
            requires :cover_book,type: File
            requires :user_id
        end
        post "/mybook" do
            user = User.find(params[:user_id])
            error!("User not found", env["api.response.code"] = 422) unless user.present?

            user.books.build(cover_book: params.cover_book).try(:save)
            user.books.create(name: params.name)
            data = user.books
            env["api.response.message"] = "book saved"
            present :books, data
        end
    end
end