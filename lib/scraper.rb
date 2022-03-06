require 'nokogiri'
require "open-uri"
require_relative "./concerns/printable.rb"
require_relative "./country.rb"

class Scraper 
    extend Printable::Styles
    
    URL = "https://www.worldometers.info/coronavirus/country/us/"

    def self.scrape_usa 
        doc = Nokogiri::HTML(URI.open(URL))
        country_main = doc.css(".maincounter-number")
        usa_confirmed_cases = text_to_integer(country_main[0].text)
        usa_overall_deaths = text_to_integer(country_main[1].text)
        usa_recoveries = text_to_integer(country_main[2].text)
        p usa = Country.new(name: "USA", confirmed_cases: usa_confirmed_cases, overall_deaths: usa_overall_deaths, recoveries: usa_recoveries)
    end
    
    def self.scrape_states
        puts "Scraping States stats"
        doc = Nokogiri::HTML(URI.open(URL))
        states_table = doc.css('tbody tr')

        states_table[1..51].each do |row|
            name = row.css('td')[1].text.split(" ").join(" ")
            cases = text_to_integer( row.css('td')[2].text)
            deaths = text_to_integer( row.css('td')[4].text)
            recoveries = text_to_integer( row.css('td')[6].text)
            if name != "District Of Columbia"
                State.new(name: name, overall_deaths:deaths, confirmed_cases: cases, recoveries:recoveries)
            end
        end
    end

end

Scraper.scrape_usa