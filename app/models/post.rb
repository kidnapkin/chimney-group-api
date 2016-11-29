class Post < ApplicationRecord
    mount_uploader :thumbnail, ThumbnailUploader
    mount_uploader :media, MediaUploader
end