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
  ${Ritk_SOURCE_DIR}/src/sccan.cxx 
  # individual targets from ANTS
  ${Ritk_SOURCE_DIR}/src/antsApplyTransforms.cxx 
  ${Ritk_SOURCE_DIR}/src/ANTSIntegrateVectorField.cxx 
  ${Ritk_SOURCE_DIR}/src/ANTSIntegrateVelocityField.cxx 
  ${Ritk_SOURCE_DIR}/src/ANTSJacobian.cxx
  #  ${Ritk_SOURCE_DIR}/src/ANTSUseDeformationFieldToGetAffineTransform.cxx
  #  ${Ritk_SOURCE_DIR}/src/ANTSUseLandmarkImagesToGetAffineTransform.cxx
  ${Ritk_SOURCE_DIR}/src/AtroposMin.cxx
  ${Ritk_SOURCE_DIR}/src/AverageAffineTransform.cxx
  ${Ritk_SOURCE_DIR}/src/AverageImages.cxx
  ${Ritk_SOURCE_DIR}/src/AverageTensorImages.cxx
  ${Ritk_SOURCE_DIR}/src/ClusterImageStatistics.cxx
  ${Ritk_SOURCE_DIR}/src/ComposeMultiTransform.cxx
  ${Ritk_SOURCE_DIR}/src/ConvertImagePixelType.cxx
  ${Ritk_SOURCE_DIR}/src/ConvertScalarImageToRGB.cxx
  ${Ritk_SOURCE_DIR}/src/ConvertToJpg.cxx
  ${Ritk_SOURCE_DIR}/src/CopyImageHeaderInformation.cxx
  ${Ritk_SOURCE_DIR}/src/CreateDTICohort.cxx
  ${Ritk_SOURCE_DIR}/src/CreateImage.cxx
  ${Ritk_SOURCE_DIR}/src/CreateWarpedGridImage.cxx
  ${Ritk_SOURCE_DIR}/src/ExtractRegionFromImage.cxx
  ${Ritk_SOURCE_DIR}/src/ExtractRegionFromImageByMask.cxx
  ${Ritk_SOURCE_DIR}/src/ExtractSliceFromImage.cxx
  ${Ritk_SOURCE_DIR}/src/ImageCompare.cxx
  ${Ritk_SOURCE_DIR}/src/ImageSetStatistics.cxx
  ${Ritk_SOURCE_DIR}/src/KellyKapowski.cxx
  )
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

  add_library( antsApplyTransforms MODULE 
    ${Ritk_SOURCE_DIR}/src/antsApplyTransforms.cxx
    ${Ritk_SOURCE_DIR}/src/antsCommandLineParser.cxx 
    ${Ritk_SOURCE_DIR}/src/antsCommandLineOption.cxx )
  target_link_libraries( antsApplyTransforms ${RCPP_LIB_DIR} ${R_LIB_DIR} ${ITK_LIBRARIES} )
  set_target_properties( antsApplyTransforms PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE PREFIX "" )

  add_library( ANTSIntegrateVectorField MODULE 
    ${Ritk_SOURCE_DIR}/src/ANTSIntegrateVectorField.cxx
    ${Ritk_SOURCE_DIR}/src/antsCommandLineParser.cxx 
    ${Ritk_SOURCE_DIR}/src/antsCommandLineOption.cxx )
  target_link_libraries( ANTSIntegrateVectorField ${RCPP_LIB_DIR} ${R_LIB_DIR} ${ITK_LIBRARIES} )
  set_target_properties( ANTSIntegrateVectorField PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE PREFIX "" )

  add_library( ANTSIntegrateVelocityField MODULE 
    ${Ritk_SOURCE_DIR}/src/ANTSIntegrateVelocityField.cxx
    ${Ritk_SOURCE_DIR}/src/antsCommandLineParser.cxx 
    ${Ritk_SOURCE_DIR}/src/antsCommandLineOption.cxx )
  target_link_libraries( ANTSIntegrateVelocityField ${RCPP_LIB_DIR} ${R_LIB_DIR} ${ITK_LIBRARIES} )
  set_target_properties( ANTSIntegrateVelocityField PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE PREFIX "" )

  add_library( ANTSJacobian MODULE 
    ${Ritk_SOURCE_DIR}/src/ANTSJacobian.cxx
    ${Ritk_SOURCE_DIR}/src/antsCommandLineParser.cxx 
    ${Ritk_SOURCE_DIR}/src/antsCommandLineOption.cxx )
  target_link_libraries( ANTSJacobian ${RCPP_LIB_DIR} ${R_LIB_DIR} ${ITK_LIBRARIES} )
  set_target_properties( ANTSJacobian PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE PREFIX "" )

  #  add_library( ANTSUseDeformationFieldToGetAffineTransform MODULE 
  #    ${Ritk_SOURCE_DIR}/src/ANTSUseDeformationFieldToGetAffineTransform.cxx
  #    ${Ritk_SOURCE_DIR}/src/antsCommandLineParser.cxx 
  #    ${Ritk_SOURCE_DIR}/src/antsCommandLineOption.cxx )
  #  target_link_libraries( ANTSUseDeformationFieldToGetAffineTransform ${RCPP_LIB_DIR} ${R_LIB_DIR} ${ITK_LIBRARIES} )
  #  set_target_properties( ANTSUseDeformationFieldToGetAffineTransform PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE PREFIX "" )

  #  add_library( ANTSUseLandmarkImagesToGetAffineTransform MODULE 
  #    ${Ritk_SOURCE_DIR}/src/ANTSUseLandmarkImagesToGetAffineTransform.cxx
  #    ${Ritk_SOURCE_DIR}/src/antsCommandLineParser.cxx 
  #    ${Ritk_SOURCE_DIR}/src/antsCommandLineOption.cxx )
  #  target_link_libraries( ANTSUseLandmarkImagesToGetAffineTransform ${RCPP_LIB_DIR} ${R_LIB_DIR} ${ITK_LIBRARIES} )
  #  set_target_properties( ANTSUseLandmarkImagesToGetAffineTransform PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE PREFIX "" )

  add_library( AtroposMin MODULE 
    ${Ritk_SOURCE_DIR}/src/AtroposMin.cxx
    ${Ritk_SOURCE_DIR}/src/antsCommandLineParser.cxx 
    ${Ritk_SOURCE_DIR}/src/antsCommandLineOption.cxx )
  target_link_libraries( AtroposMin ${RCPP_LIB_DIR} ${R_LIB_DIR} ${ITK_LIBRARIES} )
  set_target_properties( AtroposMin PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE PREFIX "" )


  add_library( AverageAffineTransform MODULE 
    ${Ritk_SOURCE_DIR}/src/AverageAffineTransform.cxx
    ${Ritk_SOURCE_DIR}/src/antsCommandLineParser.cxx 
    ${Ritk_SOURCE_DIR}/src/antsCommandLineOption.cxx )
  target_link_libraries( AverageAffineTransform ${RCPP_LIB_DIR} ${R_LIB_DIR} ${ITK_LIBRARIES} )
  set_target_properties( AverageAffineTransform PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE PREFIX "" )

  add_library( AverageImages MODULE 
    ${Ritk_SOURCE_DIR}/src/AverageImages.cxx
    ${Ritk_SOURCE_DIR}/src/antsCommandLineParser.cxx 
    ${Ritk_SOURCE_DIR}/src/antsCommandLineOption.cxx )
  target_link_libraries( AverageImages ${RCPP_LIB_DIR} ${R_LIB_DIR} ${ITK_LIBRARIES} )
  set_target_properties( AverageImages PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE PREFIX "" )

  add_library( AverageTensorImages MODULE 
    ${Ritk_SOURCE_DIR}/src/AverageTensorImages.cxx
    ${Ritk_SOURCE_DIR}/src/antsCommandLineParser.cxx 
    ${Ritk_SOURCE_DIR}/src/antsCommandLineOption.cxx )
  target_link_libraries( AverageTensorImages ${RCPP_LIB_DIR} ${R_LIB_DIR} ${ITK_LIBRARIES} )
  set_target_properties( AverageTensorImages PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE PREFIX "" )

  add_library( ClusterImageStatistics MODULE 
    ${Ritk_SOURCE_DIR}/src/ClusterImageStatistics.cxx
    ${Ritk_SOURCE_DIR}/src/antsCommandLineParser.cxx 
    ${Ritk_SOURCE_DIR}/src/antsCommandLineOption.cxx )
  target_link_libraries( ClusterImageStatistics ${RCPP_LIB_DIR} ${R_LIB_DIR} ${ITK_LIBRARIES} )
  set_target_properties( ClusterImageStatistics PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE PREFIX "" )

  add_library( ComposeMultiTransform MODULE 
    ${Ritk_SOURCE_DIR}/src/ComposeMultiTransform.cxx
    ${Ritk_SOURCE_DIR}/src/antsCommandLineParser.cxx 
    ${Ritk_SOURCE_DIR}/src/antsCommandLineOption.cxx )
  target_link_libraries( ComposeMultiTransform ${RCPP_LIB_DIR} ${R_LIB_DIR} ${ITK_LIBRARIES} )
  set_target_properties( ComposeMultiTransform PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE PREFIX "" )

  add_library( ConvertImagePixelType MODULE 
    ${Ritk_SOURCE_DIR}/src/ConvertImagePixelType.cxx
    ${Ritk_SOURCE_DIR}/src/antsCommandLineParser.cxx 
    ${Ritk_SOURCE_DIR}/src/antsCommandLineOption.cxx )
  target_link_libraries( ConvertImagePixelType ${RCPP_LIB_DIR} ${R_LIB_DIR} ${ITK_LIBRARIES} )
  set_target_properties( ConvertImagePixelType PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE PREFIX "" )

  add_library( ConvertScalarImageToRGB MODULE 
    ${Ritk_SOURCE_DIR}/src/ConvertScalarImageToRGB.cxx
    ${Ritk_SOURCE_DIR}/src/antsCommandLineParser.cxx 
    ${Ritk_SOURCE_DIR}/src/antsCommandLineOption.cxx )
  target_link_libraries( ConvertScalarImageToRGB ${RCPP_LIB_DIR} ${R_LIB_DIR} ${ITK_LIBRARIES} )
  set_target_properties( ConvertScalarImageToRGB PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE PREFIX "" )

  add_library( ConvertToJpg MODULE 
    ${Ritk_SOURCE_DIR}/src/ConvertToJpg.cxx
    ${Ritk_SOURCE_DIR}/src/antsCommandLineParser.cxx 
    ${Ritk_SOURCE_DIR}/src/antsCommandLineOption.cxx )
  target_link_libraries( ConvertToJpg ${RCPP_LIB_DIR} ${R_LIB_DIR} ${ITK_LIBRARIES} )
  set_target_properties( ConvertToJpg PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE PREFIX "" )

  add_library( CopyImageHeaderInformation MODULE 
    ${Ritk_SOURCE_DIR}/src/CopyImageHeaderInformation.cxx
    ${Ritk_SOURCE_DIR}/src/antsCommandLineParser.cxx 
    ${Ritk_SOURCE_DIR}/src/antsCommandLineOption.cxx )
  target_link_libraries( CopyImageHeaderInformation ${RCPP_LIB_DIR} ${R_LIB_DIR} ${ITK_LIBRARIES} )
  set_target_properties( CopyImageHeaderInformation PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE PREFIX "" )

  add_library( CreateDTICohort MODULE 
    ${Ritk_SOURCE_DIR}/src/CreateDTICohort.cxx
    ${Ritk_SOURCE_DIR}/src/antsCommandLineParser.cxx 
    ${Ritk_SOURCE_DIR}/src/antsCommandLineOption.cxx )
  target_link_libraries( CreateDTICohort ${RCPP_LIB_DIR} ${R_LIB_DIR} ${ITK_LIBRARIES} )
  set_target_properties( CreateDTICohort PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE PREFIX "" )

  add_library( CreateImage MODULE 
    ${Ritk_SOURCE_DIR}/src/CreateImage.cxx
    ${Ritk_SOURCE_DIR}/src/antsCommandLineParser.cxx 
    ${Ritk_SOURCE_DIR}/src/antsCommandLineOption.cxx )
  target_link_libraries( CreateImage ${RCPP_LIB_DIR} ${R_LIB_DIR} ${ITK_LIBRARIES} )
  set_target_properties( CreateImage PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE PREFIX "" )

  add_library( CreateWarpedGridImage MODULE 
    ${Ritk_SOURCE_DIR}/src/CreateWarpedGridImage.cxx
    ${Ritk_SOURCE_DIR}/src/antsCommandLineParser.cxx 
    ${Ritk_SOURCE_DIR}/src/antsCommandLineOption.cxx )
  target_link_libraries( CreateWarpedGridImage ${RCPP_LIB_DIR} ${R_LIB_DIR} ${ITK_LIBRARIES} )
  set_target_properties( CreateWarpedGridImage PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE PREFIX "" )

  add_library( ExtractRegionFromImage MODULE 
    ${Ritk_SOURCE_DIR}/src/ExtractRegionFromImage.cxx
    ${Ritk_SOURCE_DIR}/src/antsCommandLineParser.cxx 
    ${Ritk_SOURCE_DIR}/src/antsCommandLineOption.cxx )
  target_link_libraries( ExtractRegionFromImage ${RCPP_LIB_DIR} ${R_LIB_DIR} ${ITK_LIBRARIES} )
  set_target_properties( ExtractRegionFromImage PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE PREFIX "" )

  add_library( ExtractRegionFromImageByMask MODULE 
    ${Ritk_SOURCE_DIR}/src/ExtractRegionFromImageByMask.cxx
    ${Ritk_SOURCE_DIR}/src/antsCommandLineParser.cxx 
    ${Ritk_SOURCE_DIR}/src/antsCommandLineOption.cxx )
  target_link_libraries( ExtractRegionFromImageByMask ${RCPP_LIB_DIR} ${R_LIB_DIR} ${ITK_LIBRARIES} )
  set_target_properties( ExtractRegionFromImageByMask PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE PREFIX "" )

  add_library( ExtractSliceFromImage MODULE 
    ${Ritk_SOURCE_DIR}/src/ExtractSliceFromImage.cxx
    ${Ritk_SOURCE_DIR}/src/antsCommandLineParser.cxx 
    ${Ritk_SOURCE_DIR}/src/antsCommandLineOption.cxx )
  target_link_libraries( ExtractSliceFromImage ${RCPP_LIB_DIR} ${R_LIB_DIR} ${ITK_LIBRARIES} )
  set_target_properties( ExtractSliceFromImage PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE PREFIX "" )

  add_library( ImageCompare MODULE 
    ${Ritk_SOURCE_DIR}/src/ImageCompare.cxx
    ${Ritk_SOURCE_DIR}/src/antsCommandLineParser.cxx 
    ${Ritk_SOURCE_DIR}/src/antsCommandLineOption.cxx )
  target_link_libraries( ImageCompare ${RCPP_LIB_DIR} ${R_LIB_DIR} ${ITK_LIBRARIES} )
  set_target_properties( ImageCompare PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE PREFIX "" )

  add_library( ImageSetStatistics MODULE 
    ${Ritk_SOURCE_DIR}/src/ImageSetStatistics.cxx
    ${Ritk_SOURCE_DIR}/src/antsCommandLineParser.cxx 
    ${Ritk_SOURCE_DIR}/src/antsCommandLineOption.cxx )
  target_link_libraries( ImageSetStatistics ${RCPP_LIB_DIR} ${R_LIB_DIR} ${ITK_LIBRARIES} )
  set_target_properties( ImageSetStatistics PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE PREFIX "" )

  add_library( KellyKapowski MODULE 
    ${Ritk_SOURCE_DIR}/src/KellyKapowski.cxx
    ${Ritk_SOURCE_DIR}/src/antsCommandLineParser.cxx 
    ${Ritk_SOURCE_DIR}/src/antsCommandLineOption.cxx )
  target_link_libraries( KellyKapowski ${RCPP_LIB_DIR} ${R_LIB_DIR} ${ITK_LIBRARIES} )
  set_target_properties( KellyKapowski PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE PREFIX "" )
endif( CMAKE_BUILD_TYPE STREQUAL Debug )