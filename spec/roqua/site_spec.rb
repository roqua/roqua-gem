require "spec_helper"

describe RoQua::Site do
  let(:base_url) { "http://rgoc.roqua.dev/api/v1" }
  let(:site) { RoQua::Site.new(base_url) }

  describe "#initialize" do
    it "takes a base url" do
      site.base_url.should == base_url
    end
  end

  describe "#answers" do
    use_vcr_cassette
    let(:answers) { site.answers(:patient_id => "123", :questionnaire_key => "honos") }

    it "returns a list of answers" do
      puts answers.inspect
      answers.should have(3).answers
    end

    it "should return Answer objects" do
      answers[0].should be_an(RoQua::Answer)
    end
  end
end
