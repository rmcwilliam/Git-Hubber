require "httparty"
require "pry"


require "githubber/api_calls"
require "githubber/version"
require "githubber/issues"
require "githubber/hard_mode"
require "githubber/pull_requests"


module Githubber

end

# api = Issues.new(access token)
# api.close_issue("rmcwilliam", "githubber", 2, "state":"closed")
# api.make_comment("rmcwilliam", "githubber", 1,"blah blah")


