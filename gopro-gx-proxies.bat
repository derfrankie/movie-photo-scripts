for /r . %%a in (GX*.MP4) do ffmpeg -i "%%a" -vf scale=720:-1 -vcodec prores -profile:v 0 "%%~paProxies\%%~na_Proxy.mov"