export VIDEO_FILE=$1

export BITRATE="1"
export FPS=60
export BUFFER=3

mkdir hls-${VIDEO_FILE}

cd hls-${VIDEO_FILE}

ffmpeg -i ../${VIDEO_FILE}.mp4 \
-c:v libx264 \
-x264opts keyint=${FPS}:min-keyint=${FPS}:no-scenecut \
-x264-params "nal-hrd=cbr" -b:v ${BITRATE}M -maxrate:v ${BITRATE}M -minrate:v ${BITRATE}M -bufsize:v ${BUFFER}M \
-profile:v baseline \
-level 3.0 \
-start_number 0 \
-hls_time 2 \
-hls_list_size 0 \
-f hls master.m3u8
