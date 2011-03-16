# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_devise_test_session',
  :secret      => '459fe2d5c8aa1b32934176a1aacb311edafdf5a962e237663f2d19f6944ac5782a55494d6b379eda23dc5246acf63f33b735462a5de7a77404974421daffca47'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
