class Post < ApplicationRecord
    mount_uploader :thumbnail, ThumbnailUploader
    mount_uploader :media, MediaUploader
    
    validates :title, presence: true
    validates :description, presence: true
    validates :thumbnail, presence: true
    validates :media, presence: true
    validates :media_type, presence: true
    
    enum media_type: [ :video, :audio ]
end