require 'spec_helper'

describe Hubspot::Topic do
  before do
    Hubspot.configure(hapikey: "demo")
  end

  describe ".list" do
    cassette "topics_list"

    it "should have a list of topics" do
      topics = Hubspot::Topic.list
      topics.count.should be(3)
    end

    it "should be able to limit the topic count" do
      topics = Hubspot::Topic.list(limit: 1)
      topics.count.should be(1)
    end

    it "should be able to set the page" do
      topics = Hubspot::Topic.list(limit: 1, offset: 100)
      topics.count.should be(0)
    end
  end

  describe ".find_by_topic_id" do
    cassette "topics_list"

    it "should find a specific topic" do
      topic = Hubspot::Topic.find_by_topic_id(349001328)
      topic['id'].should eq(349001328)
    end
  end
end

