require "rails_helper"

RSpec.describe Product, type: :model do
  subject{build :product}

  context :associations do
    it_behaves_like :have_many, :order_details
    it_behaves_like :have_many_through, :orders, :order_details
    it_behaves_like :have_many, :category_products
    it_behaves_like :have_many_through, :categories, :category_products
  end

  context :validates do
    it{is_expected.to be_valid}

    it_behaves_like :presence_of, :name
    it_behaves_like :presence_of, :price
    it_behaves_like :presence_of, :information
    it_behaves_like :presence_of, :quantity
  end

  it_behaves_like :validate_numericality_of, :price
  it_behaves_like :validate_numericality_of, :quantity
end
