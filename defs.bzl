load("@aspect_rules_js//js:defs.bzl", _js = "js_library")
load("@aspect_rules_ts//ts:defs.bzl", _ts_project = "ts_project")
load("@aspect_rules_swc//swc:defs.bzl", "swc_transpiler")

_DEPS = [
    "@npm//@types/react",
    "@npm//tslib",
]

def swc(name, **kwargs):
    kwargs["swcrc"] = "//:swcrc"
    swc_transpiler(name = name, **kwargs)

def js_library(name, srcs, **kwargs):
    _js(name = name, srcs = srcs, **kwargs)

def web_asset(name, srcs, **kwargs):
    _js(name = name, srcs = srcs, **kwargs)

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
    # deps += _DEPS

    # This is needed to import CSS
    srcs.append("//:build_deps")

    data = kwargs.pop("data", [])

    _ts_project(
        name = name,
        transpiler = swc,
        srcs = srcs,
        deps = deps,
        data = data,
        allow_js = True,
        declaration = True,
        declaration_map = True,
        preserve_jsx = True,
        # link_workspace_root = True,
        tsconfig = tsconfig,
        **kwargs
    )
