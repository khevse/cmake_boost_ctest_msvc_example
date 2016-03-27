cmake_minimum_required (VERSION 3.5)

set (CMAKE_VERBOSE_MAKEFILE ON)
set(SYSTEM WIN32)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall")

#-----------------------------------------------------------------
# Main project
#-----------------------------------------------------------------

set( PROJECT my_lib )
project ( ${PROJECT} )

message ("cxx Flags: " ${CMAKE_CXX_FLAGS})
message ("PROJECT_BINARY_DIR: " ${PROJECT_BINARY_DIR})

include_directories(.)
add_library(${PROJECT} STATIC lib.cpp)

#-----------------------------------------------------------------
# Test project
#-----------------------------------------------------------------

# About parameters: https://cmake.org/cmake/help/v3.0/module/FindBoost.html

set(BOOST_ROOT                C:/boost_1_60_0)
set(BOOST_LIBRARYDIR          $ENV{BOOST_ROOT}/stage/lib)
set(Boost_USE_STATIC_LIBS     ON) # only find static libs
set(Boost_USE_MULTITHREADED   ON)
set(Boost_USE_STATIC_RUNTIME  OFF)
set(Boost_NO_SYSTEM_PATHS     ON)
set(Boost_DEBUG               ON)

find_package(Boost 1.60.0 COMPONENTS unit_test_framework REQUIRED)
if(Boost_FOUND)
    include_directories(
                        .
                        ${Boost_INCLUDE_DIRS})

    set (TESTS_SOURCES test.cpp)
    set (TEST test_${PROJECT})
    add_executable (${TEST} ${TESTS_SOURCES})
    target_link_libraries (${TEST} ${PROJECT} ${Boost_LIBRARIES})

    # Turn on CMake testing capabilities
    enable_testing()

    # Add test cases
    add_test (${TEST} ${TEST})

endif(Boost_FOUND)