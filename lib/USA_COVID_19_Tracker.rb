# frozen_string_literal: true
require "bcrypt"
require_relative "concerns/grabable.rb"
require_relative "USA_COVID_19_Tracker/version"
require_relative "./country.rb"
require_relative "./state.rb"
require_relative "./scraper.rb"
require_relative "user.rb"
require_relative "crud.rb"

module USACOVID19Tracker
  class Error < StandardError; end
  # Your code goes here...
end

require_relative "USA_COVID_19_Tracker/cli.rb"