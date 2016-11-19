# build-ffmpeg-mingw

[さきゅばす1.x](https://github.com/Saccubus/Saccubus1.x)用の[FFmpeg](https://github.com/Saccubus/ffmpeg) 32bitをビルドするための  
mingw-w64 msys2ビルドスクリプト（自分用メモ）

__mingw-w64 msys2 と必要ライブラリーは予めインストールが必要__  
[libraries.txt](https://github.com/orz-/build-ffmpeg-mingw/blob/master/libraries.txt) 参照

「勝手にしやがれ」ライセンス(WTFPL http://www.wtfpl.net/txt/copying/)

レポジトリ-ブランチ:

 *  master : さきゅばす配布最新版再ビルド[Saccubus/latest_1.xブランチ](https://github.com/Saccubus/ffmpeg/tree/latest_1.x) をビルドする  
 *  build_ffmpeg_master : FFmpeg公式最新版ビルド [FFmpeg/master]https://github.com/FFmpeg/FFmpeg/tree/master をSaccubus1ブランチにリベースしてビルドする  

ビルド方法：

git clone https://github.com/orz-/build-ffmpeg-mingw.git  
cd build-ffmpeg-mingw  
bash configExp.sh

----
For build a [ffmpeg](https://github.com/Saccubus/ffmpeg)  windows binary to use with [Saccubus1.x](https://github.com/Saccubus/Saccubus1.x)   
ffmpeg 32bit(x86) configure and build shell script (just a memo)

__This should require mingw-w64 msys2 and necessary libraries
 which have been already installed.__  
 refer [libraries.txt](https://github.com/orz-/build-ffmpeg-mingw/blob/master/libraries.txt)

license is WTFPL http://www.wtfpl.net/txt/copying/

Branches:  
 *  master : build from [Saccubus/latest_1.x](https://github.com/Saccubus/ffmpeg/tree/latest_1.x)  
 *  build_ffmpeg_master : rebase and build from official [FFmpeg/master]https://github.com/FFmpeg/FFmpeg/tree/master)  

to build ffmpeg, please try

git clone https://github.com/orz-/build-ffmpeg-mingw.git  
cd build-ffmpeg-mingw  
bash configExp.sh

