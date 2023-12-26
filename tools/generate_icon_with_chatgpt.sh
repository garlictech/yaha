#!/bin/bash

# Replace with the actual API endpoint and your API key
API_ENDPOINT=" https://api.openai.com/v1/images/generations"
API_KEY="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"

# Function to generate an image
generate_image() {
    local ICON_NAME="$1"
    local prompt_type="${ICON_NAME//_/ }"

    echo "Generating image for prompt type: $prompt_type"
    local response=$(curl -s -X POST $API_ENDPOINT \
        -H "Authorization: Bearer $API_KEY" \
        -H "Content-Type: application/json" \
        -d '{
            "model": "dall-e-3",
            "n": 1,
            "size": "1024x1024",
            "prompt": "A small black and white drawing for a hiking app. The image features a '"$prompt_type"' standing alone without any background. Designed with minimal details for clarity at a small size. The image showcases a simple outline or silhouette of a '"$prompt_type"', recognizable by its typical features. The design is ultra-minimalistic, using only black and white. Format is png, with solid white background. The '"$prompt_type"' should look like a map icon without border."
        }')

    local url=$(echo $response | jq -r '.data[0].url')
    
    if [ "$url" = "null" ]; then
        echo "No URL found in the response."
        exit 1
    fi

    echo "Image URL: $url"
    echo "Converting to SVG..."
    
    ./tools/convert_png_to_svg_poi_icon.sh $url $ICON_NAME
}

# Check if a parameter is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 [prompt type]"
    exit 1
fi

generate_image "$1"
