load("//:swss_helpers.bzl", "add_debug_to_copts")
load("//bazel:cc_wrappers.bzl", "cc_binary", "cc_library", "cc_test")

package(default_visibility = ["//visibility:public"])

filegroup(
    name = "sample_netbouncer_config",
    srcs = [
        "sample/netbouncer.json",
    ],
)

cc_binary(
    name = "swssconfig",
    srcs = ["swssconfig.cpp"],
    copts = add_debug_to_copts(),
    deps = [
        "//bazel/hiredis",
        "//bazel/swsscommon",
    ],
)

cc_binary(
    name = "swssplayer",
    srcs = ["swssplayer.cpp"],
    copts = add_debug_to_copts(),
    deps = [
        "//bazel/hiredis",
        "//bazel/swsscommon",
    ],
)
