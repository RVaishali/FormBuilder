# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_formbuilder_session',
  :secret      => 'b59f169aa6a65ed2a1f681b8863296ce42f1f1d581156b5f431118879340f5b6335b5851e7ce10ad41ab21bc75b1285927b119e0800bb0359b2678b2e34ce74c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
