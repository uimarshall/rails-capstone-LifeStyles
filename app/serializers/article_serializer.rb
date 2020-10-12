class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :text, :category_id, :image

  def image
    rails_blob_path(object.image, only_path: true) if object.image.attached?
  end
end
