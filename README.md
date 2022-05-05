# OwenWows

This is a Ruby API wrapper for the [Owen Wilson Random Wow API](https://owen-wilson-wow-api.herokuapp.com/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'owen_wows'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install owen_wows

## Usage
```ruby
require 'owen_wows'
wows = OwenWows::Client.new

# get a random wow
wows.random_wow

# list all wows
wows.list
```
Each call returns an array of `OwenWows::Wow` objects.

Some filter options:
```ruby
# from year 
wows.from_year("2000")

# with director
wows.with_director("wes anderson")

# wows in movie
wows.in_movie("Cars")

# by default, movie is an exact search
# specify exact: false to string search
wows.in_movie("Cars", exact: false)
```
You can specify the maximum number of results returned in any filter by passing a `results` argument.
```ruby
wows.in_movie("Cars", exact: false, results: 10)
```
Otherwise, you can search by any combination of parameters.
```ruby
wows.search(movie: "Cars", year: "2000")
```
Get lists of movies and directors.
```ruby
wows.movies
wows.directors
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/iubkud/owen_wows.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
