require 'spec_helper'

describe RoQua::Patient do
  describe "#initialize" do 
    it "takes a hash" do
      RoQua::Patient.new("_id" => "1").should be
    end
  end

  describe "#id" do
    it "translates to _id" do
      RoQua::Patient.new("_id" => "123").id.should == "123"
    end
  end

  describe "#created_at" do
    it "returns a Time object" do
      RoQua::Patient.new("created_at" => "2011-03-17T11:07:19Z").created_at.should be_a(Time)
    end
  end

  describe "#updated_at" do
    it "returns a Time object" do
      RoQua::Patient.new("updated_at" => "2011-03-17T11:07:19Z").updated_at.should be_a(Time)
    end
  end

  describe "other attributes" do
    it "looks up in the given attributes" do
      attributes = {"something" => stub}
      RoQua::Patient.new(attributes).something.should == attributes["something"]
    end
  end
end

