load("//:swss_helpers.bzl", "add_debug_to_copts")
load("//bazel:cc_wrappers.bzl", "cc_binary", "cc_library", "cc_test")

package(default_visibility = ["//visibility:public"])

filegroup(
    name = "mclagsyncd_binary",
    srcs = ["mclagsyncd"],
)

cc_binary(
    name = "mclagsyncd",
    srcs = glob([
        "*.cpp",
        "*.h",
    ]),
    copts = add_debug_to_copts(),
    deps = [
        "//bazel/hiredis",
        "//bazel/libnl3",
        "//bazel/libnl3:libnl-nf-3",
        "//bazel/libnl3:libnl-route-3",
        "//bazel/swsscommon",
        "//warmrestart:warmrestartassist_lib",
    ],
)
