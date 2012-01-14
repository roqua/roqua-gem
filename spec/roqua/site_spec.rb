require "spec_helper"

describe RoQua::Site do
  let(:base_url) { "http://rgoc.roqua.dev/api/v1" }
  let(:username) { "testuser" }
  let(:password) { "testpass" }
  let(:site) { RoQua::Site.new(base_url, username, password) }

  describe "#initialize" do
    it "takes a base url a username and a password" do
      site.should be_a(RoQua::Site)
    end
  end

  describe "#answers" do
    use_vcr_cassette
    let(:answers) { site.answers(:patient_id => "123", :questionnaire_key => "honos") }

    it "returns a list of answers" do
      answers.should have(3).answers
    end

    it "should return Answer objects" do
      answers[0].should be_an(RoQua::Answer)
    end
  end

  describe "#patient" do
    use_vcr_cassette
    let(:patient) { site.patient("123") }

    it "returns a patient" do
      patient.should be_a(RoQua::Patient)
    end
  end
end
