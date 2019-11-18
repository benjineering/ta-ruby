require 'ffi'
require 'ta/native/abstract'

module TA
  module Native
    extend FFI::Library
    ffi_lib 'ta_lib'
    
    
  end
end
