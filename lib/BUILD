load("//:defs.bzl", "ts_project")

ts_project(
    name = "api",
    srcs = ["api.ts"],
    visibility = ["//visibility:public"],
    deps = [
            "@npm//gray-matter",
            "@npm//@types/node"
    ],
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
        "@npm//remark",
        "@npm//remark-html",
    ],
)
