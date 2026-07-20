const std = @import("std");

pub fn build(b: *std.Build) !void {
    const builder = @import("zig_build_helpers");

    const upstream = b.dependency("upstream", .{});
    const target = b.option([]const u8, "target", "specify target triple");

    _ = try builder.lib(b, .{
        .name = "cglm",
        .upstream = upstream,
        .target = target,
        .macros = &.{
            .{
                .name = "CGLM_STATIC",
                .value = "",
            },
        },
        .files = &.{
            .{
                .root = upstream.path("src"),
                .files = &.{
                    "aabb2d.c",
                    "affine.c",
                    "affine2d.c",
                    "bezier.c",
                    "box.c",
                    "cam.c",
                    "curve.c",
                    "ease.c",
                    "euler.c",
                    "frustum.c",
                    "io.c",
                    "ivec2.c",
                    "ivec3.c",
                    "ivec4.c",
                    "mat2.c",
                    "mat2x3.c",
                    "mat2x4.c",
                    "mat3.c",
                    "mat3x2.c",
                    "mat3x4.c",
                    "mat4.c",
                    "mat4x2.c",
                    "mat4x3.c",
                    "noise.c",
                    "plane.c",
                    "project.c",
                    "quat.c",
                    "ray.c",
                    "sphere.c",
                    "vec2.c",
                    "vec3.c",
                    "vec4.c",
                    "clipspace/ortho_lh_no.c",
                    "clipspace/ortho_lh_zo.c",
                    "clipspace/ortho_rh_no.c",
                    "clipspace/ortho_rh_zo.c",
                    "clipspace/persp_lh_no.c",
                    "clipspace/persp_lh_zo.c",
                    "clipspace/persp_rh_no.c",
                    "clipspace/persp_rh_zo.c",
                    "clipspace/project_no.c",
                    "clipspace/project_zo.c",
                    "clipspace/view_lh_no.c",
                    "clipspace/view_lh_zo.c",
                    "clipspace/view_rh_no.c",
                    "clipspace/view_rh_zo.c",
                },
            },
        },
    });
}
