require 'ta/native/candle'
require 'ta/native/overlap_studies'
require 'ta/native/utility'
require 'ta/error'

module TA
  class Candle
    attr_reader :open, :high, :low, :close, :time

    def initialize(open, high, low, close, time = nil)
      @open = open
      @high = high
      @low = low
      @close = close
      @time = time
    end

    def doji
      TA::Candle.doji(self)
    end

    class << self

      def doji(candles)
        input = candles.is_a?(Array) ? candles : [ candles ]

        out_start = TA::Native::Utility::IntPointer.new(-1)
        out_end = TA::Native::Utility::IntPointer.new(-1)
        return_vals = TA::Native::Utility.int_array(Array.new(input.length, -1))
        values = pivot(input)

        ret_code = TA::Native::Candle.doji(
          0, 
          input.length - 1,
          TA::Native::Utility.double_array(values[:open]),
          TA::Native::Utility.double_array(values[:high]),
          TA::Native::Utility.double_array(values[:low]),
          TA::Native::Utility.double_array(values[:close]),
          out_start,
          out_end,
          return_vals
        )

        raise TA::Error.new(ret_code) unless ret_code == 0
        
        array = return_vals.get_array_of_int(
          out_start[:value], 
          out_end[:value] + 1
        )

        candles.is_a?(Array) ? array : array.first
      end

      private 

      def pivot(array)
        result = {
          open: [],
          high: [],
          low: [],
          close: []
        }

        array.each do |candle|
          result[:open] << candle.open
          result[:high] << candle.high
          result[:low] << candle.low
          result[:close] << candle.close
        end

        result
      end
    end
  end
end
