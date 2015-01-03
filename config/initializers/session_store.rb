# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, key: '_business-tracker_session'
BusinessTracker::Application.config.session_store :redis_store
