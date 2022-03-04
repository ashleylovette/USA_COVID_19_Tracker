class CLI 
    def run
        CRUD.create_secure_users
        system('clear')
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
    list_options
    input = gets.chomp.downcase
    choose_option(input)
    return input
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
        puts "Number one is chosen."
    when "2"
        puts "Number two is chosen."
    end
end