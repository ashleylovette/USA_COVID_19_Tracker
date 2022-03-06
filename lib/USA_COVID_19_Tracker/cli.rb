class CLI 
    def run
        scrape
        system('clear')
        CRUD.create_secure_users
        greeting
        login
        while menu != exit
        end
        end_program
    end

    def greeting
        puts "Welcome to the Covid-19 CLI Tracker!"
    end

    def login
        authenticated = false
        
        while authenticated != true
            puts "Please login"
            puts "> What is your username?"
            username = gets.chomp.downcase
            puts "> What is your password?"
            password = gets.chomp.downcase
            if CRUD.authenticate_user(username, password)
                authenticated = true
            else 
                puts "Please try again"
            end
        end
    end

    def end_program
        puts "See ya later!"
    end
end

def menu
    puts "1. Top 10 States with the most confirmed cases"
    puts "2. Top 10 States with the least confirmed cases"
    puts "What would you like to choose?"
    input = gets.chomp
    choose_option(input)
    input
end

def list_options
    puts <<-DOC.gsub /^\s/, ''
    1.
    2.
    3.
Which one do you prefer?
    DOC
end

def choose_option(option)
    case option
    when "1"
        State.all[0..9].each_with_index do |state, i|
          puts "#{i + 1}. #{state.name} confirmed cases: #{state.confirmed_cases}"
        end
    when "2"
        states = State.all.sort_by { |state| state.confirmed_cases }
        states[0..9].each_with_index do |state, i|
        puts "#{i + 1}. #{state.name} confirmed cases: #{state.confirmed_cases}"
        end
    end
end

def scrape
    Scraper.scrape_usa
    Scraper.scrape_states
end