require 'ffi'

module TA
  module Native
    module Utility

      class BasePointerWrapper < FFI::Struct

        def initialize(value)
          self[:value] = value
        end
      end

      class IntPointer < BasePointerWrapper
        layout :value, :int
      end

      class FloatPointer < BasePointerWrapper
        layout :value, :float
      end

      class DoublePointer < BasePointerWrapper
        layout :value, :double
      end
    end
  end
end
