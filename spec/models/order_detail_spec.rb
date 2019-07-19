require "rails_helper"

RSpec.describe OrderDetail, type: :model do
  subject{build :order_detail}

  context :associations do
    it_behaves_like :belong_to, :order
    it_behaves_like :belong_to, :product
  end

  context :validate do
    it{is_expected.to be_valid}

    it_behaves_like :validate_numericality_of, :price
    it_behaves_like :validate_numericality_of, :quantity
  end
end
