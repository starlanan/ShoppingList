#!/bin/bash

WATCH_DIR="/Users/starlanan/Desktop/MSc in AI for Business/Subjects/Customer Engagement and Artificial Intelligence/Projects/Shopping List"

echo "🔄 Auto-sync started for: $WATCH_DIR"

fswatch -o "$WATCH_DIR" | while read event
do
    cd "$WATCH_DIR" || exit

    if ! git diff --quiet; then
        git add .
        git commit -m "Auto-sync $(date '+%Y-%m-%d %H:%M:%S')"
        git pull --rebase origin main
        git push origin main
        echo "✅ Synced at $(date)"
    fi
done


