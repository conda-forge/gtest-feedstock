set GTEST_DIR=%SRC_DIR%\googletest

REM Copy headers
xcopy /S %GTEST_DIR%\include %LIBRARY_INC%

cd %GTEST_DIR%

REM Build and copy static libraries (Release)
mkdir build_static_mt
cd build_static_mt
cmake -G "NMake Makefiles" -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -D CMAKE_BUILD_TYPE=Release %GTEST_DIR%
nmake
copy gtest.lib %LIBRARY_BIN%
copy gtest_main.lib %LIBRARY_BIN%
if errorlevel 1 exit 1
cd %GTEST_DIR%

REM Build and copy static libraries (Debug)
mkdir build_static_mtd
cd build_static_mtd
cmake -G "NMake Makefiles" -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -D CMAKE_BUILD_TYPE=Debug %GTEST_DIR%
nmake
copy gtestd.lib %LIBRARY_BIN%
copy gtest_maind.lib %LIBRARY_BIN%
if errorlevel 1 exit 1
cd %GTEST_DIR%

REM Build and copy static libraries with shared run-time library (Release)
mkdir build_static_md
cd build_static_md
cmake -G "NMake Makefiles" -D gtest_force_shared_crt=ON -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -D CMAKE_BUILD_TYPE=Release %GTEST_DIR%
nmake
copy gtest.lib %LIBRARY_BIN%\gtest-md.lib
copy gtest_main.lib %LIBRARY_BIN%\gtest_main-md.lib
if errorlevel 1 exit 1
cd %GTEST_DIR%

REM Build and copy static libraries with shared run-time library (Debug)
mkdir build_static_mdd
cd build_static_mdd
cmake -G "NMake Makefiles" -D gtest_force_shared_crt=ON -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -D CMAKE_BUILD_TYPE=Debug %GTEST_DIR%
nmake
copy gtestd.lib %LIBRARY_BIN%\gtest-mdd.lib
copy gtest_maind.lib %LIBRARY_BIN%\gtest_main-mdd.lib
if errorlevel 1 exit 1
cd %GTEST_DIR%

REM Build and copy dynamic libraries (Release)
mkdir build_dynamic_mt
cd build_dynamic_mt
cmake -G "NMake Makefiles" -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -D CMAKE_BUILD_TYPE=Release -D gtest_build_tests=ON %GTEST_DIR%
nmake gtest_dll
copy gtest_dll.dll %LIBRARY_BIN%
copy gtest_dll.lib %LIBRARY_BIN%
if errorlevel 1 exit 1
cd %GTEST_DIR%

REM Build and copy dynamic libraries (Debug)
mkdir build_dynamic_mtd
cd build_dynamic_mtd
cmake -G "NMake Makefiles" -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -D CMAKE_BUILD_TYPE=Debug -D gtest_build_tests=ON %GTEST_DIR%
nmake gtest_dlld
copy gtest_dlld.dll %LIBRARY_BIN%
copy gtest_dlld.lib %LIBRARY_BIN%
if errorlevel 1 exit 1
cd %GTEST_DIR%

REM Build and copy dynamic libraries with shared run-time library (Release)
mkdir build_dynamic_md
cd build_dynamic_md
cmake -G "NMake Makefiles" -D gtest_force_shared_crt=ON -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -D CMAKE_BUILD_TYPE=Release -D gtest_build_tests=ON %GTEST_DIR%
nmake gtest_dll
copy gtest_dll.dll %LIBRARY_BIN%\gtest_dll-md.dll
copy gtest_dll.lib %LIBRARY_BIN%\gtest_dll-md.lib
if errorlevel 1 exit 1
cd %GTEST_DIR%

REM Build and copy dynamic libraries with shared run-time library (Debug)
mkdir build_dynamic_mdd
cd build_dynamic_mdd
cmake -G "NMake Makefiles" -D gtest_force_shared_crt=ON -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -D CMAKE_BUILD_TYPE=Debug -D gtest_build_tests=ON %GTEST_DIR%
nmake gtest_dll
copy gtest_dlld.dll %LIBRARY_BIN%\gtest_dll-mdd.dll
copy gtest_dlld.lib %LIBRARY_BIN%\gtest_dll-mdd.lib
if errorlevel 1 exit 1
cd %GTEST_DIR%
