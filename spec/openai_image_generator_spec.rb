# frozen_string_literal: true

RSpec.describe OpenaiImageGenerator do
  let(:client) { OpenaiImageGenerator::Client.new(api_key: Faker::Crypto.md5) }
  let(:prompt) { create(:prompt) }
  let(:images) {}

  let(:body) do
    {
      created: 1676326332,
      data: [
        {
          "url": Faker::LoremFlickr.image
        },
        {
          "url": Faker::LoremFlickr.image
        }
      ]
    }
  end

  it "has a version number" do
    expect(OpenaiImageGenerator::VERSION).not_to be nil
  end

  describe "generate" do

    before do
      stub_request(:post, "https://api.openai.com/v1/images/generations").
        to_return(status: 200, body: body.to_json, headers: request_headers)
    end

    it 'returns the correct response' do
      json = client.generate('a white siamese cat', 2, '256x256')
      #response = JSON.parse(json)
      expect(json).to be_kind_of(Hash)
      expect(json).to have_key("data")
      expect(json["data"].length).to eq 2
    end

  end
end
