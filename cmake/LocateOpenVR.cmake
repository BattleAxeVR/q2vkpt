# Locate OpenVR SDK

include(FindPackageHandleStandardArgs)

unset(OPENVRSDK_LIBS CACHE)
unset(OPENVRSDK_INCLUDE_DIRS CACHE)
unset(OPENVRSDK_FOUND CACHE)
unset(OPENVRSDK_LOCATION CACHE)

find_path( OPENVRSDK_LOCATION headers/openvr.h $ENV{OPENVRSDK_LOCATION} )

message( STATUS "OPENVRSDK_LOCATION is " ${OPENVRSDK_LOCATION} )

if(OPENVRSDK_LOCATION)

  list(APPEND OPENVRSDK_INCLUDE_DIRS ${OPENVRSDK_LOCATION}/headers)
  #mark_as_advanced(OPENVRSDK_INCLUDE_DIRS)

	if(OPENVRSDK_INCLUDE_DIRS)
	message( "Open VR headers found")
  endif(OPENVRSDK_INCLUDE_DIRS)

  # 64-bit Windows only for now
  set(_OPENVR_ARCH "win64")
  mark_as_advanced(_OPENVR_ARCH)
  
  if(MSVC)
    set(_OPENVR_MSVC "VS2017")
    mark_as_advanced(_OPENVR_MSVC)
  endif()

  find_library(OPENVRSDK_LIB openvr_api.lib HINTS ${OPENVRSDK_LOCATION}/lib/${_OPENVR_ARCH}/)  
  
  mark_as_advanced(OPENVRSDK_LIB)
             
  list(APPEND OPENVRSDK_LIBS ${OPENVRSDK_LIB})
  mark_as_advanced(OPENVRSDK_LIBS)

  if(OPENVRSDK_LIB)
	#LINK_DIRECTORIES(client PRIVATE refresh/vkpt/include/vulkan)
	#TARGET_LINK_LIBRARIES(client OPENVRSDK_LIB)
    set( OPENVRSDK_FOUND "YES" )
	message( "Open VR library was found")
  endif(OPENVRSDK_LIB)

else(OPENVRSDK_LOCATION)
  message( "Open VR not found, you must set OPENVRSDK_LOCATION to point to the root of your checked out openvr" )
endif(OPENVRSDK_LOCATION)

find_package_handle_standard_args(OPENVRSDK DEFAULT_MSG
  OPENVRSDK_LOCATION
  OPENVRSDK_INCLUDE_DIRS
  OPENVRSDK_LIBS
)

mark_as_advanced( OPENVRSDK_FOUND )

