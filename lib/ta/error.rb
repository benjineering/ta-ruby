require 'ta/native/common'

module TA
  class Error < StandardError
    attr_reader :enum, :info

    def initialize(code)
      result = TA::Native::RetCode.new
      TA::Native.set_ret_code_info(0, result)
      
      @enum = result[:enumStr]
      @info = result[:infoStr]

      super("#{@enum}: #{@info}")
    end
  end
end
