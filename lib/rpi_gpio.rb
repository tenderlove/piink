require "mini_gpio"

module RPi
  class GPIOAdapter
    def initialize
      @gpio = MiniGPIO.new
    end

    def setup pin, as:
      case as
      when :input
        @gpio.set_mode pin, MiniGPIO::Modes::INPUT
      when :output
        @gpio.set_mode pin, MiniGPIO::Modes::OUTPUT
      else
        raise NotImplementedError, as
      end
    end

    def high? pin
      @gpio.read(pin) == 1
    end

    def low? pin
      @gpio.read(pin) == 0
    end

    def set_high pin
      @gpio.write pin, 1
    end

    def set_low pin
      @gpio.write pin, 0
    end

    def set_numbering style
      raise NotImplementedError unless style == :bcm
    end

    def reset; end
  end

  GPIO = GPIOAdapter.new
end
