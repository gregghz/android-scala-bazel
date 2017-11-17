# load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library")
load("//rules:scala-android.bzl", "scala_android_library")

supportLibraryVersion = "27.0.1".replace(".", "_")

shared_deps = [
    "@android_arch_core_common_1_0_0//jar",
    "@android_arch_lifecycle_common_1_0_3//jar",
    "@android_arch_lifecycle_runtime_1_0_3//aar",
    "@android_arch_lifecycle_extensions_1_0_0//aar",
    "@com_android_support_appcompat_v7_{}//aar".format(supportLibraryVersion),
    "@com_android_support_support_annotations_{}//jar".format(supportLibraryVersion),
    "@com_android_support_support_compat_{}//aar".format(supportLibraryVersion),
    "@com_android_support_support_core_ui_{}//aar".format(supportLibraryVersion),
    "@com_android_support_support_core_utils_{}//aar".format(supportLibraryVersion),
    "@com_android_support_support_fragment_{}//aar".format(supportLibraryVersion),
    "@com_android_support_support_vector_drawable_{}//aar".format(supportLibraryVersion),
]

android_binary(
    name = "app",
    custom_package = "com.gregghz.android.sample",
    srcs = glob(["src/main/java/**/*.java"]),
    resource_files = glob(["src/main/res/**"]),
    manifest = "src/main/AndroidManifest.xml",
    deps = [
        ":app-lib",
    ] + shared_deps,
)

scala_android_library(
    name = "app-lib",
    custom_package = "com.gregghz.android.sample",
    srcs = glob(["src/main/scala/**/*.scala"]),
    manifest = "src/main/AndroidManifest.xml",
    resource_files = glob(["src/main/res/**"]),
    visibility = ["//visibility:public"],
    deps = [] + shared_deps,
)