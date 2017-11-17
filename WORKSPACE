rules_scala_version="85308acbd316477f3072e033e7744debcba4f054" # update this as needed

http_archive(
  name = "io_bazel_rules_scala",
  url = "https://github.com/bazelbuild/rules_scala/archive/%s.zip"%rules_scala_version,
  type = "zip",
  strip_prefix= "rules_scala-%s" % rules_scala_version
)

load("@io_bazel_rules_scala//scala:scala.bzl", "scala_repositories")
scala_repositories()

git_repository(
    name = 'gmaven_rules',
    remote = 'https://github.com/aj-michael/gmaven_rules',
    commit = 'bceb76b27506392a39f8c5eacaa0eabc5752fe5a',
)
load('@gmaven_rules//:gmaven.bzl', 'gmaven_rules')
gmaven_rules()

load("@bazel_tools//tools/build_defs/repo:maven_rules.bzl", "maven_aar")

android_sdk_repository(
  name = "androidsdk",
  api_level = 26,
  build_tools_version = "26.0.1"
)
