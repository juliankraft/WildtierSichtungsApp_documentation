#!/bin/bash

# Variables
TARGET_FOLDER=~/go/wildtier_erhebung_backend/static/presentation/
SOURCE_IMAGES=./images
LOGO_IMAGE=logo.jpg

# Clear the target folder if it exists
if [ -d "$TARGET_FOLDER" ]; then
    rm -rf "$TARGET_FOLDER"
    echo "Cleared target folder: $TARGET_FOLDER"
else
    echo "Target folder does not exist. No need to clear."
fi

# Export the presentation
reveal-md presentation.md --css simple_jk.css --static "$TARGET_FOLDER"
if [ $? -eq 0 ]; then
    echo "Presentation exported successfully to $TARGET_FOLDER!"
else
    echo "Error: Failed to export presentation." >&2
    exit 1
fi

# Create images folder if it doesn't exist
mkdir -p "$TARGET_FOLDER/images"

# Copy logo to the static folder
if [ -f "$SOURCE_IMAGES/$LOGO_IMAGE" ]; then
    cp "$SOURCE_IMAGES/$LOGO_IMAGE" "$TARGET_FOLDER/images/"
    echo "Logo ($LOGO_IMAGE) copied to $TARGET_FOLDER/images/"
else
    echo "Error: Logo file ($SOURCE_IMAGES/$LOGO_IMAGE) not found." >&2
    exit 1
fi

echo "Script completed successfully!"
