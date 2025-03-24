cmake -S . -B CJSON/build -DCMAKE_BUILD_TYPE=Debug
cmake --build CJSON/build --config Debug

cmake -S . -B CJSON/build -DCMAKE_BUILD_TYPE=Release
cmake --build CJSON/build --config Release