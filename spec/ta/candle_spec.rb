RSpec.describe TA::Candle do
  describe '#doji' do
    subject do
      TA::Candle.new(Random.rand, Random.rand, Random.rand, Random.rand).doji
    end

    it 'returns an integer', focus: true do
      expect(subject).to be_an Integer
    end
  end

  describe '.doji' do
    context 'when an array of candles are passed' do
      subject do
        (1..10).to_a.map do
          TA::Candle.new(
            Random.rand, 
            Random.rand, 
            Random.rand, 
            Random.rand
          ).doji
        end
      end

      it 'returns an array of integers' do
        expect(subject).to all(be_an(Integer))
      end
    end

    context 'when a single candle is passed' do
      subject do
        TA::Candle.new(
          Random.rand, 
          Random.rand, 
          Random.rand, 
          Random.rand
        ).doji
      end
      
      it 'returns an integer' do
        expect(subject).to be_an(Integer)
      end
    end
  end
end
