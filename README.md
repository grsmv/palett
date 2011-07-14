Yet another one gem for terminal output coloring.

Usage:
----

    require 'palett'

    # working with simple strings
    puts 'Just red'.red 
    puts 'White on magenta '.white.magenta_background 
    puts 'Bold black on white'.black.white_background.bold

    # working with blocks
    white do
      blue_background do
        puts ( 'a'..'z' ).map { |l| l }.join(', ')
      end
    end

    bold do
      red do
        white_background do
          puts File.open('Agile_Manifesto').read
          puts "-" * 50
        end
      end
    nd
