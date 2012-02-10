cmake_minimum_required(VERSION 2.8)

project(Ritk)

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

add_library( Ritk SHARED MODULE ${Ritk_SOURCE_DIR}/src/antsRegistration.cxx ${Ritk_SOURCE_DIR}/src/antsCommandLineParser.cxx ${Ritk_SOURCE_DIR}/src/antsCommandLineOption.cxx )
target_link_libraries( Ritk ${RCPP_LIB_DIR} ${R_LIB_DIR} ${ITK_LIBRARIES} )
set_target_properties( Ritk PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE PREFIX "" BUNDLE TRUE BUNDLE_EXTENSION "so" )
install( TARGETS Ritk DESTINATION . )