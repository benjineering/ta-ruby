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

      # TODO: DRY up C array creation
      def self.double_array(values)
        pointer = FFI::MemoryPointer.new(:double, values.length)
        pointer.put_array_of_double(0, values)
        pointer
      end

      def self.int_array(values)
        pointer = FFI::MemoryPointer.new(:int, values.length)
        pointer.put_array_of_int(0, values)
        pointer
      end
    end
  end
end
