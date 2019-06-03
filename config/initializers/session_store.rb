
# Be sure to restart your server when you modify this file.

MedTracker::Application.config.session_store :cookie_store,
  :key => '_medtracker_session',
  :expire_after => 15.minutes