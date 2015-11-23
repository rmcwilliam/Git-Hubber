module Githubber
  class Apicalls
    include HTTParty
    base_uri "https://api.github.com"

    def initialize(auth_token)
      @auth = {
        "Authorization" => "token #{auth_token}",
        "User-Agent"    => "HTTParty"
      }
    end

    def create_issue(owner, repo, options={})
      Apicalls.post("/repos/#{owner}/#{repo}/issues", :headers => @auth, :body => options.to_json)
    end

 
    def org_teams(org)
      Apicalls.get("/orgs/#{org}/teams", :headers => @auth)  #Anything to do with organizations or teams requires auth!!
    end

 
    def team_members(id)
      Apicalls.get("/teams/#{id}/members", :headers => @auth)
    end


    def gist_contents(id)
      response = Apicalls.get("/gists/#{id}", :headers => @auth)
      response["files"].values[0]["content"] #could do it this way response["files"]["gistfile1.txt"]["content"] but filename could change
    end
  end
end

#api = Apicalls.new
#api.create_issue("rmcwilliam", "githubber", "title":"Test", "body":"testing testing")