require 'ta/native/common'
require 'ta/native/function/candle'
require 'ta/native/utility'
require 'ta/version'

module TA
  TA::Native._initialize

  unless TA::EXPECTED_LIB_VERSION_MAJOR == TA::Native.version_major.to_i &&
    TA::EXPECTED_LIB_VERSION_MINOR == TA::Native.version_minor.to_i

    require 'colorize'

    actual = "#{TA::Native.version_major}.#{TA::Native.version_minor}"
    expected = "#{TA::EXPECTED_LIB_VERSION_MAJOR}.#{TA::EXPECTED_LIB_VERSION_MINOR}"

    puts "\nWARNING: expected ta-lib version #{expected} but found #{actual}".
      colorize(:yellow)
  end

  at_exit { TA::Native.shutdown }
end
