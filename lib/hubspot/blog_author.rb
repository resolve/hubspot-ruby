require 'hubspot/utils'
require 'httparty'

module Hubspot
  #
  # HubSpot Topics API
  #
  class BlogAuthor
    BLOG_AUTHOR_LIST_PATH = "/content/api/v2/blog-authors"

    class << self
      # Lists the blog_authors
      # {http://developers.hubspot.com/docs/methods/blogv2/get_blog_authors}
      # @return [Hubspot::BlogAuthor, []] array of authors or empty_array
      def list(params = {})
        url = Hubspot::Utils.generate_url(BLOG_AUTHOR_LIST_PATH, params)
        resp = HTTParty.get(url, format: :json)
        if resp.success?
          resp.parsed_response['objects'].map do |topic_hash|
            BlogAuthor.new(topic_hash)
          end
        else
          []
        end
      end
    end

    attr_reader :properties

    def initialize(response_hash)
      @properties = response_hash #no need to parse anything, we have properties
    end

    def [](property)
      @properties[property]
    end
  end
end
