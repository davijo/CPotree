cmake_minimum_required(VERSION 3.0.0 FATAL_ERROR)

set(PROJECT_NAME CPotree)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_library(stdc++fs UNKNOWN IMPORTED)
set_property(TARGET stdc++fs PROPERTY IMPORTED_LOCATION "/usr/lib/gcc/x86_64-linux-gnu/7/libstdc++fs.a")

include_directories(include libs/rapidjson/include libs/glm)

set(SOURCES
  src/pmath.cpp
  src/PotreeReader.cpp
  )

add_executable(extract src/main_extract_region.cpp ${SOURCES})
add_executable(profile src/main_elevation_profile.cpp ${SOURCES})
target_link_libraries(extract stdc++fs)
target_link_libraries(profile stdc++fs)
