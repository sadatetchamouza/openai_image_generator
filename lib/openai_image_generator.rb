# frozen_string_literal: true

require 'uri'
require 'net/http'
require 'json'
require_relative "openai_image_generator/version"

module OpenaiImageGenerator
  class Error < StandardError; end

  class Client
    API_URL = URI.parse("https://api.openai.com/v1/images/generations".freeze)

    attr_accessor :api_key

    def initialize(api_key)
      @api_key = api_key
    end

    def generate(prompt, number_images, size)

      response = Net::HTTP.start(API_URL.host, API_URL.port, use_ssl: true) do |http|
        request = Net::HTTP::Post.new(API_URL.request_uri, header)
        request.body = body(prompt, number_images, size).to_json
        http.request(request)
      end

      JSON.parse(response.body)
    end

    private

    def body(prompt, number_images, size)
      {
        prompt: prompt,
        n: number_images || 1,
        size: size
      }
    end

    def header
      {
        'Content-Type': 'application/json',
        'Authorization': "Bearer #{api_key}"
      }
    end
  end
end
