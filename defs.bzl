load("@build_bazel_rules_nodejs//:index.bzl", _js = "js_library")
load("@npm//@bazel/typescript:index.bzl",  _ts_project = "ts_project")
load("@npm//typescript:index.bzl", _ts_test="tsc_test")



_DEPS = [
    "@npm//@types/react",
    "@npm//tslib"
]
def js_library(name, srcs, **kwargs):
    _js(name, srcs, **kwargs)

def ts_project(name, srcs, **kwargs):
    tsconfig = {
        "compilerOptions": {
            "allowJs": True,
            "declaration": True,
            "strict": True,
            "noImplicitAny": True,
        },
    }
    deps = kwargs.pop("deps", [])
    deps += _DEPS

    data = kwargs.pop("data", [])

    # _js(name, srcs, deps=deps + data, **kwargs)

    _ts_project(
        name = name,
        srcs = srcs,
        deps = deps,
        data = data,
        allow_js = True,
        declaration = True,
        declaration_map = True,
        preserve_jsx = False,
        link_workspace_root = True,
        extends = "//:tsconfig.json",
        tsconfig = tsconfig,
        **kwargs
    )
