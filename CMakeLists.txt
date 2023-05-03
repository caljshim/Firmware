cmake_minimum_required(VERSION 3.12)

project(Firmware LANGUAGES CSharp)

add_dependencies(Firmware Hardware)

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

set(CMAKE_CSharp_FLAGS "/langversion:7")