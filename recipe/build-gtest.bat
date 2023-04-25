@echo on

mkdir build
cd build

cmake -GNinja ^
    %CMAKE_ARGS% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DCMAKE_CXX_STANDARD=17 ^
    -DBUILD_SHARED_LIBS=ON ^
    -DCMAKE_BUILD_TYPE=Release ^
    ..
if %ERRORLEVEL% neq 0 exit 1

cmake --build . --target install
if %ERRORLEVEL% neq 0 exit 1
