#!/bin/env bash

if [ -z $GITHUB_WORKSPACE ]; then
	echo "This script should only run on GitHub action!" >&2
	exit 1
fi

# Make sure we're on right directory
cd $GITHUB_WORKSPACE

out="$GITHUB_WORKSPACE/out"
termux_prefix="/data/data/com.termux/files/usr"
version="$(cat version)"
version_code="$(git rev-list HEAD --count)"
release_code="$(git rev-list HEAD --count)-$(git rev-parse --short HEAD)-release"
deb_name="oneshot-$version-$release_code.deb"

mkdir -v "$out"
mkdir -v "$out/deb"
mkdir -pv "$out/deb$termux_prefix"
mkdir -pv "$out/deb$termux_prefix/share/oneshot"
mkdir -pv "$out/deb$termux_prefix/bin"
cp -v src/oneshot "$out/deb$termux_prefix/bin"
cp -rv deb/share/* "$out/deb$termux_prefix/share/oneshot"
cp -rv deb/dpkg-conf "$out/deb/DEBIAN"
chmod -Rv 755 "$out/deb/DEBIAN"
chmod -Rv 755 "$out/deb$termux_prefix/bin"
sed -i "s/^Version: .*/Version: $version.$version_code/" ./out/deb/DEBIAN/control

cd $out/deb
dpkg -b . "$GITHUB_WORKSPACE/$deb_name"
echo "deb_out=$GITHUB_WORKSPACE/$deb_name" >>$GITHUB_OUTPUT
	