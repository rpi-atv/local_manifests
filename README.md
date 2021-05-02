# Download Android source with local_manifests
Refer to http://source.android.com/source/downloading.html

```bash
repo init -u https://android.googlesource.com/platform/manifest -b android-s-preview-1
git clone https://github.com/android-rpi/local_manifests .repo/local_manifests -b arpi-12
repo sync
```

# Build for Raspberry Pi 4
 https://github.com/android-rpi/device_arpi_rpi4

Use -j[n] option on sync & build steps, if build host has a good number of CPU cores.
