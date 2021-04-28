#=============================================================================
# Copyright (c) 2018-2021, NVIDIA CORPORATION.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#=============================================================================
include_guard(GLOBAL)


#[=======================================================================[.rst:
rapids_cmake_build_type
-----------------------

.. versionadded:: 0.20

Establish the :variable:`CMAKE_BUILD_TYPE` default value for the project if the user
hasn't specified one and the generator is either Ninja or Makefile.

.. command:: rapids_cmake_build_type

  .. code-block:: cmake

    rapids_cmake_build_type(default_type)

  If the generator is `Ninja` or `Makefile` the :variable:`CMAKE_BUILD_TYPE`
  variable will be established if it doesn't already exist.

  ``default_type``
      The default build type to use if one doesn't already exist

Result Variables
^^^^^^^^^^^^^^^^
  CMAKE_BUILD_TYPE will be set to ``default_type`` if not already set

#]=======================================================================]
function(rapids_cmake_build_type default_type)
  list(APPEND CMAKE_MESSAGE_CONTEXT "rapids.cmake.build_type")

  if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
    message(VERBOSE "Setting build type to '${default_type}' since none specified.")
    set(CMAKE_BUILD_TYPE "${default_type}" CACHE STRING  "Choose the type of build." FORCE)
    # Set the possible values of build type for cmake-gui
    set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release" "MinSizeRel" "RelWithDebInfo")
  endif()
endfunction()
