**To launch a privileged session**

The following ``assume-root`` command retrieves a set of short-term credentials you can use to remove a misconfigured Amazon S3 bucket policy for a member account in your organization. ::

    aws sts assume-root \
        --duration-seconds 900 \
        --target-principal 111122223333 \
        --task-policy-arn arn=arn:aws:iam::aws:policy/root-task/S3UnlockBucketPolicy

Output::


The output of the command contains an access key, secret key, and session token that you can use to  to perform privileged actions in the member account. For more information, see `Perform a privileged task on an AWS Organizations member account <https://docs.aws.amazon.com/IAM/latest/UserGuide/id_root-user-privileged-task.html>`__ in the *AWS IAM User Guide*.