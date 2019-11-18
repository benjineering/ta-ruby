RSpec.describe TA::Native::OverlapStudies do
  describe '.wma' do
    let(:array_length) { 100 }

    let(:in_values) do
      pointer = FFI::MemoryPointer.new(:int, array_length)
      values = Array.new(array_length, -1)
      pointer.put_array_of_int(0, values)
      pointer
    end

    let(:out_beg_idx) { TA::Native::Utility::IntPointer.new(-1) }
    let(:out_nb_element) { TA::Native::Utility::IntPointer.new(-1) }

    let(:out_values) do
      pointer = FFI::MemoryPointer.new(:int, array_length)
      values = Array.new(array_length, -1)
      pointer.put_array_of_int(0, values)
      pointer
    end

    let(:function_call) do
      FFI::MemoryPointer.new(:int, array_length) do |pointer|
        values = Array.new(array_length, -1)
        pointer.put_array_of_int(0, values)

        TA::Native::OverlapStudies.wma(
          0, 
          array_length - 1,
          in_values,
          30,
          out_beg_idx,
          out_nb_element,
          pointer
        )
      end
    end

    it 'should return 0' do
      expect(function_call).to eq 0
    end

    it 'should set the out_beg_idx' do
      expect { function_call }.to change { out_beg_idx[:value] }
    end

    it 'should set the out_nb_element' do
      expect { function_call }.to change { out_nb_element[:value] }
    end

    it 'should set the out_values' do
      expect { function_call }.to change {
        out_values.get_array_of_int(0, array_length)
      }
    end
  end
end
