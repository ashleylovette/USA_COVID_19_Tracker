# frozen_string_literal: true

require_relative "USA_COVID_19_Tracker/version"
require_relative "./country.rb"
require_relative "./state.rb"
require_relative "./scraper.rb"

module USACOVID19Tracker
  class Error < StandardError; end
  # Your code goes here...
end

require_relative "USA_COVID_19_Tracker/cli.rb"