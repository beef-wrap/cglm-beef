const std = @import("std");

const optimize_matrix: []const std.builtin.OptimizeMode = &.{
    .Debug,
    .ReleaseSmall,
};

const targets_matrix: []const std.Target.Query = &.{
    .{ .cpu_arch = .x86_64, .os_tag = .windows, .abi = .msvc },
    .{ .cpu_arch = .aarch64, .os_tag = .windows, .abi = .gnu },

    .{ .cpu_arch = .x86_64, .os_tag = .linux, .abi = .musl },
    .{ .cpu_arch = .aarch64, .os_tag = .linux, .abi = .gnu },

    .{ .cpu_arch = .x86_64, .os_tag = .macos },
    .{ .cpu_arch = .aarch64, .os_tag = .macos },
};

fn lib(
    b: *std.Build,
    target_opt: []const u8,
    target: std.Target.Query,
    optimize: std.builtin.OptimizeMode,
    name: []const u8,
    name_debug: []const u8,
    root: std.Build.LazyPath,
    includes: []const std.Build.LazyPath,
    files: []const []const u8,
) !void {
    const triple = target.zigTriple(b.allocator) catch "";

    const module = b.createModule(.{
        .target = b.resolveTargetQuery(target),
        .optimize = optimize,
        .sanitize_c = .off,
        .stack_check = false,
        .stack_protector = false,
        .single_threaded = true,
    });

    module.linkSystemLibrary("c", .{});

    module.addCMacro("CGLM_STATIC", "");

    for (includes) |i| {
        module.addIncludePath(i);
    }

    module.addCSourceFiles(.{ .root = root, .files = files });

    const library = b.addLibrary(.{
        .name = if (optimize == .Debug) name_debug else name,
        .linkage = .static,
        .root_module = module,
    });

    const target_output = b.addInstallArtifact(library, .{
        .dest_dir = .{
            .override = .{
                .custom = triple,
            },
        },
    });

    if (std.mem.eql(u8, target_opt, "") or std.mem.eql(u8, target_opt, triple)) {
        b.getInstallStep().dependOn(&target_output.step);
    }
}

pub fn build(b: *std.Build) !void {
    const target: []const u8 = b.option([]const u8, "target", "specify target triple") orelse "";

    const upstream = b.dependency("upstream", .{});

    for (optimize_matrix) |o| {
        for (targets_matrix) |t| {
            try lib(
                b,
                target,
                t,
                o,
                "cglm",
                "cglm_d",
                upstream.path("src"),
                &.{},
                cglm_sources,
            );
        }
    }
}

const cglm_sources = &.{
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
};
