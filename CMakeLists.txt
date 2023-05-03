cmake_minimum_required(VERSION 3.12)
project(Firmware LANGUAGES CSharp)
set(CMAKE_DOTNET_TARGET_FRAMEWORK_VERSION "4.5.2")
set(CMAKE_CSharp_FLAGS "/langversion:7")

# Create shared library and add all .cs files in the folder
add_library(Firmware SHARED
    ${CMAKE_CURRENT_SOURCE_DIR}/App.config
    ${CMAKE_CURRENT_SOURCE_DIR}/Firmware.cs
    ${CMAKE_CURRENT_SOURCE_DIR}/CommandType.cs
    # Add any additional .cs files here
)

add_subdirectory(Tests)
add_dependencies(Firmware Hardware)

include(CTest)
include(ExternalProject)

ExternalProject_Add(Hardware
            PREFIX ${CMAKE_BINARY_DIR}
            GIT_REPOSITORY "https://github.com/dantmw/3DPrinterSIMHardware.git"
            PATCH_COMMAND ""
            BINARY_DIR ${CMAKE_BINARY_DIR}/Hardware
            SOURCE_DIR ${CMAKE_BINARY_DIR}/Hardware
            INSTALL_DIR ${CMAKE_BINARY_DIR}/Hardware
	CONFIGURE_COMMAND ""
	BUILD_COMMAND ""
	INSTALL_COMMAND ""
)

set_property(TARGET Firmware PROPERTY VS_DOTNET_REFERENCES  "Hardware/bin/Release/Hardware.dll" )
