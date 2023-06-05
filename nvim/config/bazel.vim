let g:vim_bazel_build_command = 'bazel build'
let g:vim_bazel_query_command = 'bazel query'
let g:vim_bazel_build_args = ['--output_groups=default', '--aspects=@bazel_skylib//docs/aspects.bzl%bzltools_aspect', '--config=//tools/bzl:vscode.bzlconfig']
let g:vim_bazel_enable_features = ['unused-deps', 'test-inference']
