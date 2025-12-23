#!/bin/bash

# run_test_battery.sh - Automated testing battery for code2html

set -u

if [ $# -lt 1 ]; then
    echo "Usage: $0 <repository_url>"
    exit 1
fi

REPO_URL=$1
REPO_NAME=$(basename "$REPO_URL" .git)
CODE2HTML_BIN="$(pwd)/code2html"
START_TIME=$(date +%s)

# Ensure code2html is built
if [ ! -f "$CODE2HTML_BIN" ]; then
    echo "Building code2html..."
    g++ parser.cpp cppparse.cpp -o code2html || { echo "Failed to build code2html"; exit 1; }
fi

echo "Cloning repository $REPO_URL..."
if [ -d "$REPO_NAME" ]; then
    echo "Directory $REPO_NAME already exists. Updating..."
    cd "$REPO_NAME" || exit 1
    git pull
else
    git clone "$REPO_URL" "$REPO_NAME" || { echo "Failed to clone repository"; exit 1; }
    cd "$REPO_NAME" || exit 1
fi

OUTPUT_DIR="code2html_output"
mkdir -p "$OUTPUT_DIR"

echo "Finding C++ files..."
# Extensions to look for
FILES_FIND_CMD="find . -type f \( -name '*.cpp' -o -name '*.h' -o -name '*.hpp' -o -name '*.cc' -o -name '*.cxx' -o -name '*.c' \) -not -path '*/$OUTPUT_DIR/*'"
TOTAL_FILES=$(eval "$FILES_FIND_CMD" | wc -l)

SUCCESS_COUNT=0
FAILURE_COUNT=0
FAILED_FILES=""

echo "Processing $TOTAL_FILES files..."

while IFS= read -r -d '' FILE; do
    # Remove leading ./
    FILE_PATH=${FILE#./}
    
    # Create target directory structure
    TARGET_FILE="$OUTPUT_DIR/$FILE_PATH.html"
    mkdir -p "$(dirname "$TARGET_FILE")"
    
    # Run code2html
    ERR_OUTPUT=$("$CODE2HTML_BIN" "$FILE_PATH" 2>&1 > /dev/null)
    EXIT_CODE=$?
    
    if [ $EXIT_CODE -eq 0 ] && [ -f "$FILE_PATH.html" ]; then
        mv "$FILE_PATH.html" "$TARGET_FILE"
        SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
    else
        FAILURE_COUNT=$((FAILURE_COUNT + 1))
        # Escaping for echo -e
        CLEAN_ERR=$(echo "$ERR_OUTPUT" | tr '\n' ' ')
        FAILED_FILES+="- $FILE_PATH: $CLEAN_ERR\n"
    fi
done < <(eval "$FILES_FIND_CMD -print0")

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

# Generate report
REPORT_FILE="$OUTPUT_DIR/summary_report.md"
{
    echo "# Code2HTML Testing Battery Summary"
    echo ""
    echo "- **Repository**: $REPO_URL"
    echo "- **Date**: $(date)"
    echo "- **Total Files Found**: $TOTAL_FILES"
    echo "- **Successfully Processed**: $SUCCESS_COUNT"
    echo "- **Failed**: $FAILURE_COUNT"
    echo "- **Duration**: ${DURATION}s"
    if [ $TOTAL_FILES -gt 0 ]; then
        AVG_TIME=$(echo "scale=2; $DURATION / $TOTAL_FILES" | bc)
        echo "- **Average Time per File**: ${AVG_TIME}s"
    fi
    echo ""
    
    if [ $FAILURE_COUNT -gt 0 ]; then
        echo "## Failed Files"
        echo -e "$FAILED_FILES"
    else
        echo "## All files processed successfully!"
    fi
} > "$REPORT_FILE"

echo "---------------------------------------"
echo "Testing Battery Completed"
echo "Results saved to $REPO_NAME/$REPORT_FILE"
echo "Summary:"
echo "- Success: $SUCCESS_COUNT"
echo "- Failure: $FAILURE_COUNT"
echo "---------------------------------------"
