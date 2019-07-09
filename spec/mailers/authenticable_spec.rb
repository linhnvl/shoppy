require "rails_helper"

RSpec.describe AuthenticableMailer, type: :mailer do
  context "instructions" do
    let(:user){create :user}
    let(:mail){described_class.reset_password(user, nil).deliver_now}

    it "renders the subject" do
      expect(mail.subject).to eq("Password reset")
    end

    it "renders the receiver email" do
      expect(mail.to).to eq([user.email])
    end

    it "renders the sender email" do
      expect(mail.from).to eq(["from@example.com"])
    end

    it "assigns @confirmation_url" do
      expect(mail.body.encoded).to match("http://localhost:3000/api/reset_passwords/edit")
    end
  end
end
