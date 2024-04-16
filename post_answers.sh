#!/bin/bash


    # Define the URL
    urlX="https://getpantry.cloud/apiv1/pantry/44ad991c-adef-4b84-9379-2f101cbff6de/basket/firstGames"

    # Read the contents of foo.json and extract foo.pageProps.answers
    JSON_FILE="combined.json"
    answers=$(jq '.' "$JSON_FILE")

    # Send a POST request with the extracted answers to urlX
    curl -X POST -H "Content-Type: application/json" -d "$answers" "$urlX"

    sleep 3

