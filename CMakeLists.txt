cmake_minimum_required(VERSION 3.27)

project(cglm)

# remove "lib" prefix on unix systems
set(CMAKE_STATIC_LIBRARY_PREFIX "")

add_subdirectory(cglm cglm)

if (WIN32)
    set(OUTPUT_DIR "windows" CACHE STRING "")
elseif(APPLE)
    set(OUTPUT_DIR "macos" CACHE STRING "")
elseif(UNIX)
    set(OUTPUT_DIR "linux" CACHE STRING "")
endif ()

set_target_properties(cglm PROPERTIES ARCHIVE_OUTPUT_DIRECTORY $<LOWER_CASE:../../../libs/${OUTPUT_DIR}>) 
set_target_properties(cglm PROPERTIES OUTPUT_NAME_DEBUG "cglmd")
set_target_properties(cglm PROPERTIES OUTPUT_NAME_RELEASE "cglm")