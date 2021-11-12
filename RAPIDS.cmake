#=============================================================================
# Copyright (c) 2021, NVIDIA CORPORATION.
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
#
# This is the preferred entry point for projects using rapids-cmake
#

if(NOT RAPIDS_CMAKE_VERSION)
  set(RAPIDS_CMAKE_VERSION 21.12)
endif()

set(rapids-cmake-version ${RAPIDS_CMAKE_VERSION})

if(NOT RAPIDS_CMAKE_GIT_TAG)
  set(RAPIDS_CMAKE_GIT_TAG branch-${rapids-cmake-version})
endif()

if(NOT RAPIDS_CMAKE_GIT_REPOSITORY)
  set(RAPIDS_CMAKE_GIT_REPOSITORY https://github.com/rapidsai/rapids-cmake.git)
endif()

include(FetchContent)
FetchContent_Declare(
  rapids-cmake
  GIT_REPOSITORY ${RAPIDS_CMAKE_GIT_REPOSITORY}
  GIT_TAG        ${RAPIDS_CMAKE_GIT_TAG}
)
FetchContent_GetProperties(rapids-cmake)
if(rapids-cmake_POPULATED)
  # Something else has already populated rapids-cmake, only thing
  # we need to do is setup the CMAKE_MODULE_PATH
  if(NOT "${rapids-cmake-dir}" IN_LIST CMAKE_MODULE_PATH)
    list(APPEND CMAKE_MODULE_PATH "${rapids-cmake-dir}")
  endif()
else()
  FetchContent_MakeAvailable(rapids-cmake)
endif()
