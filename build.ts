import { type Build } from 'xbuild';

const build: Build = {
    common: {
        project: 'cglm',
        archs: ['x64'],
        variables: [],
        copy: {},
        defines: [],
        options: [
            ["CGLM_SHARED", false],
            ["CGLM_STATIC", true]
        ],
        subdirectories: ['cglm'],
        libraries: {
            cglm: {}
        },
        buildDir: 'build',
        buildOutDir: '../libs',
        buildFlags: [],
    },
    platforms: {
        win32: {
            windows: {},
            android: {
                archs: ['x86', 'x86_64', 'armeabi-v7a', 'arm64-v8a'],
            }
        },
        linux: {
            linux: {},
        },
        darwin: {
            macos: {}
        }
    }
}

export default build;