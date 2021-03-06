require 'rails_helper'

RSpec.describe Member, type: :model do
  describe "send_password_reset" do
    let(:member) { FactoryGirl(:member) }

    it "generates a new password reset token each time" do
      member.send_password_reset
      last_token = member.password_reset_token
      member.send_password_reset
      member.password_reset_token.should_not eq(last_token)
    end

    it "saves the time the password_reset_token was sent" do
      member.send_password_reset
      member.reload.password_reset_sent_at.should be_present
    end

    it "delivers email to member" do
      member.send_password_reset
      last_email.to.should include(member.email)
    end
  end
end
