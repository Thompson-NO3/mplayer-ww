# !/bin/sh

if [ -f "config.mak" ]; then
  echo
  echo Beginning Clean Up...
  echo
  make distclean
fi

echo
echo Beginning Configrue...
echo
. autocfg-shared.sh $1 

if [ -f "config.mak" ]; then
  echo
  echo Beginning Make...
  echo
  make -j4
fi

if [ -f "mplayer.exe" ]; then
  if [ ! -d "release" ]; then
    mkdir release
  fi
  echo
  echo Beginning Install...
  echo
  install -m 755 -s mplayer.exe ./release/
fi

if [ -d "/usr/local/ffmpeg-ww/bin" ] ; then
	cp -f -p /usr/local/ffmpeg-ww/bin/swscale-*.dll ./release/
	cp -f -p /usr/local/ffmpeg-ww/bin/avutil-*.dll ./release/
	cp -f -p /usr/local/ffmpeg-ww/bin/avcodec-*.dll ./release/
	cp -f -p /usr/local/ffmpeg-ww/bin/avformat-*.dll ./release/
	cp -f -p /usr/local/ffmpeg-ww/bin/postproc-*.dll ./release/
  cp -f -p /usr/local/ffmpeg-ww/bin/swresample-*.dll ./release/
fi

