# MovingAvg

Calculate Moving Average in Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'moving_avg'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install moving_avg

## Usage

```ruby
data = [100, 200, 200, 500]
p MovingAvg::Base.sma(data)  #=> 250.0
p MovingAvg::Base.wma(data)  #=> 190.0
p MovingAvg::Base.ewma(data) #=> 298.4
p MovingAvg::Base.mma(data)  #=> 232.8125
```

## Available Strategies

### Simple Moving Average
- aliases
  - `MovingAvg::Base.simple_moving_average()`
  - `MovingAvg::Base.sma()`

### Weighted Moving Average
- a.k.a. Linear Weighted Moving Average
- aliases
  - `MovingAvg::Base.weighted_moving_average()`
  - `MovingAvg::Base.wma()`
  - `MovingAvg::Base.lwma()`

### Exponentially Weighted Moving Average
- aliases
  - `MovingAvg::Base.exponentially_weighted_moving_average()`
  - `MovingAvg::Base.ewma()`

### Modified Moving Average
- aliases
  - `MovingAvg::Base.modified_moving_average()`
  - `MovingAvg::Base.mma()`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kenju/moving_avg.
