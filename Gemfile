# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.4"
gem "jbuilder", "~> 2.7"
gem "puma", "~> 5.0"
gem "rails", "~> 6.1.6"
gem "sass-rails", ">= 6"
gem "sqlite3", "~> 1.4"
gem "turbolinks", "~> 5"
gem "webpacker", "~> 5.0"

gem "bootsnap", ">= 1.4.4", require: false

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "overcommit", "~> 0.58.0"
  gem "rspec-rails", "~> 5.1"
  gem "rubocop", "~> 1.29"
end

group :development do
  gem "listen", "~> 3.3"
  gem "rack-mini-profiler", "~> 2.0"
  gem "spring"
  gem "web-console", ">= 4.1.0"
end

group :test do
  gem "rails-controller-testing"
  gem "shoulda-matchers", "~> 5.0"
end

gem "factory_bot_rails"
gem "faker", "~> 2.21"
gem "kaminari"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
