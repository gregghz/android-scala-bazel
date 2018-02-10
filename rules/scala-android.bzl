load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library")

def scala_android_library(
        name,
        srcs = [],
        deps = [],
        java_deps = [],
        aar_deps = [],
        resource_files = [],
        custom_package = None,
        manifest = None,
        proguard_specs = [],
        visibility = None,
        scala_plugins = [],
        **kwargs):

    res_deps = []
    if len(resource_files) > 0:
        native.android_library(
            name = name + "_res",
            custom_package = custom_package,
            manifest = manifest,
            resource_files = resource_files,
            deps = aar_deps + java_deps,
            **kwargs
        )
        res_deps.append(name + "_res")

    native.android_library(
        name = name + "_aar",
        neverlink = 1,
        exports = aar_deps,
    )

    native.java_import(
        name = name + "_sdk",
        neverlink = 1,
        jars = [
            "//tools/defaults:android_jar",
        ],
    )

    scala_library(
        name = name + "_compile",
        srcs = srcs,
        plugins = scala_plugins,
        deps = deps + [name + "_sdk", name + "_aar"] + res_deps,
        **kwargs
    )

    native.java_import(
        name = name + "_scala",
        jars = [name + "_compile.jar"],
        deps = java_deps,
        visibility = visibility,
        exports = [
            "//external:io_bazel_rules_scala/dependency/scala/scala_library"
        ],
    )

    native.android_library(
        name = name,
        exports = aar_deps + res_deps + [
            name + "_scala",
        ],
        proguard_specs = proguard_specs,
        visibility = visibility,
        custom_package = custom_package,
        manifest = manifest,
        **kwargs
    )
