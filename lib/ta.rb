require 'ta/common'
require 'ta/version'

module TA
  unless TA::EXPECTED_LIB_VERSION_MAJOR == TA.version_major.to_i &&
    TA::EXPECTED_LIB_VERSION_MINOR == TA.version_minor.to_i

    require 'colorize'

    actual = "#{TA.version_major}.#{TA::EXPECTED_LIB_VERSION_MINOR}"
    expected = "#{TA::EXPECTED_LIB_VERSION_MAJOR}.#{TA.version_minor}"

    puts "\nWARNING: expected ta-lib version #{expected} but found #{actual}".
      colorize(:yellow)
  end
end
