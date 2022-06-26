export VIDEO_FILE=$1

export BITRATE="8M"
export FPS=60
export BUFFER=30

mkdir hls-${VIDEO_FILE}

cd hls-${VIDEO_FILE}

ffmpeg -i ../${VIDEO_FILE}.mp4 \
-c:v libx264 \
-x264opts keyint=${FPS}:min-keyint=${FPS}:no-scenecut \
-x264-params "nal-hrd=cbr:force-cfr=1" -b:v ${BITRATE} -maxrate:v ${BITRATE} -minrate:v ${BITRATE} -bufsize:v ${BUFFER}M \
-preset slow \
-g 48 \
-sc_threshold 0 \
-keyint_min 48 \
-start_number 0 \
-hls_time 2 \
-hls_playlist_type vod \
-hls_flags independent_segments \
-hls_segment_type mpegts \
-hls_list_size 0 \
-f hls master.m3u8

# ffmpeg -i ../${VIDEO_FILE}.mp4 \
# -c:v libx264 \
# -x264opts keyint=${FPS}:min-keyint=${FPS}:no-scenecut \
# -x264-params "nal-hrd=cbr" -b:v ${BITRATE} -maxrate:v ${BITRATE} -minrate:v ${BITRATE} -bufsize:v ${BUFFER}M \
# -profile:v baseline \
# -level 3.0 \
# -start_number 0 \
# -hls_time 2 \
# -hls_list_size 0 \
# -f hls master.m3u8