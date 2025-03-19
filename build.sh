#!/bin/bash

# 디버깅 활성화
set -x

# 이전 빌드 제거
rm -rf build
mkdir -p build
cd build

# CMake 구성 - Debug 빌드
cmake .. -DCMAKE_BUILD_TYPE=Debug

# Debug 타겟 빌드
cmake --build . --target VeryImportantProject_Debug --verbose

# 라이브러리 파일 확인
echo "Debug 라이브러리 파일 확인:"
ls -lh lib/

# CMake 재구성 - Release 빌드
cmake .. -DCMAKE_BUILD_TYPE=Release

# Release 타겟 빌드
cmake --build . --target VeryImportantProject_Release --verbose

# 파일 크기 확인
echo "빌드된 파일 크기 확인:"
ls -lh Debug/VeryImportantProject_x64Debug
ls -lh Release/VeryImportantProject_x64Release

# 파일 정보 확인
echo "빌드된 파일 정보:"
file x64Debug/VeryImportantProject_x64Debug
file x64DebugMT/VeryImportantProject_x64DebugMT
file x64Release/VeryImportantProject_x64Release
file x64ReleaseMT/VeryImportantProject_x64ReleaseMT

# 라이브러리 파일 정보
echo "라이브러리 파일 정보:"
file lib/libVeryImportantlib.a

echo "모든 빌드가 완료되었습니다." 