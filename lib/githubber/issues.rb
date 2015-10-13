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

# POST /repos/:owner/:repo/issues/:number/comments :body => options.to_json
# https://github.com/rmcwilliam/githubber/issues/2

    def make_comment(owner, repo, number, comment)
      Issues.post("/repos/#{owner}/#{repo}/issues/#{number}/comments",:headers => @auth,:body => {"body" => comment}.to_json) ## needs auth!!! Thats why wasn't working!
    end

    # GET /repos/:owner/:repo/issues
    def list_issues(owner, repo)
      Issues.get("/repos/#{owner}/#{repo}/issues", :headers => @auth) # authentication up's rate/limit here but not necessary
    end
   
    #https://github.com/rmcwilliam/githubber/issues/2   
    # PATCH /repos/:owner/:repo/issues/:number
    def close_issue(owner, repo, number)
      Issues.patch("/repos/#{owner}/#{repo}/issues/#{number}", :headers => @auth) #needs auth
    end
  end 
end


# api = Issues.new("7df3a5d15fa6a42fef0bb325328cfc773f408dde")
# binding.pry
# api.make_comment("rmcwilliam", "githubber", 2,"blah blah")


#comment on an issue
#list issues for a repo 
#close an issue

# def update_user(options={})
#       PullRequests.patch("/user", :headers => @auth, :body => options.to_json)
#     end