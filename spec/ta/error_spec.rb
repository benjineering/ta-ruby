RSpec.describe TA::Error do
  describe '.new' do
    subject { TA::Error.new(1) }

    it 'sets enum' do
      expect(subject.enum).to eq 'TA_SUCCESS'
    end

    it 'sets info' do
      expect(subject.info).to eq 'No error'
    end

    it 'formats the message string using the enum and info strings' do
      expect(subject.message).to eq 'TA_SUCCESS: No error'
    end
  end
end
