require "rails_helper"
require "helpers/valid_json_helper.rb"

RSpec.describe Api::Admin::CategoriesController, type: :controller do
  include ValidJsonHelper

  context "when get edit success" do
    let(:category){create :category}
    subject{get :index}

    it "has 200 status code" do
      expect(subject.status).to eq 200
    end

    it "has responds data as json" do
      expect(valid_json? subject.body).to be true
    end
  end
end
