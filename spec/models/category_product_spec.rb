require "rails_helper"

RSpec.describe CategoryProduct, type: :model do
  subject{create :category_product}

  context :associations do
    it_behaves_like :belong_to, :category
    it_behaves_like :belong_to, :product
  end

  context :validate do
    it{is_expected.to be_valid}
  end
end
