# CBR(Constant Bitrate) encoding using FFmpeg

export BITRATE="10M"
export EXT="mp4"
export INTERVAL=2000
export BUFFER=30
export FPS=30

export FILE_NAME=$1

# FFmpeg video encoding
ffmpeg -y -i ${FILE_NAME}.mp4 -c:v libx264 -x264opts keyint=${FPS}:min-keyint=${FPS}:no-scenecut -x264-params "nal-hrd=cbr" -b:v ${BITRATE} -minrate ${BITRATE} -maxrate ${BITRATE} -bufsize ${BUFFER}M ${FILE_NAME}_${BITRATE}.mp4
echo 
echo "*********** Encoding Complete ***************"
echo 

# mkdir data/${FILE_NAME}_${BITRATE}
