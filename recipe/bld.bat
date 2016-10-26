REM Copy headers
xcopy /S %SRC_DIR%\include %LIBRARY_INC%

REM Build and copy static libraries
mkdir build_static
cd build_static
cmake -G "NMake Makefiles" -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -D CMAKE_BUILD_TYPE=Release %SRC_DIR%
nmake
copy gtest.lib %LIBRARY_BIN%
copy gtest_main.lib %LIBRARY_BIN%
cd %SRC_DIR%

REM Build and copy dynamic libraries
mkdir build_dynamic

cmake -G "NMake Makefiles" -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -D CMAKE_BUILD_TYPE=Release -D gtest_build_tests=ON %SRC_DIR%
nmake gtest_dll
copy gtest_dll.dll %LIBRARY_BIN%
copy gtest_dll.lib %LIBRARY_BIN%
cd %SRC_DIR%
