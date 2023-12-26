#!/bin/bash

# Replace with the actual API endpoint and your API key
API_ENDPOINT=" https://api.openai.com/v1/images/generations"
API_KEY="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"

TARGET_PATH=$PWD/libs/flutter/yaha-lib/assets/poi-backgrounds

# Function to generate an image
generate_image() {
    local poiName="$1"
    local prompt_type="${poiName//_/ }"
    local extraInfo="$2"

    local poi_background_prompt="Create a photorealistic image for a hiking app. The image features a '"$prompt_type"' standing alone.  Add a scenic outdoor background. '"$extraInfo"'}"

    echo "Generating poi background for poi type: $prompt_type"

    local response=$(curl -s -X POST $API_ENDPOINT \
        -H "Authorization: Bearer $API_KEY" \
        -H "Content-Type: application/json" \
        -d '{
            "model": "dall-e-3",
            "n": 1,
            "size": "1024x1024",
            "prompt": "Create a photorealistic image for a hiking app. The image features a '"$prompt_type"' standing alone.  Add a scenic outdoor background. '"$extraInfo"'}"
        }')

    local url=$(echo $response | jq -r '.data[0].url')
    
    if [ "$url" = "null" ]; then
        echo "No URL found in the response."
        exit 1
    fi

    echo "Image URL: $url"
    echo "Downloading..."

    curl $url -o $TARGET_PATH/$poiName.png
}

# Check if a parameter is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 [prompt type]"
    exit 1
fi

generate_image "$1" "$2"
