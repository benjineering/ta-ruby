require 'ffi'

module TA
  module Native
    extend FFI::Library
    ffi_lib 'ta_lib'

    class RetCode < FFI::Struct
      layout :enumStr, :string,
        :infoStr, :string
    end

    attach_function :version_build, :TA_GetVersionBuild, [], :string
    attach_function :version_date, :TA_GetVersionDate, [], :string
    attach_function :version_major, :TA_GetVersionMajor, [], :string
    attach_function :version_minor, :TA_GetVersionMinor, [], :string
    attach_function :version_string, :TA_GetVersionString, [], :string
    attach_function :version_time, :TA_GetVersionTime, [], :string

    attach_function :set_ret_code_info, 
      :TA_SetRetCodeInfo, 
      [ :int, :pointer ], 
      :void

    attach_function :_initialize, :TA_Initialize, [], :int
    attach_function :shutdown, :TA_Shutdown, [], :int
  end
end
