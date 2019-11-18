require 'ffi'

module TA
  module Native
    module OverlapStudies
      extend FFI::Library
      ffi_lib 'ta_lib'

      attach_function :b_bands,
        :TA_BBANDS,
        [
          :int,
          :int,
          :pointer,
          :int,
          :double,
          :double,
          :int,
          :pointer,
          :pointer,
          :pointer,
          :pointer,
          :pointer
        ],
        :int

      attach_function :wma, 
        :TA_WMA, 
        [ 
          :int, 
          :int, 
          :pointer, 
          :int, 
          :pointer, 
          :pointer, 
          :pointer
        ], 
        :int
    end
  end
end
