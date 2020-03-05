$LOAD_PATH << "chunky_png/lib"
$LOAD_PATH << "mini_gpio/lib"
$LOAD_PATH << "ruby-spi/lib"
$LOAD_PATH << "lib"

require "piink/display"
require "piink/png"

def run(filename)
  display = Piink::Display.new

  display.init
  #display.clear

  Piink::PNG.new(filename).write_to(display)

  display.deep_sleep
  display.close_display

  RPi::GPIO.reset
end

run(ARGV.fetch(0))
