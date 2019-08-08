require "rails_helper"

RSpec.describe Admin, type: :model do
  subject{build :admin}

  context :validates do
    it{is_expected.to be_valid}

    it_behaves_like :presence_of, :name
    it_behaves_like :presence_of, :email
    it_behaves_like :presence_of, :role

    it_behaves_like :allow_value, Faker::Internet.email, :email
    it_behaves_like :validate_uniqueness_of, :email
  end

  describe :enums do
    context "when define enum for role is system_admin or shop_admin" do
      it{is_expected.to define_enum_for(:role).with_values %i(system_admin shop_admin)}
    end
  end
end
