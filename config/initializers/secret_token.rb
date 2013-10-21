# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Mailman::Application.config.secret_key_base = 'f8a2bd01dff71530ef0064412466f6d76baf65264be631b58ec3cf5446d8209a5510a6926e7aaf3ade68c75073da6b7dce65c930a762799570096f5572198db1'
