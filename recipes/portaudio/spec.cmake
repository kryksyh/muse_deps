# PortAudio master: 19.7.0 is from 2021, and master has the fixes since then
set(DEP_VERSION d717466)

set(DEP_SOURCE_URL    "https://github.com/PortAudio/portaudio/archive/d71746635dae088c5d7c808d5f29f0b939458739.tar.gz")
set(DEP_SOURCE_SHA256 "f756f0a6020f547190ed6960cf72e809ec73fc659d91f94da8cac521896c502f")

set(DEP_CMAKE_ARGS
    -DPA_BUILD_SHARED_LIBS=ON
)

if(BD_OS STREQUAL "linux")
    list(APPEND DEP_CMAKE_ARGS -DPA_USE_JACK=ON -DPA_USE_PULSEAUDIO=OFF -DPA_USE_SNDIO=OFF)
elseif(BD_OS STREQUAL "windows")
    list(APPEND DEP_CMAKE_ARGS -DPA_USE_WDMKS=OFF -DPA_USE_WDMKS_DEVICE_INFO=OFF)
endif()

set(DEP_PATCHES
    patch/0004-Fix-the-crash-with-a-fixed-buffer-and-an-ALSA-input-underflo.patch
)

set(DEP_PATCHES_WINDOWS
    patch/0001-Windows-export-PaWinDS-GetDeviceGUID-for-portmixer.patch
    patch/0002-ASIO-load-drivers-only-when-a-device-is-used.patch
    patch/0009-WASAPI-report-captured-audio-that-Windows-dropped-as-an-inpu.patch
    patch/0010-WASAPI-paWinWasapiSharedLowLatency-a-shorter-shared-engine-p.patch
)

set(DEP_PATCHES_MACOS
    patch/0003-CoreAudio-trim-the-input-ring-of-two-device-streams-and-repo.patch
    patch/0005-CoreAudio-no-AudioUnit-call-in-the-start-stop-listener.patch
    patch/0006-CoreAudio-stop-in-tens-of-milliseconds-not-hundreds.patch
    patch/0007-CoreAudio-report-the-input-ring-s-fill-not-its-size.patch
    patch/0008-CoreAudio-an-output-only-and-an-input-only-device-run-as-one.patch
)

set(DEP_LICENSE_FILES LICENSE.txt)
