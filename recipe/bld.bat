set GTEST_DIR=%SRC_DIR%

REM Copy headers
xcopy /S %GTEST_DIR%\googletest\include %LIBRARY_INC%
xcopy /S %GTEST_DIR%\googlemock\include %LIBRARY_INC%
set GMOCK_DIR=googlemock

cd %GTEST_DIR%

REM Build and copy static libraries (Release)
mkdir build_static_mt
cd build_static_mt
cmake -G "%CMAKE_GENERATOR%" -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" %GTEST_DIR%
cmake --build . --target ALL_BUILD --config Release
copy googlemock\gtest\Release\gtest.lib %LIBRARY_LIB%
copy googlemock\gtest\Release\gtest_main.lib %LIBRARY_LIB%
copy googlemock\Release\gmock.lib %LIBRARY_LIB%
copy googlemock\Release\gmock_main.lib %LIBRARY_LIB%
if errorlevel 1 exit 1
cd %GTEST_DIR%

REM Build and copy static libraries (Debug)
mkdir build_static_mtd
cd build_static_mtd
cmake -G "%CMAKE_GENERATOR%" -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" %GTEST_DIR%
cmake --build . --target ALL_BUILD --config Debug
copy googlemock\gtest\Debug\gtestd.lib %LIBRARY_LIB%\gtestd.lib
copy googlemock\gtest\Debug\gtest_maind.lib %LIBRARY_LIB%\gtest_maind.lib
copy googlemock\Debug\gmockd.lib %LIBRARY_LIB%\gmockd.lib
copy googlemock\Debug\gmock_maind.lib %LIBRARY_LIB%\gmock_maind.lib
if errorlevel 1 exit 1
cd %GTEST_DIR%

REM Build and copy static libraries with shared run-time library (Release)
mkdir build_static_md
cd build_static_md
cmake -G "%CMAKE_GENERATOR%" -D gtest_force_shared_crt=ON -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" %GTEST_DIR%
cmake --build . --target ALL_BUILD --config Release
copy googlemock\gtest\Release\gtest.lib %LIBRARY_LIB%\gtest-md.lib
copy googlemock\gtest\Release\gtest_main.lib %LIBRARY_LIB%\gtest_main-md.lib
copy googlemock\Release\gmock.lib %LIBRARY_LIB%\gmock-md.lib
copy googlemock\Release\gmock_main.lib %LIBRARY_LIB%\gmock_main-md.lib
if errorlevel 1 exit 1
cd %GTEST_DIR%

REM Build and copy static libraries with shared run-time library (Debug)
mkdir build_static_mdd
cd build_static_mdd
cmake -G "%CMAKE_GENERATOR%" -D gtest_force_shared_crt=ON -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" %GTEST_DIR%
cmake --build . --target ALL_BUILD --config Debug
copy googlemock\gtest\Debug\gtestd.lib %LIBRARY_LIB%\gtest-mdd.lib
copy googlemock\gtest\Debug\gtest_maind.lib %LIBRARY_LIB%\gtest_main-mdd.lib
copy googlemock\Debug\gmockd.lib %LIBRARY_LIB%\gmock-mdd.lib
copy googlemock\Debug\gmock_maind.lib %LIBRARY_LIB%\gmock_main-mdd.lib
if errorlevel 1 exit 1
cd %GTEST_DIR%

REM Build and copy dynamic libraries (Release)
mkdir build_dynamic_mt
cd build_dynamic_mt
cmake -G "%CMAKE_GENERATOR%" -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -D gtest_build_tests=ON -DBUILD_SHARED_LIBS=ON -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" %GTEST_DIR%
cmake --build . --target ALL_BUILD --config Release
copy googlemock\gtest\Release\gtest_dll.dll %LIBRARY_BIN%
copy googlemock\gtest\Release\gtest_dll.lib %LIBRARY_LIB%
copy googlemock\Release\gmock.dll %LIBRARY_BIN%
copy googlemock\Release\gmock.lib %LIBRARY_LIB%
if errorlevel 1 exit 1
cd %GTEST_DIR%

REM Build and copy dynamic libraries (Debug)
mkdir build_dynamic_mtd
cd build_dynamic_mtd
cmake -G "%CMAKE_GENERATOR%" -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -D gtest_build_tests=ON -DBUILD_SHARED_LIBS=ON -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" %GTEST_DIR%
cmake --build . --target ALL_BUILD --config Debug
tree /f
copy googlemock\gtest\Debug\googletest\gtest_dlld.dll %LIBRARY_BIN%\gtest_dlld.dll
copy googlemock\gtest\Debug\gtest_dlld.lib %LIBRARY_LIB%\gtest_dlld.lib
copy googlemock\Debug\gmock_dlld.dll %LIBRARY_BIN%\gmock_dlld.dll
copy googlemock\Debug\gmock_dlld.lib %LIBRARY_LIB%\gmock_dlld.lib
if errorlevel 1 exit 1
cd %GTEST_DIR%

REM Build and copy dynamic libraries with shared run-time library (Release)
mkdir build_dynamic_md
cd build_dynamic_md
cmake -G "%CMAKE_GENERATOR%" -D gtest_force_shared_crt=ON -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -D gtest_build_tests=ON -DBUILD_SHARED_LIBS=ON  -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" %GTEST_DIR%
cmake --build . --target ALL_BUILD --config Release
tree /f
copy googlemock\gtest\Release\gtest_dll.dll %LIBRARY_BIN%\gtest_dll-md.dll
copy googlemock\gtest\Release\gtest_dll.lib %LIBRARY_LIB%\gtest_dll-md.lib
copy googlemock\Release\gmock.dll %LIBRARY_BIN%\gmock_dll-md.dll
copy googlemock\Release\gmock.lib %LIBRARY_LIB%\gmock_dll-md.lib
if errorlevel 1 exit 1
cd %GTEST_DIR%

REM Build and copy dynamic libraries with shared run-time library (Debug)
mkdir build_dynamic_mdd
cd build_dynamic_mdd
cmake -G "%CMAKE_GENERATOR%" -D gtest_force_shared_crt=ON -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% -D gtest_build_tests=ON -DBUILD_SHARED_LIBS=ON  -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" %GTEST_DIR%
cmake --build . --target ALL_BUILD --config Debug
tree /f
copy googlemock\gtest\Debug\googletest\gtest_dlld.dll %LIBRARY_BIN%\gtest_dll-mdd.dll
copy googlemock\gtest\Debug\googletest\gtest_dlld.lib %LIBRARY_LIB%\gtest_dll-mdd.lib
copy googlemock\Debug\googlemock\gmock_dlld.dll %LIBRARY_BIN%\gmock_dll-mdd.dll
copy googlemock\Debug\googlemock\gmock_dlld.lib %LIBRARY_LIB%\gmock_dll-mdd.lib
if errorlevel 0 exit 1
cd %GTEST_DIR%

