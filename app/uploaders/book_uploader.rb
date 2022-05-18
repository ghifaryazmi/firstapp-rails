class BookUploader < CarrierWave::Uploader::Base
    # include Cloudinary::CarrierWave

    def store_dir
        "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    def extension_allowlist
        %w(jpg jpeg png)
    end

    # def public_id
    #     return "firstApp_development/" + cloudinary_public_id
    # end

    # private

    # def cloudinary_public_id
    #     Cloudinary::Utils.random_public_id[0..12]
    # end

    # private

    # def secure_filename
    #     hex = SecureRandom.uuid.split("-")
    #     hex.join("")
    # end
end