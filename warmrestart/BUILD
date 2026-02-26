load("//bazel:cc_wrappers.bzl", "cc_binary", "cc_library", "cc_test")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "warmrestartassist_lib",
    srcs = ["warmRestartAssist.cpp"],
    hdrs = ["warmRestartAssist.h"],
    copts = [
        "-Wno-error=reorder",
    ],
    deps = [
        "//bazel/libnl3",
        "//bazel/libnl3:libnl-route-3",
        "//bazel/swsscommon",
    ],
)

cc_library(
    name = "warmrestarthelper_lib",
    srcs = ["warmRestartHelper.cpp"],
    hdrs = ["warmRestartHelper.h"],
    copts = [
        "-Wno-error=reorder",
    ],
    deps = [
        "//bazel/libnl3",
        "//bazel/libnl3:libnl-route-3",
        "//bazel/swsscommon",
    ],
)
