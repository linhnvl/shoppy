require "rails_helper"

RSpec.describe Order, type: :model do
  subject{build :order}

  context :associations do
    it_behaves_like :have_many, :order_details
    it_behaves_like :have_many_through, :products, :order_details
    it_behaves_like :belong_to, :user
  end

  describe :enums do
    context "when define enum for status is pending or approved or cancelled" do
      it{is_expected.to define_enum_for(:status).with_values %i(pending approved cancelled)}
    end

    context "when define enum for payment_method is cash or credit_card" do
      it{is_expected.to define_enum_for(:payment_method).with_values %i(cash credit_card)}
    end
  end
end
