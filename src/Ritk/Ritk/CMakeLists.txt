cmake_minimum_required(VERSION 2.8)

project(Ritk)

# set debug build flags
set( CMAKE_CXX_FLAGS_DEBUG "-g -Wall" )
set( CMAKE_C_FLAGS_DEBUG "-g -Wall" )

if( NOT R_INCLUDE_DIR )
  message( FATAL_ERROR "R_INCLUDE_DIR invalid. Perhaps R was not built as library." )
endif( NOT R_INCLUDE_DIR )
if( NOT RCPP_INCLUDE_DIR )
  message( FATAL_ERROR "RCPP_INCLUDE_DIR invalid. Perhaps Rcpp has not been installed." )
endif( NOT RCPP_INCLUDE_DIR )
if( NOT R_LIB_DIR )
  message( FATAL_ERROR "R_LIB_DIR invalid. Perhaps R was not built as library." )
endif( NOT R_LIB_DIR )
if( NOT RCPP_LIB_DIR )
  message( FATAL_ERROR "RCPP_LIB_DIR invalid. Perhaps Rcpp has not been installed." )
endif( NOT RCPP_LIB_DIR )

# find and itk library; create shared object that interacts with it and link against it
find_package(ITK REQUIRED)
include( ${ITK_USE_FILE} )

# headers supplied with the package
include_directories( ${Ritk_SOURCE_DIR}/include )

# extract the paths from the variables supplied for rcpp and r include and lib
string( REGEX MATCHALL "(^-I[^ ]+ *)|( -I[^ ]+ *)" RCPP_INCLUDE_DIR_MATCHES ${RCPP_INCLUDE_DIR} )
string( REGEX MATCHALL "(^-I[^ ]+ *)|( -I[^ ]+ *)" R_INCLUDE_DIR_MATCHES ${R_INCLUDE_DIR} )

foreach( loop_var IN LISTS RCPP_INCLUDE_DIR_MATCHES )
  string( REGEX REPLACE "-I([^ ]+)" "\\1" RCPP_INCLUDE_DIR ${loop_var} )
  include_directories( ${RCPP_INCLUDE_DIR} )
endforeach( loop_var )
 
foreach( loop_var IN LISTS R_INCLUDE_DIR_MATCHES )
  string( REGEX REPLACE "-I([^ ]+)" "\\1" R_INCLUDE_DIR ${loop_var} )
  include_directories( ${R_INCLUDE_DIR} )
endforeach( loop_var )

add_library( Ritk MODULE 
  # antsRegistration
  ${Ritk_SOURCE_DIR}/src/antsRegistration.cxx 
  ${Ritk_SOURCE_DIR}/src/antsCommandLineParser.cxx 
  ${Ritk_SOURCE_DIR}/src/antsCommandLineOption.cxx 
  # ants_motion_estimation
  ${Ritk_SOURCE_DIR}/src/antsMotionCorr.cxx 
  # ants_brain_extraction
  ${Ritk_SOURCE_DIR}/src/N3BiasFieldCorrection.cxx
  ${Ritk_SOURCE_DIR}/src/ThresholdImage.cxx 
  ${Ritk_SOURCE_DIR}/src/ImageMath.cxx
  # ants_to_template 
  ${Ritk_SOURCE_DIR}/src/ANTS.cxx
  ${Ritk_SOURCE_DIR}/src/WarpTimeSeriesImageMultiTransform.cxx 
  # ants_compcorr
  ${Ritk_SOURCE_DIR}/src/Atropos.cxx 
  ${Ritk_SOURCE_DIR}/src/sccan.cxx )
target_link_libraries( Ritk ${RCPP_LIB_DIR} ${R_LIB_DIR} ${ITK_LIBRARIES} )
set_target_properties( Ritk PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE PREFIX "" )
install( TARGETS Ritk DESTINATION . )

# sources built to create individual libraries for developement
if( CMAKE_BUILD_TYPE STREQUAL Debug )
  add_library( antsRegistration MODULE 
    ${Ritk_SOURCE_DIR}/src/antsRegistration.cxx 
    ${Ritk_SOURCE_DIR}/src/antsCommandLineParser.cxx 
    ${Ritk_SOURCE_DIR}/src/antsCommandLineOption.cxx )
  target_link_libraries( antsRegistration ${RCPP_LIB_DIR} ${R_LIB_DIR} ${ITK_LIBRARIES} )
  set_target_properties( antsRegistration PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE PREFIX "" )

  add_library( ants_motion_estimation MODULE 
    ${Ritk_SOURCE_DIR}/src/antsMotionCorr.cxx 
    ${Ritk_SOURCE_DIR}/src/antsCommandLineParser.cxx 
    ${Ritk_SOURCE_DIR}/src/antsCommandLineOption.cxx )
  target_link_libraries( ants_motion_estimation ${RCPP_LIB_DIR} ${R_LIB_DIR} ${ITK_LIBRARIES} )
  set_target_properties( ants_motion_estimation PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE PREFIX "" )

  add_library( ants_brain_extraction MODULE 
    ${Ritk_SOURCE_DIR}/src/N3BiasFieldCorrection.cxx
    ${Ritk_SOURCE_DIR}/src/ThresholdImage.cxx 
    ${Ritk_SOURCE_DIR}/src/ImageMath.cxx
    ${Ritk_SOURCE_DIR}/src/antsCommandLineParser.cxx 
    ${Ritk_SOURCE_DIR}/src/antsCommandLineOption.cxx )
  target_link_libraries( ants_brain_extraction ${RCPP_LIB_DIR} ${R_LIB_DIR} ${ITK_LIBRARIES} )
  set_target_properties( ants_brain_extraction PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE PREFIX "" )

  add_library( ants_to_template MODULE 
    ${Ritk_SOURCE_DIR}/src/ANTS.cxx
    ${Ritk_SOURCE_DIR}/src/WarpTimeSeriesImageMultiTransform.cxx 
    ${Ritk_SOURCE_DIR}/src/antsCommandLineParser.cxx 
    ${Ritk_SOURCE_DIR}/src/antsCommandLineOption.cxx )
  target_link_libraries( ants_to_template ${RCPP_LIB_DIR} ${R_LIB_DIR} ${ITK_LIBRARIES} )
  set_target_properties( ants_to_template PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE PREFIX "" )

  add_library( ants_compcorr MODULE 
    ${Ritk_SOURCE_DIR}/src/N3BiasFieldCorrection.cxx
    ${Ritk_SOURCE_DIR}/src/ThresholdImage.cxx 
    ${Ritk_SOURCE_DIR}/src/ImageMath.cxx
    ${Ritk_SOURCE_DIR}/src/Atropos.cxx 
    ${Ritk_SOURCE_DIR}/src/sccan.cxx
    ${Ritk_SOURCE_DIR}/src/antsCommandLineParser.cxx 
    ${Ritk_SOURCE_DIR}/src/antsCommandLineOption.cxx )
  target_link_libraries( ants_compcorr ${RCPP_LIB_DIR} ${R_LIB_DIR} ${ITK_LIBRARIES} )
  set_target_properties( ants_compcorr PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE PREFIX "" )
endif( CMAKE_BUILD_TYPE STREQUAL Debug )