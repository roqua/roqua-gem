require 'spec_helper'

describe RoQua::Answer do
  describe "#initialize" do 
    it "takes a hash" do
      RoQua::Answer.new("_id" => "1").should be
    end
  end

  describe "#id" do
    it "translates to _id" do
      RoQua::Answer.new("_id" => "123").id.should == "123"
    end
  end

  describe "#completed?" do
    it "translates to is_completed" do
      RoQua::Answer.new("is_completed" => true).completed?.should be_true
    end
  end

  describe "#created_at" do
    it "returns a Time object" do
      RoQua::Answer.new("created_at" => "2011-03-17T11:07:19Z").created_at.should be_a(Time)
    end
  end

  describe "#updated_at" do
    it "returns a Time object" do
      RoQua::Answer.new("updated_at" => "2011-03-17T11:07:19Z").updated_at.should be_a(Time)
    end
  end

  describe "#completed_at" do
    it "returns a Time object" do
      RoQua::Answer.new("completed_at" => "2011-03-17T11:07:19Z").completed_at.should be_a(Time)
    end
  end

  describe "other attributes" do
    it "looks up in the given attributes" do
      attributes = {"something" => stub}
      RoQua::Answer.new(attributes).something.should == attributes["something"]
    end
  end
end
