require 'spec_helper'

describe Hubspot::BlogAuthor do
  before do
    Hubspot.configure(hapikey: "demo")
  end

  describe ".list" do
    cassette "blog_authors_list"

    it "should have a list of blog_authors" do
      authors = Hubspot::BlogAuthor.list
      authors.count.should be(10)
    end

    it "should be able to limit the topic count" do
      authors = Hubspot::BlogAuthor.list(limit: 1)
      authors.count.should be(1)
    end

    it "should be able to set the page" do
      authors = Hubspot::BlogAuthor.list(limit: 1, offset: 100)
      authors.count.should be(0)
    end
  end
end

