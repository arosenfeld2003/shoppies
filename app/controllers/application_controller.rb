class ApplicationController < ActionController::Base
  @nominations_full = Nomination.all.length == 5 ? true : false
end
