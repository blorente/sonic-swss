load("//:swss_helpers.bzl", "add_debug_to_copts")
load("//bazel:cc_wrappers.bzl", "cc_binary", "cc_library", "cc_test")

package(default_visibility = ["//visibility:public"])

cc_test(
    name = "tests",
    srcs = [
        "quoted_ut.cpp",
        "request_parser_ut.cpp",
        "swssnet_ut.cpp",
    ],
    copts = add_debug_to_copts(),
    linkopts = [
        "-lpthread",
    ],
    deps = [
        "//bazel/hiredis",
        "//bazel/libnl3:libnl-genl-3",
        "//bazel/saimetadata:saimeta",
        "//bazel/swsscommon",
        "//cfgmgr:shellcmd",
        "//lib:lib_utils",
        "//orchagent:orchagent_lib",
        "//orchagent:request_parser_lib",
        "@com_google_googletest//:gtest",
        "@com_google_googletest//:gtest_main",
    ],
)
