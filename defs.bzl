load("@build_bazel_rules_nodejs//:index.bzl", _js = "js_library")
load("@npm//typescript:index.bzl", _ts_test = "tsc_test")

_DEPS = [
    "@npm//@types/react",
    "@npm//tslib",
]

def js_library(name, srcs, **kwargs):
    _js(name, srcs, **kwargs)

def ts_project(name, srcs, **kwargs):
    deps = kwargs.pop("deps", [])
    deps += _DEPS

    data = kwargs.pop("data", [])

    _js(name, srcs, deps = deps + data, **kwargs)
    _ts_test(
        name = name + "_typecheck",
        data = deps + data + srcs + ["//:tsconfig.json", "//:Global.d.ts"],
    )
