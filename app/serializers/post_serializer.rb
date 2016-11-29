class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :thumbnail
end
