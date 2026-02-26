load("//bazel:cc_wrappers.bzl", "cc_binary", "cc_library", "cc_test")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "fake_response_publisher_lib",
    srcs = ["fake_response_publisher.cpp"],
    deps = [
        "//lib:lib_utils",
        "//orchagent:mock_response_publisher_lib",
        "//orchagent:orchagent_lib",
        "@com_google_googletest//:gtest",
        "@com_google_googletest//:gtest_main",
    ],
)

COMMON_COPTS = [
    "-Wno-sign-compare",
    "-fno-stack-protector",
] + select({
    "//:debug_mode": ["-ggdb -DDEBUG"],
    "//conditions:default": ["-g -DNDEBUG"],
})

COMMON_LINKOPTS = []

ALL_TEST_HDRS = glob(["*.h"])

cc_library(
    name = "common_test_lib",
    srcs = [
        "common/mock_shell_command.cpp",
        "fake_netlink.cpp",
        "fake_warmstarthelper.cpp",
        "mock_dbconnector.cpp",
        "mock_hiredis.cpp",
        "mock_orchagent_main.cpp",
        "mock_redisreply.cpp",
        "mock_table.cpp",
    ],
    hdrs = ALL_TEST_HDRS + [],
    copts = COMMON_COPTS,
    defines = [
        "DRAIN_MMU_WHEN_APPLYING_BUFFER_CONFIG",
    ],
    linkopts = COMMON_LINKOPTS,
    deps = [
        # do not sort
        # Order matters, this needs to come before anything that imports swsscommon transitively
        # TODO: Move back to `swsscommon` when we have made a `cc_shared_library` version of libswsscommon.
        "//bazel/swsscommon:swsscommon_shared",
        "//cfgmgr:cfgmgr_base_lib",
        "//cfgmgr:shellcmd",
        "//lib:lib_utils",
        "//orchagent:orchagent_lib",
        "//orchagent:orchagent_test_lib",
        "//warmrestart:warmrestarthelper_lib",
        "@com_google_googletest//:gtest",
        "@com_google_googletest//:gtest_main",
        "//bazel/hiredis",
        "//bazel/libnl3:libnl-genl-3",
        "//bazel/libnl3:libnl-route-3",
        "//bazel/libnl3",
        "//bazel/saivs",
        "//bazel/zmq",
    ],
)

cc_library(
    name = "tests_deps_wrapper",
    linkopts = COMMON_LINKOPTS,
    deps = [
        ":fake_response_publisher_lib",
        "//bazel/hiredis",
        "//bazel/libnl3",
        "//bazel/libnl3:libnl-genl-3",
        "//bazel/libnl3:libnl-route-3",
        "//bazel/saimetadata",
        "//bazel/saimetadata:saimeta",
        "//bazel/saivs",
        "//bazel/zmq",
        "//cfgmgr:cfgmgr_base_lib",
        "//lib:lib_utils",
        "//orchagent:orchagent_test_lib",
        "//warmrestart:warmrestartassist_lib",
        "@com_google_googletest//:gtest",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_test(
    name = "tests",
    srcs = [
        "aclorch_ut.cpp",
        "buffermgrdyn_ut.cpp",
        "bufferorch_ut.cpp",
        "bulker_ut.cpp",
        "common/mock_shell_command.cpp",
        "consumer_ut.cpp",
        "copp_ut.cpp",
        "copporch_ut.cpp",
        "fdborch/flush_syncd_notif_ut.cpp",
        "flexcounter_ut.cpp",
        "flowcounterrouteorch_ut.cpp",
        "intfsorch_ut.cpp",
        "mock_consumerstatetable.cpp",
        "mock_dbconnector.cpp",
        "mock_hiredis.cpp",
        "mock_orchagent_main.cpp",
        "mock_redisreply.cpp",
        "mock_sai_api.cpp",
        "mock_subscriberstatetable.cpp",
        "mock_table.cpp",
        "mux_rollback_ut.cpp",
        "neighorch_ut.cpp",
        "orchdaemon_ut.cpp",
        "portmgr_ut.cpp",
        "portsorch_ut.cpp",
        "qosorch_ut.cpp",
        "routeorch_ut.cpp",
        "saispy_ut.cpp",
        "sflowmgrd_ut.cpp",
        "sfloworh_ut.cpp",
        "switchorch_ut.cpp",
        "swssnet_ut.cpp",
        "test_failure_handling.cpp",
        "twamporch_ut.cpp",
        "ut_saihelper.cpp",
        "warmrestartassist_ut.cpp",
        "warmrestarthelper_ut.cpp",
    ] + ALL_TEST_HDRS,
    copts = COMMON_COPTS,
    dynamic_deps = [
        # TODO Move swsscommon here once we have made cc_shared_library work with rules_distroless.
    ],
    linkopts = COMMON_LINKOPTS,
    deps = [
        # do not sort
        # Order matters, this needs to come before anything that imports swsscommon transitively
        "//bazel/swsscommon:swsscommon_shared",
        ":fake_response_publisher_lib",
        "//cfgmgr:cfgmgr_base_lib",
        "//lib:lib_utils",
        "//orchagent:orchagent_test_lib",
        "//warmrestart:warmrestartassist_lib",
        "@com_google_googletest//:gtest",
        "@com_google_googletest//:gtest_main",
        "//bazel/hiredis",
        "//bazel/libnl3:libnl-genl-3",
        "//bazel/libnl3:libnl-route-3",
        "//bazel/libnl3:libnl-nf-3",
        "//bazel/libnl3",
        "//bazel/saimetadata:saimeta",
        "//bazel/saimetadata",
        "//bazel/saivs",
        "//bazel/zmq",
        "@bookworm//libyang2-dev:libyang2",
    ],
)

# only works with --config=portsyncd_tests_opts
cc_test(
    name = "portsyncd_tests",
    srcs = [
        "portsyncd/portsyncd_ut.cpp",
    ],
    copts = COMMON_COPTS,
    linkopts = COMMON_LINKOPTS,
    deps = [
        ":common_test_lib",
        ":fake_response_publisher_lib",
        "//lib:lib_utils",
        "//portsyncd:portsyncd_lib",
    ],
)

cc_test(
    name = "intfmgrd_tests",
    srcs = [
        "intfmgrd/intfmgr_ut.cpp",
    ] + ALL_TEST_HDRS,
    copts = COMMON_COPTS,
    linkopts = COMMON_LINKOPTS,
    deps = [
        ":common_test_lib",
        ":fake_response_publisher_lib",
    ],
)

# todo(lmeninato): only works in kokoro
cc_test(
    name = "teammgrd_tests",
    srcs = [
        "teammgrd/teammgr_ut.cpp",
    ] + ALL_TEST_HDRS,
    copts = COMMON_COPTS,
    linkopts = COMMON_LINKOPTS,
    deps = [
        ":common_test_lib",
        ":fake_response_publisher_lib",
    ],
)

cc_test(
    name = "fpmsyncd_tests",
    srcs = [
        "fpmsyncd/test_fpmlink.cpp",
        "fpmsyncd/test_routesync.cpp",
    ] + ALL_TEST_HDRS,
    copts = COMMON_COPTS,
    linkopts = COMMON_LINKOPTS,
    deps = [
        ":common_test_lib",
        ":fake_response_publisher_lib",
        "//fpmsyncd:fpmsyncd_lib",
    ],
)

cc_test(
    name = "response_publisher_tests",
    srcs = [
        "response_publisher/response_publisher_ut.cpp",
    ] + ALL_TEST_HDRS,
    copts = COMMON_COPTS,
    linkopts = COMMON_LINKOPTS,
    deps = [
        ":common_test_lib",
        "//bazel/saimetadata",
        "//bazel/saimetadata:saimeta",
        "//orchagent:response_publisher_lib",
    ],
)
