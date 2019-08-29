class ProductSerializer < ApplicationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :price, :information, :quantity, :categories

  expose_attachments :images
end
