load("//:swss_helpers.bzl", "add_debug_to_copts")
load("//bazel:cc_wrappers.bzl", "cc_binary", "cc_library", "cc_test")

package(default_visibility = ["//visibility:public"])

filegroup(
    name = "gearsyncd_binary",
    srcs = ["gearsyncd"],
)

cc_binary(
    name = "gearsyncd",
    srcs = glob([
        "*.cpp",
        "*.h",
    ]),
    copts = add_debug_to_copts(),
    deps = [
        "//bazel/libnl3",
        "//bazel/libnl3:libnl-route-3",
        "//bazel/swsscommon",
        "//cfgmgr:shellcmd",
        "//lib:lib_utils",
    ],
)
