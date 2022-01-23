workspace(
    name = "next_app",
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# This provides the basic tools for running and packaging nodejs programs in Bazel
http_archive(
    name = "build_bazel_rules_nodejs",
    sha256 = "3635797a96c7bfcd0d265dacd722a07335e64d6ded9834af8d3f1b7ba5a25bba",
    urls = [
        "https://github.com/bazelbuild/rules_nodejs/releases/download/4.3.0/rules_nodejs-4.3.0.tar.gz",
        "https://storage.googleapis.com/bsci-thirdparty/github_com/bazelbuild/rules_nodejs/releases/download/4.3.0/rules_nodejs-4.3.0.tar.gz",
    ],
)

load("@build_bazel_rules_nodejs//:index.bzl", "yarn_install")

yarn_install(
    name = "npm",
    package_json = "//:package.json",
    strict_visibility = False,
    symlink_node_modules = True,
    yarn_lock = "//:yarn.lock",
)

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "2b1641428dff9018f9e85c0384f03ec6c10660d935b750e3fa1492a281a53b0f",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.29.0/rules_go-v0.29.0.zip",
        "https://storage.googleapis.com/bsci-thirdparty/github_com/bazelbuild/rules_go/releases/download/v0.29.0/rules_go-v0.29.0.zip",
    ],
)

http_archive(
    name = "bazel_gazelle",
    sha256 = "de69a09dc70417580aabf20a28619bb3ef60d038470c7cf8442fafcf627c21cb",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v0.24.0/bazel-gazelle-v0.24.0.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.24.0/bazel-gazelle-v0.24.0.tar.gz",
        "https://storage.googleapis.com/bsci-thirdparty/github_com/bazelbuild/bazel-gazelle/releases/download/v0.24.0/bazel-gazelle-v0.24.0.tar.gz",
    ],
)

http_archive(
    name = "build_bazel_rules_nodejs_old",
    sha256 = "50fa0f31ca1deb1cffde4cfb546bc6d15d6cac39880f6ff3c883d66f98736f4b",
    strip_prefix = "rules_nodejs-0.30.1",
    urls = [
        "https://github.com/bazelbuild/rules_nodejs/archive/0.30.1.tar.gz",
        "https://storage.googleapis.com/bsci-thirdparty/github_com/bazelbuild/rules_nodejs/archive/0.30.1.tar.gz",
    ],
)

http_archive(
    name = "ecosia_bazel_rules_nodejs_contrib",
    sha256 = "53372dafc6553160c61d12ff8cb611369a05acdce54a0ef43d36a58de03d75d3",
    strip_prefix = "bazel_rules_nodejs_contrib-1c0445d91de4528cf77c40c128a64f2ec58ca44c",
    urls = [
        "https://github.com/benchsci/bazel_rules_nodejs_contrib/archive/1c0445d91de4528cf77c40c128a64f2ec58ca44c.tar.gz",
    ],
)

# required by @io_bazel_rules_go
http_archive(
    name = "com_google_protobuf",
    sha256 = "d0f5f605d0d656007ce6c8b5a82df3037e1d8fe8b121ed42e536f569dec16113",
    strip_prefix = "protobuf-3.14.0",
    urls = [
        "https://mirror.bazel.build/github.com/protocolbuffers/protobuf/archive/v3.14.0.tar.gz",
        "https://github.com/protocolbuffers/protobuf/archive/v3.14.0.tar.gz",
        "https://storage.googleapis.com/bsci-thirdparty/github_com/protocolbuffers/protobuf/archive/v3.14.0.tar.gz",
    ],
)

# required by @com_google_protobuf
# -> copied from @com_google_protobuf//:protobuf_deps.bzl
http_archive(
    name = "zlib",
    build_file = "@com_google_protobuf//:third_party/zlib.BUILD",
    sha256 = "629380c90a77b964d896ed37163f5c3a34f6e6d897311f1df2a7016355c45eff",
    strip_prefix = "zlib-1.2.11",
    urls = [
        "https://github.com/madler/zlib/archive/v1.2.11.tar.gz",
        "https://storage.googleapis.com/bsci-thirdparty/github_com/madler/zlib/archive/v1.2.11.tar.gz",
    ],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

# required by @io_bazel_rules_go
# -> copied from @io_bazel_rules_go//go/private/repositories.bzl
# -> but newer version required by cloud.google.com/go (used by //tools/gcs-proxy)
http_archive(
    name = "org_golang_google_genproto",
    patch_args = ["-p1"],
    patches = [
        # releaser:patch-cmd gazelle -repo_root . -go_prefix google.golang.org/genproto -go_naming_convention import_alias -proto disable_global
        "@io_bazel_rules_go//third_party:org_golang_google_genproto-gazelle.patch",
    ],
    sha256 = "3852b76b625e2f4ca2134bb05d07a8cb622038b3a89a311088e52441d70b92b2",
    strip_prefix = "go-genproto-cf77aa76bad211d497a9d3a84f5ea59278fc5963",
    # see bin/upgrade-go-deps
    urls = [
        "https://github.com/googleapis/go-genproto/archive/cf77aa76bad211d497a9d3a84f5ea59278fc5963.zip",
        "https://storage.googleapis.com/bsci-thirdparty/github_com/googleapis/go-genproto/archive/cf77aa76bad211d497a9d3a84f5ea59278fc5963.zip",
    ],
)

go_rules_dependencies()

go_register_toolchains(version = "1.17.2")

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

# loads @com_github_bazelbuild_buildtools
gazelle_dependencies()

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

protobuf_deps()
