# Android + Scala + Bazel

This is a sample of how to build Android apps using the [Scala programming language](https://www.scala-lang.org/) with the [Bazel build system](https://bazel.build/).

## Getting started

1. [Install Bazel](https://docs.bazel.build/versions/master/install.html)
2. [Install the Android SDK](https://developer.android.com/studio/index.html) (setting `ANDROID_HOME` is required)
3. From the root of this repo:

    bazel build app

4. To install to a mobile device:

    bazel mobile-install app

## Thanks

I borrowed this skeleton app from [sbt-android](https://github.com/scala-android/sbt-android)