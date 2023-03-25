# OpenaiImageGenerator

Generate image with Open AI Image Generation Model

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'openai_image_generator'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install openai_image_generator

## Usage

- Get your API key from [https://platform.openai.com/account/api-keys](https://platform.openai.com/account/api-keys)

- If you belong to multiple organizations, you can get your Organization ID from [https://beta.openai.com/account/org-settings](https://beta.openai.com/account/org-settings)

### Quickstart

For a quick test you can pass your api key directly to a new client:

```ruby
result = OpenaiImageGenerator::Client.new(api_key).generate('a white siamese cat', 2, '256x256')
```

### Open AI Image Generation Model

OpenAI has a model that help you generate a new image given a prompt and/or an input image.


```ruby
api_key = "YOUR_API_KEY"

# A text description of the desired image(s). The maximum length is 1000 characters.
prompt = "A cute baby sea otter" 

# The number of images to generate. Must be between 1 and 10.
n = 2

# The size of the generated images. Must be one of 256x256, 512x512, or 1024x1024.
size = '256x256'

result = OpenaiImageGenerator::Client.new(api_key).generate(prompt, n, size)

puts result

# => {"created"=>1676326332, "data"=>[{"url"=>"https://loremflickr.com/300/300"}, {"url"=>"https://loremflickr.com/300/300"}]}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/openai_image_generator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/openai_image_generator/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the OpenaiImageGenerator project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/openai_image_generator/blob/master/CODE_OF_CONDUCT.md).
