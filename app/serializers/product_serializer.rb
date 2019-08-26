class ProductSerializer < ApplicationSerializer
  attributes :name, :price, :information, :quantity

  attribute :categories do |object|
    CategorySerializer.new object.categories
  end

  has_many :categories

  expose_attachments :images
end
