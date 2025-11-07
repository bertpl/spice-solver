#! /bin/sh
# ---------------------------------------------
# Input:  ./images/splash/*
# Output: ./images/splash_with_version.webp
# ---------------------------------------------

# --- check imagemagick version ---
echo "------ ImageMagick version info --------------------------------------------"
magick identify -version
echo "----------------------------------------------------------------------------"

# --- argument handling ---
DISPLAY_VERSION="$1"  # e.g. "v0.1.10" or "v0.1.11-dev"

# --- create splash with version info ---
magick -pointsize 36 -font "./images/splash/google_fonts_montserrat_italic.ttf" "./images/splash/splash.webp" -gravity SouthWest -fill "#ffffff" -annotate +10+5 "DiffusionBee 2.5.3 (FLUX.1-dev + Real-ESRGAN)" "./images/temp.mpc"
magick -pointsize 128 -font "./images/splash/google_fonts_montserrat_bold.ttf" "./images/temp.mpc" -gravity East -fill "black" -annotate +997+553 "${DISPLAY_VERSION}" "./images/temp.mpc"
magick -pointsize 128 -font "./images/splash/google_fonts_montserrat_bold.ttf" "./images/temp.mpc" -gravity East -fill "white" -annotate +1000+550 "${DISPLAY_VERSION}" -quality 90 -define webp:lossless=false "./images/splash_with_version.webp"

# --- clean up ---
echo "Cleaning up..."
rm ./images/*.mpc
rm ./images/*.cache
