"""Compiler and linker flags for sonic-swss."""

# Default C++ compiler options
CXXOPTS = [
    "-std=c++17",
    "-Wall",
    "-fPIC",
    "-Wno-write-strings",
    # "-Werror",
    "-Wno-reorder",
    "-Wcast-align",
    "-Wcast-qual",
    # issues with googletest and stack-protector
    # "-Wconversion",
    "-Wdisabled-optimization",
    "-Wextra",
    # issues with protobuf
    # "-Wfloat-equal",
    # "-Wmissing-field-initializers",
    "-Wno-missing-field-initializers",
    "-Wno-deprecated-declarations",
    # issues with absl
    "-Wno-error=format-nonliteral",
    "-Wno-format-nonliteral",
    "-Wno-stringop-overflow",
    "-Wno-error=suggest-attribute=format",
    "-Wformat=2",
    "-Wformat-nonliteral",
    "-Wformat-security",
    "-Wformat-y2k",
    "-Wimport",
    "-Winit-self",
    "-Winvalid-pch",
    "-Wlong-long",
    "-Wmissing-format-attribute",
    "-Wno-aggregate-return",
    "-Wno-padded",
    "-Wno-switch-enum",
    "-Wno-unused-parameter",
    "-Wpacked",
    "-Wpointer-arith",
    # issues with googletest and stack-protector
    # "-Wstack-protector",
    "-Wstrict-aliasing=3",
    "-Wswitch",
    "-Wswitch-default",
    "-Wunreachable-code",
    "-Wunused",
    "-Wvariadic-macros",
    "-Wno-switch-default",
    "-Wno-long-long",
] 

# TODO(bazel-ready): Unify these flags under @sonic_build_infra, or even better rules_cc.
ENABLE_GCOV_CXXOPTS = select({
    "//:gcov": [
        "-g",
        "-O0",
        "-ftest-coverage",
        "-fprofile-arcs",
        "-fprofile-dir=/sonic/swss",
    ],
    "//conditions:default": [],
})

ENABLE_GCOV_LINKOPTS = select({
    "//:gcov": [
        "-ftest-coverage",
        "-lgcovpreload",
        "-lgcov",
    ],
    "//conditions:default": [],
})

ASAN_CXXOPTS = select({
    "//:asan": [
        "-fsanitize=address",
    ],
    "//conditions:default": [],
})

ASAN_LINKOPTS = select({
    "//:asan": [
        "-fsanitize=address",
        "-lasan",
    ],
    "//conditions:default": [],
})

TSAN_CXXOPTS = select({
    "//:tsan": [
        "-fsanitize=thread",
    ],
    "//conditions:default": [],
})

TSAN_LINKOPTS = select({
    "//:tsan": [
        "-fsanitize=thread",
        "-ltsan",
    ],
    "//conditions:default": [],
})

USAN_CXXOPTS = select({
    "//:usan": [
        "-fsanitize=undefined",
    ],
    "//conditions:default": [],
})

USAN_LINKOPTS = select({
    "//:usan": [
        "-fsanitize=undefined",
        "-lusan",
    ],
    "//conditions:default": [],
})

# build:portsyncd_tests_opts
PORTSYNCD_TESTS_LINKOPTS = select({
    "//:portsyncd_tests_opts_enabled": [
        "-Wl,-wrap,if_nameindex",
        "-Wl,-wrap,if_freenameindex",
    ],
    "//conditions:default": [],
})

COMMON_CXXOPTS = CXXOPTS + ASAN_CXXOPTS + TSAN_CXXOPTS + USAN_CXXOPTS + ENABLE_GCOV_CXXOPTS
COMMON_LINKOPTS = ASAN_LINKOPTS + TSAN_LINKOPTS + USAN_LINKOPTS + ENABLE_GCOV_LINKOPTS + PORTSYNCD_TESTS_LINKOPTS
