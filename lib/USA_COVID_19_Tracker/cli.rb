class CLI 
    def run 
        system('clear')
        greeting
        while menu != exit
        end
        end_program
    end

    def greeting
        puts "Welcome to the Covid-19 CLI Tracker!"
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