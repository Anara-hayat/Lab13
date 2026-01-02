#!/bin/bash

USERNAME=$1
PASSWORD=$2

# Create login profile for IAM user
aws iam create-login-profile \
  --user-name "$USERNAME" \
  --password "$PASSWORD" \
  --password-reset-required 2>/dev/null || \
aws iam update-login-profile \
  --user-name "$USERNAME" \
  --password "$PASSWORD" \
  --no-password-reset-required

echo "Login profile created/updated for user: $USERNAME"
