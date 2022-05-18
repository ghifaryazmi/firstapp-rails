class Api::Init < Grape::API
    # Build params using object
    #mount Api::V1::Main
    # insert_after Grape::Middleware::Formatter, Grape::Middleware::Logger,
    #            logger: Logger.new($stderr),
    #            filter: Class.new {
    #              def filter(opts)
    #                opts.reject do |k, _|
    #                  k.to_s == "password"
    #                end
    #              end
    #            }.new,
    #            headers: %w[version cache-control]

    # # Build params using object
    #include DoorkeeperProtected
    include Grape::Extensions::Hashie::Mash::ParamBuilder

    # before do
    #     response = OAuth2.valid_doorkeeper_token?(request)
    #     if response.body.try(:[], :error)
    #         error!(response.body.try(:[], :message), env["api.response.code"] = response.status)
    #     end
    #     @current_user = JSON.parse(response.body.try(:[], :message))
    #     # p @current_user.try(:[], 'roles').try(:[], 'name')
    # end

    mount Api::V1::Main
end