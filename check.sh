#!/bin/bash
# Purpose           - Bash script to to delete the last 3 lines of a file..
# Owner             - Nithin Reddy
# Modification Date - 16/05/2026
# !/bin/bash

#!/bin/bash

FILE="/tmp/myfile.txt"

# Create sample file
cat > "$FILE" << 'LINES'
Line 1: Server started
Line 2: User logged in
Line 3: Backup completed
Line 4: ERROR: Timeout
Line 5: ERROR: Retry failed
Line 6: ERROR: Service down
LINES

echo "========================="
echo "  DELETE LAST 3 LINES"
echo "========================="
echo "File = $FILE"
echo "-------------------------"
echo "BEFORE:"
cat -n "$FILE"
echo "-------------------------"

TOTAL=$(wc -l < "$FILE")
cp "$FILE" "${FILE}.bak"
head -n $(( TOTAL - 3 )) "$FILE" > "${FILE}.tmp" && mv "${FILE}.tmp" "$FILE"

echo "AFTER:"
cat -n "$FILE"
echo "-------------------------"
echo "Lines Before : $TOTAL"
echo "Lines After  : $(wc -l < "$FILE")"
echo "Backup File  : ${FILE}.bak"
echo "========================="

