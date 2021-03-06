RSpec.describe TA::Native do
  describe '.version_build' do
    it 'returns a string' do
      expect(TA::Native.version_build).to be_a String
    end
  end

  describe '.version_date' do
    it 'returns a string' do
      expect(TA::Native.version_date).to be_a String
    end
  end

  describe '.version_major' do
    it 'returns a string' do
      expect(TA::Native.version_major).to be_a String
    end
  end

  describe '.version_minor' do
    it 'returns a string' do
      expect(TA::Native.version_minor).to be_a String
    end
  end

  describe '.version_string' do
    it 'returns a string' do
      expect(TA::Native.version_string).to be_a String
    end
  end

  describe '.version_time' do
    it 'returns a string' do
      expect(TA::Native.version_time).to be_a String
    end
  end

  describe '.set_ret_code_info' do
    subject do
      result = TA::Native::RetCode.new
      TA::Native.set_ret_code_info(0, result)
      result
    end

    it "sets the passed RetCode's enumStr" do
      expect(subject[:enumStr].length).to be > 0
    end

    it "sets the passed RetCode's infoStr" do
      expect(subject[:infoStr].length).to be > 0
    end
  end

  describe '._initialize' do
    it 'returns 0' do
      expect(TA::Native._initialize).to eq 0
    end
  end

  describe '.shutdown' do
    it 'returns 0' do
      expect(TA::Native.shutdown).to eq 0
    end
  end
end
