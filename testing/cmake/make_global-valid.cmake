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
include(${rapids-cmake-dir}/cmake/make_global.cmake)

add_library(test_lib UNKNOWN IMPORTED)

set(targets test_lib)
rapids_cmake_make_global(targets)

get_target_property(is_global test_lib IMPORTED_GLOBAL)
if(NOT is_global)
  message(FATAL_ERROR "Expected is_global to be True [${is_global}]")
endif()
