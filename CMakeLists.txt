cmake_minimum_required(VERSION 3.10)
project(VeryImportantProject)

# C++ 표준 설정
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 소스 파일 자동 검색
file(GLOB SOURCE_FILES "3.6/*.cpp")

# 다양한 빌드 구성 설정
# Debug 빌드
add_executable(${PROJECT_NAME}_Debug ${SOURCE_FILES})
set_target_properties(${PROJECT_NAME}_Debug PROPERTIES 
    OUTPUT_NAME "${PROJECT_NAME}_x64Debug"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/x64Debug"
    COMPILE_FLAGS "-g")

# Release 빌드
add_executable(${PROJECT_NAME}_Release ${SOURCE_FILES})
set_target_properties(${PROJECT_NAME}_Release PROPERTIES 
    OUTPUT_NAME "${PROJECT_NAME}_x64Release"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/x64Release"
    COMPILE_FLAGS "-O3")

    # 64비트 멀티스레드 Debug 빌드
add_executable(${PROJECT_NAME}_x64DebugMT ${SOURCE_FILES})
set_target_properties(${PROJECT_NAME}_x64DebugMT PROPERTIES 
    OUTPUT_NAME "${PROJECT_NAME}"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/x64DebugMT"
    COMPILE_FLAGS "-m64 -g -pthread")

# 64비트 멀티스레드 Release 빌드
add_executable(${PROJECT_NAME}_x64ReleaseMT ${SOURCE_FILES})
set_target_properties(${PROJECT_NAME}_x64ReleaseMT PROPERTIES 
    OUTPUT_NAME "${PROJECT_NAME}"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/x64ReleaseMT"
    COMPILE_FLAGS "-m64 -O3 -pthread")

# 32비트 Debug 빌드
add_executable(${PROJECT_NAME}_Win32Debug ${SOURCE_FILES})
set_target_properties(${PROJECT_NAME}_Win32Debug PROPERTIES 
    OUTPUT_NAME "${PROJECT_NAME}"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/Win32Debug"
    COMPILE_FLAGS "-m32 -g")

# 32비트 Release 빌드
add_executable(${PROJECT_NAME}_Win32Release ${SOURCE_FILES})
set_target_properties(${PROJECT_NAME}_Win32Release PROPERTIES 
    OUTPUT_NAME "${PROJECT_NAME}"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/Win32Release"
    COMPILE_FLAGS "-m32 -O3")

# 32비트 멀티스레드 Debug 빌드
add_executable(${PROJECT_NAME}_Win32DebugMT ${SOURCE_FILES})
set_target_properties(${PROJECT_NAME}_Win32DebugMT PROPERTIES 
    OUTPUT_NAME "${PROJECT_NAME}"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/Win32DebugMT"
    COMPILE_FLAGS "-m32 -g -pthread")

# 32비트 멀티스레드 Release 빌드
add_executable(${PROJECT_NAME}_Win32ReleaseMT ${SOURCE_FILES})
set_target_properties(${PROJECT_NAME}_Win32ReleaseMT PROPERTIES 
    OUTPUT_NAME "${PROJECT_NAME}"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/Win32ReleaseMT"
    COMPILE_FLAGS "-m32 -O3 -pthread")

# 라이브러리 타겟 추가
add_library(VeryImportantlib STATIC 
    3.6/Calculator.cpp
    3.6/Utils.cpp
)

# 라이브러리 속성 설정
set_target_properties(VeryImportantlib PROPERTIES
    OUTPUT_NAME "VeryImportantlib"
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")

# 실행 파일이 라이브러리를 사용하도록 링크
target_link_libraries(${PROJECT_NAME}_Debug VeryImportantlib)
target_link_libraries(${PROJECT_NAME}_Release VeryImportantlib)
target_link_libraries(${PROJECT_NAME}_x64DebugMT VeryImportantlib)
target_link_libraries(${PROJECT_NAME}_x64ReleaseMT VeryImportantlib)
target_link_libraries(${PROJECT_NAME}_Win32Debug VeryImportantlib)
target_link_libraries(${PROJECT_NAME}_Win32Release VeryImportantlib)
target_link_libraries(${PROJECT_NAME}_Win32DebugMT VeryImportantlib)
target_link_libraries(${PROJECT_NAME}_Win32ReleaseMT VeryImportantlib)