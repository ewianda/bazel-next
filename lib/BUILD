load("//:defs.bzl", "ts_project")

ts_project(
    name = "api",
    srcs = ["api.ts"],
    visibility = ["//visibility:public"],
    deps = ["//:node_modules/gray-matter"],
)

ts_project(
    name = "constants",
    srcs = ["constants.ts"],
    visibility = ["//visibility:public"],
)

ts_project(
    name = "markdownToHtml",
    srcs = ["markdownToHtml.ts"],
    visibility = ["//visibility:public"],
    deps = [
        "//:node_modules/remark",
        "//:node_modules/remark-html",
    ],
)
