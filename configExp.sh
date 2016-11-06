#!/bin/bash
# Usage: configExpn3.2.sh ffmpeg-git-dir-path
#        otherwize use "../ffmpeg" as ffmpeg-git-path
ffmpegdir=$1
if [[ -z $ffnoegdir ]]; then
  ffmpegdir=$PWD/../ffmpeg
fi
export dir=$ffmpegdir
 if [[ ! -d $dir ]]; then
 (
  mkdir $dir
  cd $dir/..
  git clone https://github.com/Saccubus/ffmpeg.git $dir
  cd $dir
  git remote add official https://github.com/ffmpeg/ffmpeg.git || true
  cd ..
 )
 fi
 pushd $dir
 git reset --hard
 git fetch origin
 git fetch official
 git branch -D officialmaster || true
 git checkout -b officialmaster official/master
 git checkout master
 git branch -D latest_1.x || true
 git checkout -b latest_1.x origin/latest_1.x
 cat<<EOL
 #######################
 If you want to build anohter branch for Saccubus1 else with latest_1.x 
 try followings:
   git checkout -b buildbranch origin/Saccubus1
   git rebase "something-another-master-branch-ffmpeg"
   (ex1:  git rebase official/master)
   (ex2:  git rebase official/release/3.3)
   (      etc...)
 #######################
EOL
 bash version.sh . version.h
 echo Going to configure followings:
 cat version.h
 popd
# goto build dir
if [[ ! -d build ]]; then
   mkdir build
fi
mv $dir/version.h build/version.h

pushd build
echo Starting Configuration Script: $dir/configure
export TEMPDIR=/mingw32/tmp
TEMPDIR=/mingw32/tmp LANG=C lang=C $dir/configure \
 --enable-gpl \
 --enable-version3 \
 --enable-postproc \
 --enable-libopencore-amrnb \
 --enable-libopencore-amrwb \
 --enable-libvo-amrwbenc \
 --enable-libmp3lame \
 --enable-libgsm \
 --enable-libspeex \
 --enable-libvorbis \
 --enable-libtheora \
 --enable-libopus \
 --enable-libxvid \
 --enable-libvpx \
 --enable-libx264 \
 --enable-hwaccel=h264_dxva2 \
 --enable-libx265 \
 --enable-hwaccel=hevc_dxva2 \
 --enable-libopenjpeg \
 --enable-libmfx \
 --enable-nvenc \
 --disable-ffserver \
 --disable-ffplay \
 --disable-ffprobe \
 --enable-avisynth \
 --enable-w32threads \
 --extra-ldflags="-static -static-libgcc" \
 --extra-cflags="-march=i686 -mtune=generic -mfpmath=sse -msse" \
 --enable-extra-warnings \
 --disable-debug \
 --enable-runtime-cpudetect \
 --optflags="-O2 -finline-functions" \
 --pkg-config-flags="--static" \
 --extra-version="d_$dir" 

echo End Configuration Script: $dir/configure
cat<<EOA
 Starting build ffmpeg.exe
 It will take SOME TIME (a few hours.. or minutes or else)
 Please take it easy and wait and take a break.
EOA
make
cat<<EOB
 ########
 # DONE!#
 ########
EOB
popd
exit

# --extra-version=""
# --enable-avresample \
# --enable-libmodplug \
# --enable-libkvazaar \

# --enable-gpl \
# --enable-version3 \
# --enable-postproc \
# nasm 2.12-1
# yasm 1.3.0-2
# opencore-amrnb 0.1.3
# opencore-amrwb 0.1.3
# vo-amrwbenc 1.3.0
# lame 3.99.5
# gsm 1.0.13-3
# speex 1.2rc2-2
# libvorbis 1.3.5-1
# libtheora 1.1.1-3
# opus 1.1.2-3
# xvidcore 1.4.0
# libvpx 1.5.0-1
# utvideo 15.5.0
# openjpeg 1.5.2-6
# x264 0.148.2705+3 eb0c7a7
# x265 1.9-1
# libmfx 1.16
# nvenc SDK 6.0
# --enable-hwaccel=h264_dxva2 \
# --enable-hwaccel=hevc_dxva2 \
# --enable-avisynth \
# --enable-w32threads \
# --extra-ldflags="-static -static-libgcc" \
# --extra-cflags="-march=i686 -mtune=generic -mfpmath=sse -msse" \
# --enable-extra-warnings \
# --disable-debug \
# --enable-runtime-cpudetect \
# --optflags="-O2 -finline-functions" \
# --pkg-config-flags="--static" \
# --extra-version="_$dir" 
