require "rails_helper"
require "helpers/valid_json_helper.rb"
require "helpers/create_token_helper.rb"

RSpec.describe Api::AdminsController, type: :controller do
  include ValidJsonHelper
  include CreateTokenHelper

  context "when add new admin success" do
    let(:user){create :user}
    before{request.headers.merge!(Authorization: create_valid_token(user.id))}
    subject do
      post :create, params: {email: user.email, role: "shop_admin", name: user.name,
                             password_digest: user.password_digest, skip_password_validation: true}
    end
    it "has 200 status code" do
      expect(subject.status).to eq 200
    end

    it "has responds admin data as json" do
      expect(valid_json? subject.body).to be true
    end
  end

  context "when add new admin fail" do
    let(:admin){create :admin}
    before{request.headers.merge!(Authorization: create_valid_token(admin.id))}
    subject do
      post :create, params: {email: admin.email, role: "shop_admin", name: admin.name,
                             password_digest: admin.password_digest, skip_password_validation: true}
    end
    it "has 404 status code" do
      expect(subject.status).to eq 404
    end

    it "has responds admin data as json" do
      expect(valid_json? subject.body).to be true
    end
  end

  context "when index admins success" do
    let(:page){rand(1..3)}
    let!(:admins){create_list :admin, 15}

    subject{get :index, params: {page: page}}

    it "has 200 status code" do
      expect(subject.status).to eq 200
    end

    it "has responds admin data as json" do
      expect(valid_json? subject.body).to be true
    end
  end

  context "admin data responds" do
    let(:admin1){create :admin, name: "Admin 1", created_at: "2019-07-31 02:01:14"}
    let(:admin2){create :admin, name: "Admin 2", created_at: "2019-07-31 02:01:15"}
    let(:admin3){create :admin, name: "Admin 3", created_at: "2019-07-31 02:01:16"}

    it "should order by created_at descending" do
      expect(Admin.order_desc).to eq [admin3, admin2, admin1]
    end
  end

  context "when destroy admins success" do
    let(:admin){create :admin}
    subject{delete :destroy, params: {id: admin.id}}

    it "has 200 status code" do
      expect(subject.status).to eq 200
    end

    it "has responds admin data as json" do
      expect(valid_json? subject.body).to be true
    end
  end

  context "when destroy admin fail" do
    subject{delete :destroy, params: {id: 100}}

    it "has 404 status code" do
      expect(subject.status).to eq 404
    end

    it "has responds admin data as json" do
      expect(valid_json? subject.body).to be true
    end
  end
end
