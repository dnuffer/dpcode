cmake_minimum_required(VERSION 2.6)
project(singly_linked_list)

add_definitions(-std=c++11)

find_package(Boost 1.48 COMPONENTS unit_test_framework REQUIRED)
include_directories(${Boost_INCLUDE_DIR})
link_directories(${Boost_LIBRARY_DIR})


add_executable(test_singly_linked_list test_singly_linked_list.cpp)
target_link_libraries(test_singly_linked_list ${Boost_LIBRARIES})

enable_testing()
add_test(test_singly_linked_list test_singly_linked_list)
add_custom_target(check COMMAND ${CMAKE_CTEST_COMMAND})
