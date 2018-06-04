set GTEST_DIR=%SRC_DIR%\googletest

REM Copy headers
xcopy /S %GTEST_DIR%\include %LIBRARY_INC%

cd %GTEST_DIR%

REM Build and copy static libraries (Release)
mkdir build_static_mt
cd build_static_mt
cmake -G "%CMAKE_GENERATOR%" -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" %GTEST_DIR%
cmake --build . --target ALL_BUILD --config Release
copy Release\gtest.lib %LIBRARY_LIB%
copy Release\gtest_main.lib %LIBRARY_LIB%
if errorlevel 1 exit 1
cd %GTEST_DIR%

REM Build and copy static libraries (Debug)
mkdir build_static_mtd
cd build_static_mtd
cmake -G "%CMAKE_GENERATOR%" -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" %GTEST_DIR%
cmake --build . --target ALL_BUILD --config Debug
copy Debug\gtest.lib %LIBRARY_LIB%\gtestd.lib
copy Debug\gtest_main.lib %LIBRARY_LIB%\gtest_maind.lib
if errorlevel 1 exit 1
cd %GTEST_DIR%

REM Build and copy static libraries with shared run-time library (Release)
mkdir build_static_md
cd build_static_md
cmake -G "%CMAKE_GENERATOR%" -D gtest_force_shared_crt=ON -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" %GTEST_DIR%
cmake --build . --target ALL_BUILD --config Release
copy Release\gtest.lib %LIBRARY_LIB%\gtest-md.lib
copy Release\gtest_main.lib %LIBRARY_LIB%\gtest_main-md.lib
if errorlevel 1 exit 1
cd %GTEST_DIR%

REM Build and copy static libraries with shared run-time library (Debug)
mkdir build_static_mdd
cd build_static_mdd
cmake -G "%CMAKE_GENERATOR%" -D gtest_force_shared_crt=ON -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" %GTEST_DIR%
cmake --build . --target ALL_BUILD --config Debug
copy Debug\gtest.lib %LIBRARY_LIB%\gtest-mdd.lib
copy Debug\gtest_main.lib %LIBRARY_LIB%\gtest_main-mdd.lib
if errorlevel 1 exit 1
cd %GTEST_DIR%

REM Build and copy dynamic libraries (Release)
mkdir build_dynamic_mt
cd build_dynamic_mt
cmake -G "%CMAKE_GENERATOR%" -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -D gtest_build_tests=ON -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" %GTEST_DIR%
cmake --build . --target gtest_dll --config Release
copy Release\gtest_dll.dll %LIBRARY_BIN%
copy Release\gtest_dll.lib %LIBRARY_LIB%
if errorlevel 1 exit 1
cd %GTEST_DIR%

REM Build and copy dynamic libraries (Debug)
mkdir build_dynamic_mtd
cd build_dynamic_mtd
cmake -G "%CMAKE_GENERATOR%" -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -D gtest_build_tests=ON -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" %GTEST_DIR%
cmake --build . --target gtest_dll --config Debug
copy Debug\gtest_dll.dll %LIBRARY_BIN%\gtest_dlld.dll
copy Debug\gtest_dll.lib %LIBRARY_LIB%\gtest_dlld.lib
if errorlevel 1 exit 1
cd %GTEST_DIR%

REM Build and copy dynamic libraries with shared run-time library (Release)
mkdir build_dynamic_md
cd build_dynamic_md
cmake -G "%CMAKE_GENERATOR%" -D gtest_force_shared_crt=ON -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -D gtest_build_tests=ON -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" %GTEST_DIR%
cmake --build . --target gtest_dll --config Release
copy Release\gtest_dll.dll %LIBRARY_BIN%\gtest_dll-md.dll
copy Release\gtest_dll.lib %LIBRARY_LIB%\gtest_dll-md.lib
if errorlevel 1 exit 1
cd %GTEST_DIR%

REM Build and copy dynamic libraries with shared run-time library (Debug)
mkdir build_dynamic_mdd
cd build_dynamic_mdd
cmake -G "%CMAKE_GENERATOR%" -D gtest_force_shared_crt=ON -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -D gtest_build_tests=ON -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" %GTEST_DIR%
cmake --build . --target gtest_dll --config Debug
copy Debug\gtest_dll.dll %LIBRARY_BIN%\gtest_dll-mdd.dll
copy Debug\gtest_dll.lib %LIBRARY_LIB%\gtest_dll-mdd.lib
if errorlevel 1 exit 1
cd %GTEST_DIR%

