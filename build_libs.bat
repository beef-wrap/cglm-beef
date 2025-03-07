clang -c -g -gcodeview -o cglm-windows.lib -target x86_64-pc-windows -fuse-ld=llvm-lib -Wall cglm\cglm.c

mkdir libs
move cglm-windows.lib libs
