"""Wrapper macros for cc_library, cc_binary, and cc_test that inject common flags."""

load("//bazel:flags.bzl", "COMMON_CXXOPTS", "COMMON_LINKOPTS")

def cc_library(cxxopts = [], linkopts = [], **kwargs):
    native.cc_library(
        cxxopts = COMMON_CXXOPTS + cxxopts,
        linkopts = COMMON_LINKOPTS + linkopts,
        **kwargs
    )

def cc_binary(cxxopts = [], linkopts = [], **kwargs):
    native.cc_binary(
        cxxopts = COMMON_CXXOPTS + cxxopts,
        linkopts = COMMON_LINKOPTS + linkopts,
        **kwargs
    )

def cc_test(cxxopts = [], linkopts = [], **kwargs):
    native.cc_test(
        cxxopts = COMMON_CXXOPTS + cxxopts,
        linkopts = COMMON_LINKOPTS + linkopts,
        **kwargs
    )
