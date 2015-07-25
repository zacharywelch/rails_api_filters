# RailsApiFilters

A filter chain for Rails APIs

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_api_filters', git: 'git@cagit.careerbuilder.com:zwelch/rails_api_filters.git'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install 'rails_api_filters', git: 'git@cagit.careerbuilder.com:zwelch/rails_api_filters.git'

## Usage

RailsApiFilters is automatically included in `ActionController::Base` or `ActionController::API` if you're using [rails-api](https://github.com/rails-api/rails-api). 

RailsApiFilter will trap common exceptions and respond with the correct status code and message.

- `ActiveRecord::RecordNotFound` exceptions are returned as 404 Resource not found

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Add tests for your feature.
4. Add your feature.
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create a new Pull Request
