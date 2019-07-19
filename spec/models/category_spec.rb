require "rails_helper"

RSpec.describe Category, type: :model do
  subject{build :category}

  context :associations do
    it_behaves_like :have_many, :category_products
    it_behaves_like :have_many_through, :products, :category_products
    it{is_expected.to have_many(:children).class_name("Category").dependent(:destroy)}
  end

  context :validates do
    it{is_expected.to be_valid}

    it_behaves_like :presence_of, :name
    it_behaves_like :presence_of, :parent_id
  end
end
