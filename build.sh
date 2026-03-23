#!/bin/bash
# Build script for ProxyToggle.app

APP_NAME="ProxyToggle"
BUILD_DIR="build"
APP_DIR="$BUILD_DIR/$APP_NAME.app/Contents"

# Clean previous build
rm -rf "$BUILD_DIR"

# Create app bundle structure
mkdir -p "$APP_DIR/MacOS"
mkdir -p "$APP_DIR/Resources"

# Copy files
cp src/ProxyToggle.sh "$APP_DIR/MacOS/$APP_NAME"
chmod +x "$APP_DIR/MacOS/$APP_NAME"
cp resources/Info.plist "$APP_DIR/"
cp resources/AppIcon.icns "$APP_DIR/Resources/"

echo "Build complete: $BUILD_DIR/$APP_NAME.app"
