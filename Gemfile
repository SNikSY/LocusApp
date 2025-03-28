source "https://rubygems.org"

# Rails core
gem "rails", "~> 7.2.1"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"

# Frontend
gem "importmap-rails"
gem "turbo-rails"
gem 'sassc'
gem "stimulus-rails"
gem "jbuilder"

# Optional features (commented out)
# gem "redis", ">= 4.0.1"
gem "kredis"
# gem "bcrypt", "~> 3.1.7"
gem "image_processing", "~> 1.2"

# Cross-platform compatibility
gem "tzinfo-data", platforms: %i[windows jruby]
gem "bootsnap", require: false

# Authentication & Authorization
gem "devise"
gem "cancancan", "~> 3.0"

# Development Tools
gem "faker"

group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
  gem "letter_opener"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
