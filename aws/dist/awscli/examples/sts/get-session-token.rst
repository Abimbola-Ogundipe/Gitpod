**To get a set of short term credentials for an IAM identity**

The following ``get-session-token`` command retrieves a set of short-term credentials for the IAM identity making the call. The resulting credentials can be used for requests where multi-factor authentication (MFA) is required by policy. The credentials expire 15 minutes after they are generated. ::

    aws sts get-session-token \
        --duration-seconds 900 \
        --serial-number "YourMFADeviceSerialNumber" \
        --token-code 123456
