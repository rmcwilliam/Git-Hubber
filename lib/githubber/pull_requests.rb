module Githubber
  class PullRequests
    include HTTParty
    base_uri "https://api.github.com"

    def initialize(auth_token)
      @auth = {
        "Authorization" => "token #{auth_token}",
        "User-Agent"    => "HTTParty"
      }
    end

    def get_pr(owner, repos, number)
    	PullRequests.get("/repos/#{owner}/#{repo}/pulls/#{number}", header: @auth)
    end

    def create_pr(owner, repo, options={})
    	PullRequests.post("/repos/#{owner}/#{repo}/pulls", header: @auth, body: options.to_json)
    end

    def pr_merged?(owner, repo, number)
    	PullRequests.post("/repos/#{owner}/#{repo}/pulls/#{number}/merge", header: @auth)
    end
  end
end