#!/bin/bash
set -e

USER_ID=${UID:-1000}
GROUP_ID=${GID:-1000}

# Create or update group
if ! getent group "$GROUP_ID" >/dev/null 2>&1; then
    groupadd -g "$GROUP_ID" marimo-user 2>/dev/null || true
fi

# Create or update user
if ! id -u "$USER_ID" >/dev/null 2>&1; then
    useradd -m -u "$USER_ID" -g "$GROUP_ID" -s /bin/bash marimo-user 2>/dev/null || true
else
    # User exists, ensure group matches
    EXISTING_USER=$(id -un "$USER_ID" 2>/dev/null || echo "")
    if [ -n "$EXISTING_USER" ]; then
        usermod -g "$GROUP_ID" "$EXISTING_USER" 2>/dev/null || true
    fi
fi

# Ensure /marimo is owned by the target user
chown -R "$USER_ID":"$GROUP_ID" /marimo 2>/dev/null || true

# Run the command as the target user
exec gosu "$USER_ID":"$GROUP_ID" "$@"
