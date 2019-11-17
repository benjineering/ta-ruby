RSpec.describe TA::Native::Candle do
  describe '.doji' do
    let(:array_length) { 100 }

    # TODO: create array creator method in Utility
    def double_array
      pointer = FFI::MemoryPointer.new(:double, array_length)
      values = (1..array_length).to_a.collect { Random.rand * 10 }
      pointer.put_array_of_double(0, values)
      pointer
    end

    let(:out_beg_idx) { TA::Native::Utility::IntPointer.new(-1) }
    let(:out_nb_element) { TA::Native::Utility::IntPointer.new(-1) }

    let(:out_integers) do
      pointer = FFI::MemoryPointer.new(:int, array_length)
      values = Array.new(array_length, -1)
      pointer.put_array_of_int(0, values)
      pointer
    end

    let(:function_call) do
      TA::Native::Candle.doji(
        0, 
        array_length - 1,
        double_array,
        double_array,
        double_array,
        double_array,
        out_beg_idx,
        out_nb_element,
        out_integers
      )
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

    it 'should set the out_integers' do
      expect { function_call }.to change {
        out_integers.get_array_of_int(0, array_length)
      }
    end
  end
end
