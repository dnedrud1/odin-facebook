require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  
  before do
    @user = FactoryGirl.create(:user)
  end
  
  
  describe "welcome" do
    let(:mail) { UserMailer.welcome(@user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Welcome")
      expect(mail.to).to eq(["dnedrud1@example.com"])
      expect(mail.from).to eq(["friendbook_noreply@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Welome to Friendbook!")
      expect(mail.body.encoded).to match("thank you for embarking on this wonderous journey with the Friendbook community.")
    end
  end

end
