sudo apt install -y libglew-dev libassimp-dev libboost-all-dev libgtk-3-dev libopencv-dev \
	libglfw3-dev libavdevice-dev libavcodec-dev libeigen3-dev libxxf86vm-dev libembree-dev -y

pip install -U torch torchvision torchaudio

pip install -U open3d trimesh scikit-image opencv-python \
	plyfile tqdm

cd ./SIBR_viewers

rm -rf build
rm -rf install

cmake -Bbuild . -DCMAKE_BUILD_TYPE=Release -G Ninja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
cmake --build build -j --target install

cd ../submodules/diff-gaussian-rasterization
pip install -e .

cd ../simple-knn
pip install -e .
