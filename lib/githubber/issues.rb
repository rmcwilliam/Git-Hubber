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

    def make_comment(owner, repo, number, comment)
      Issues.post("/repos/#{owner}/#{repo}/issues/#{number}/comments",:headers => @auth,:body => {"body" => comment}.to_json) 
    end   

    def list_issues(owner, repo)
      Issues.get("/repos/#{owner}/#{repo}/issues", :headers => @auth) 
    end   
                
    def close_issue(owner, repo, number, options={})
      Issues.patch("/repos/#{owner}/#{repo}/issues/#{number}",:headers => @auth, :body => options.to_json) 
    end
  end 
end
