class UserSession < Authlogic::Session::Base
  single_access_allowed_request_types :any
  # specify configuration here, such as:
  # logout_on_timeout true
  # ...many more options in the documentation
end