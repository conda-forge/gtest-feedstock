set GTEST_DIR=%SRC_DIR%\googletest

REM Copy headers
xcopy /S %GTEST_DIR%\include %LIBRARY_INC%

REM Build and copy static libraries
mkdir build_static_mt
cd build_static_mt
cmake -G "NMake Makefiles" -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -D CMAKE_BUILD_TYPE=Release %GTEST_DIR%
nmake
copy gtest.lib %LIBRARY_BIN%
copy gtest_main.lib %LIBRARY_BIN%
if errorlevel 1 exit 1
cd %GTEST_DIR%

REM Build and copy static libraries with shared run-time library
mkdir build_static_md
cd build_static_md
cmake -G "NMake Makefiles" -D gtest_force_shared_crt=ON -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -D CMAKE_BUILD_TYPE=Release %GTEST_DIR%
nmake
copy gtest.lib %LIBRARY_BIN%\gtest_md.lib
copy gtest_main.lib %LIBRARY_BIN%\gtest_main_md.lib
if errorlevel 1 exit 1
cd %GTEST_DIR%

REM Build and copy dynamic libraries
mkdir build_dynamic_mt
cd build_dynamic_mt

cmake -G "NMake Makefiles" -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -D CMAKE_BUILD_TYPE=Release -D gtest_build_tests=ON %GTEST_DIR%
nmake gtest_dll
copy gtest_dll.dll %LIBRARY_BIN%
copy gtest_dll.lib %LIBRARY_BIN%
if errorlevel 1 exit 1
cd %GTEST_DIR%

REM Build and copy dynamic libraries with shared run-time library
mkdir build_dynamic_md
cd build_dynamic_md

cmake -G "NMake Makefiles" -D gtest_force_shared_crt=ON -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -D CMAKE_BUILD_TYPE=Release -D gtest_build_tests=ON %GTEST_DIR%
nmake gtest_dll
copy gtest_dll.dll %LIBRARY_BIN%\gtest_dll_md.dll
copy gtest_dll.lib %LIBRARY_BIN%\gtest_dll_md.lib
if errorlevel 1 exit 1
cd %GTEST_DIR%
