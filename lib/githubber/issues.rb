module Githubber
  class Issues
    include HTTParty
    base_uri "https://api.github.com"

    def initialize(auth_token)
      @auth = {
        "Authorization" => "token #{auth_token}",
        "User-Agent"    => "HTTParty"
      }
    end

# POST /repos/:owner/:repo/issues/:number/comments 
# https://github.com/rmcwilliam/githubber/issues/2

    def make_comment(owner, repo, number, comment)
      Issues.post("/repos/#{owner}/#{repo}/issues/#{number}/comments",:headers => @auth,:body => {"body" => comment}.to_json) ## needs auth!!! Thats why wasn't working!
    end

    # GET /repos/:owner/:repo/issues
    def list_issues(owner, repo)
      Issues.get("/repos/#{owner}/#{repo}/issues", :headers => @auth) # authentication up's rate/limit here but not necessary
    end
   
    #https://github.com/rmcwilliam/githubber/issues/2   
    # PATCH /repos/:owner/:repo/issues/:number                # api.close_issue("rmcwilliam", "githubber", 1, "state":"closed")
    def close_issue(owner, repo, number, options={})
      Issues.patch("/repos/#{owner}/#{repo}/issues/#{number}",:headers => @auth, :body => options.to_json) #needs auth
    end
  end 
end


# api = Issues.new(access token)
# binding.pry
# api.make_comment("rmcwilliam", "githubber", 2,"blah blah")


#comment on an issue
#list issues for a repo 
#close an issue

# def update_user(options={})
#       PullRequests.patch("/user", :headers => @auth, :body => options.to_json)
#     end