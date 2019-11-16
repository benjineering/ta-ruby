require 'ffi'

module TA
  module Native
    module Function
      module Candle
        extend FFI::Library
        ffi_lib 'ta_lib'

        attach_function :doji, 
          :TA_CDLDOJI, 
          [ 
            :int, 
            :int, 
            :pointer, 
            :pointer, 
            :pointer, 
            :pointer, 
            :pointer, 
            :pointer,
            :pointer
          ], 
          :int
      end
    end
  end
end
