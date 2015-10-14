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

    #POST /repos/:owner/:repo/issues/title/body   "title":"....","Body":"......"
    def create_issue(owner, repo, options={})
      Apicalls.post("/repos/#{owner}/#{repo}/issues", :headers => @auth, :body => options.to_json)
    end

    #GET /orgs/:org/teams
    def org_teams(org)
      Apicalls.get("/orgs/#{org}/teams", :headers => @auth)  #Anything to do with organizations or teams requires auth!!
    end

    #GET /teams/:id/members
    def team_members(id)
      Apicalls.get("/teams/#{id}/members", :headers => @auth)
    end

    #GET /gists/:id
    def gist_contents(id)
    response = Apicalls.get("/gists/#{id}", :headers => @auth)
    response["files"].values[0]["content"] 
    # Access hash response, return values/contents of key files, then returning values of the very first 
    # key which contained key content which we then return.
    end
    

  end
end


#api = Apicalls.new("4458a1734ce4f464b3e3ae0f71c1849faa4d36c2")
#api.create_issue("rmcwilliam", "githubber", "title":"Test", "body":"testing testing")