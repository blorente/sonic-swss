load("//:swss_helpers.bzl", "add_debug_to_copts")
load("//bazel:cc_wrappers.bzl", "cc_binary", "cc_library", "cc_test")

package(default_visibility = ["//visibility:public"])

filegroup(
    name = "portsyncd_srcs",
    srcs = [
        "linksync.cpp",
        "linksync.h",
    ],
)

cc_library(
    name = "portsyncd_lib",
    srcs = ["linksync.cpp"],
    hdrs = ["linksync.h"],
    copts = add_debug_to_copts(),
    deps = [
        "//bazel/hiredis",
        "//bazel/libnl3",
        "//bazel/libnl3:libnl-route-3",
        "//bazel/swsscommon",
        "//cfgmgr:shellcmd",
        "//lib:lib_utils",
    ],
)

cc_binary(
    name = "portsyncd",
    srcs = ["portsyncd.cpp"],
    copts = add_debug_to_copts(),
    deps = [
        ":portsyncd_lib",
        "//cfgmgr:shellcmd",
        "//lib:lib_utils",
    ],
)
