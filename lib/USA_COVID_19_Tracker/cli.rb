class CLI 
    def run 
        system('clear')
        greeting
        menu
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
end

def list_options
    puts <<-DOC.gsub /^\s/, ''
    1.
    2.
    3.
    Which one do you prefer?
    DOC
end