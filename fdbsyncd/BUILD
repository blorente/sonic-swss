load("//:swss_helpers.bzl", "add_debug_to_copts", "add_gcovpreload_to_linkopts")
load("//bazel:cc_wrappers.bzl", "cc_binary", "cc_library", "cc_test")

package(default_visibility = ["//visibility:public"])

cc_binary(
    name = "fdbsyncd",
    srcs = glob([
        "*.cpp",
        "*.h",
    ]),
    copts = add_debug_to_copts(),
    linkopts = add_gcovpreload_to_linkopts(),
    deps = [
        "//bazel/hiredis",
        "//bazel/libnl3",
        "//bazel/libnl3:libnl-route-3",
        "//bazel/swsscommon",
        "//warmrestart:warmrestartassist_lib",
    ],
)
