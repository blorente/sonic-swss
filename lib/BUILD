load("//:swss_helpers.bzl", "add_debug_to_copts", "add_gcovpreload_to_linkopts")
load("//bazel:cc_wrappers.bzl", "cc_binary", "cc_library", "cc_test")

package(default_visibility = ["//visibility:public"])

filegroup(
    name = "lib_utils_srcs",
    srcs = [
        "gearboxutils.cpp",
        "gearboxutils.h",
        "recorder.cpp",
        "recorder.h",
        "subintf.cpp",
        "subintf.h",
    ],
    visibility = ["//visibility:public"],
)

cc_library(
    name = "lib_utils",
    srcs = [
        "gearboxutils.cpp",
        "recorder.cpp",
        "subintf.cpp",
    ],
    hdrs = [
        "gearboxutils.h",
        "recorder.h",
        "subintf.h",
    ],
    copts = add_debug_to_copts(),
    linkopts = add_gcovpreload_to_linkopts(),
    deps = [
        "//bazel/swsscommon",
    ],
)

cc_library(
    name = "asan",
    srcs = ["asan.cpp"],
    copts = add_debug_to_copts(),
    linkopts = add_gcovpreload_to_linkopts(),
    deps = [
        "//bazel/swsscommon",
    ],
)
