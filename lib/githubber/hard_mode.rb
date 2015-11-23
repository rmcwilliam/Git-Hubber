module Githubber
  class Hardmode
    include HTTParty
    base_uri "https://api.github.com"

    def initialize(auth_token)
      @auth = {
        "Authorization" => "token #{auth_token}",
        "User-Agent"    => "HTTParty"
      }
    end

    # Write a method that takes an organization name
    # GET/orgs/:org    # name: TIY-ATL-ROR-2015-Sep  # ID: 13770515 
    def organization_name(org)
      Hardmode.get("/orgs/#{org}", :headers => @auth)
    end
        
    # Method team name    
    # GET/orgs/:org/teams      # name: Students  # ID: 1753369
     def org_teams(org)
      Hardmode.get("/orgs/#{org}/teams", :headers => @auth)
    end
     
    
    # Method get gist
    #GET /gists/:id             gist id: dfabc6af32d59ffa43e2
    def gist_id(id)
      Hardmode.get("/gists/#{id}", :headers => @auth)
    end


    #GET /teams/:id/members  # ID: 1753369  # get logins for each member 
    def team_members(id)
      Hardmode.get("/teams/#{id}/members", :headers => @auth) 
        list = results.map do |result|
                result["login"]
               end
            list
    end

    # Method assign issues                       
    def post_issue(owner, reop, options={})
      Hardmode.post("/repos/#{owner}/#{repo}/issues", :headers => @auth, :body => options.to_json)
    end

    def create_all_homework()
      members = team_members
      members.each do |member|
        post_issue(owner, repo, )
      end
    end
  end
end




  
