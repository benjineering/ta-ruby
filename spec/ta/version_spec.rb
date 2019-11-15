RSpec.describe TA do
  describe '::GEM_VERSION' do
    it 'returns a string' do
      expect(TA::GEM_VERSION).to be_a String
    end
  end

  describe '::EXPECTED_LIB_VERSION_MAJOR' do
    it 'returns an integer' do
      expect(TA::EXPECTED_LIB_VERSION_MAJOR).to be_a Integer
    end
  end

  describe '::EXPECTED_LIB_VERSION_MINOR' do
    it 'returns an integer' do
      expect(TA::EXPECTED_LIB_VERSION_MINOR).to be_a Integer
    end
  end
end