load("//:defs.bzl", "ts_project")

ts_project(
    name = "_app",
    srcs = ["_app.tsx"],
    visibility = ["//visibility:public"],
    deps = [
        "//:node_modules/next",
        "//styles:index_css",
    ],
)

ts_project(
    name = "_document",
    srcs = ["_document.tsx"],
    visibility = ["//visibility:public"],
    deps = ["//:node_modules/next"],
)

ts_project(
    name = "index",
    srcs = ["index.tsx"],
    visibility = ["//visibility:public"],
    deps = [
        "//:node_modules/next",
        "//components:container",
        "//components:hero-post",
        "//components:intro",
        "//components:layout",
        "//components:more-stories",
        "//lib:api",
        "//lib:constants",
        "//types:post",
    ],
)
