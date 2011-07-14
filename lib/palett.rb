require 'stringio'

module Kernel
  def color text, code
    "\e[#{code}m#{text}\e[0m"
  end
end

module Palett

  ANSI_PROPERTIES = {
    1  => 'bold',             4  => 'underline',           5  => 'blink',
    30 => 'black',            31 => 'red',                 32 => 'green',
    33 => 'yellow',           34 => 'blue',                35 => 'magenta',
    36 => 'cyan',             37 => 'white',               40 => 'black_background',
    41 => 'red_background',   42 => 'green_background',    43 => 'yellow_background',
    44 => 'blue_background',  45 => 'magenta_background',  46 => 'cyan_background',
    47 => 'white_background'
  }

  ANSI_PROPERTIES.each do |code, name|
    define_method name do
      color self, code
    end
  end
end

class String
  include Palett
end

class Object
  include Palett

  # TODO: READ STANDART OUTPUT TO STR AND COLORIZE IT
  ANSI_PROPERTIES.each do |code, name|
    eval <<-EOM
      def #{name} &block 
        sio = StringIO.new
        old_stdout, $stdout = $stdout, sio
        yield
        $stdout = old_stdout
        puts sio.string.strip.#{name}
      end
    EOM
  end  
end
