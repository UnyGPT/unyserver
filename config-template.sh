# CONFIG

PROJECT_NAME="foo"
PROJECT_DOMAIN="foo.com"

PROJECT_DIR="/home/$PROJECT_NAME"
PROJECT_LOG_DIR="/var/log/$PROJECT_NAME"

PROJECT_API_DIR="$PROJECT_DIR/${PROJECT_NAME}_api"
PROJECT_UI_DIR="$PROJECT_DIR/${PROJECT_NAME}_ui"
PROJECT_CACHE_DIR="$PROJECT_DIR/${PROJECT_NAME}_files_cache"

GCS_BUCKET_RELEASES="${PROJECT_NAME}_releases"
