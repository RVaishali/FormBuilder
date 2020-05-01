# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_student_session',
  :secret      => 'c6227fe27b61029f8ec81d9aa8d32dee294b51fb98701e1eec90744df8b1ea35bb38c9bd361f1b27610f8425931b74927ba64292bab7e56503db7506fe7effc5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
