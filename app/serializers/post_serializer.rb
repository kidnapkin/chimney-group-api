class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :thumbnail, :media, :media_type
end
