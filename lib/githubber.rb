require "httparty"
require "pry"

require "githubber/version"
require "githubber/issues"
require "githubber/pull_requests"


module Githubber
  # Your code goes here...
  binding.pry
end
#binding.pry




# api = Issues.new(access token)
# binding.pry
# api.close_issue("rmcwilliam", "githubber", 2)
# api.make_comment("rmcwilliam", "githubber", 1,"blah blah")


