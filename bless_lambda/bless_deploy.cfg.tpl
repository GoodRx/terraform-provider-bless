[Bless Options]
certificate_validity_after_seconds = 120
certificate_validity_before_seconds = 120
entropy_minimum_bits = 2048
random_seed_bytes = 256
logging_level = {{ .LoggingLevel }}
username_validation = {{ .UsernameValidation }}

[Bless CA]
default_password = {{ .EncryptedPassword }}
ca_private_key = {{ .EncryptedPrivateKey }}

[KMS Auth]
use_kmsauth = True
kmsauth_key_id = {{ .KMSAuthKeyID }}
kmsauth_serviceid = {{ .Name }}
kmsauth_remote_usernames_allowed = ubuntu, ec2-user
kmsauth_iam_group_name_format = {{ .KMSAuthIAMGroupNameFormat }}
