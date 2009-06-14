# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_orange_session',
  :secret      => '8383ab6ef34478dc4d96a5526c126a2eb7a377e03020aa9f23e1e022a989532c5e342f8978a75d1cad4ac84b44c5b3d3933ead52861ca67bd1bcbb96d2cfbb56'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
