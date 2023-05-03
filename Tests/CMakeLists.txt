PROJECT(Test LANGUAGES CSharp)
CMAKE_MINIMUM_REQUIRED(VERSION 3.12)
set(CMAKE_SUPPRESS_REGENERATION true)
set(CMAKE_CSharp_FLAGS "/langversion:7")

add_executable(CommTest commtest.cs CommmandType.cs Firmware.cs)

add_test(NAME CommTest
         COMMAND CommTest)

set_tests_properties(CommTest
                     PROPERTIES PASS_REGULAR_EXPRESSION "Test passed"
                                FAIL_REGULAR_EXPRESSION "(exception|Test failed)")

set_property(TARGET CommTest PROPERTY VS_DOTNET_REFERENCES
             "System"
             "System.Drawing"
             "Hardware"
             "OpenTK"
             "Firmware")

add_dependencies(CommTest Firmware)
