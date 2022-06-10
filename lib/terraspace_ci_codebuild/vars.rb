require "uri"

module TerraspaceCiCodebuild
  class Vars
    # Interface method. Hash of properties to be stored
    # Usually available from env vars.
    # Provide as many CI system as possible.
    def data
      {
        build_system: "codebuild",
        host: host,
        full_repo: full_repo,
        branch_name: ENV['CODEBUILD_SOURCE_VERSION'],
        # urls
        build_url: ENV['CODEBUILD_BUILD_URL'],
        build_id: ENV['CODEBUILD_BUILD_ID'],
        build_number: ENV['CODEBUILD_BUILD_NUMBER'],
        build_type: "push", # not available from env var. hard coded and really only type supported
        sha: ENV['CODEBUILD_RESOLVED_SOURCE_VERSION'],
        # commit_message: ENV['REPLACE_ME'],
        # pr_url: ENV['REPLACE_ME'],
        # pr_number: ENV['REPLACE_ME'],
      }
    end

    def host
      uri = URI(ENV['CODEBUILD_SOURCE_REPO_URL']) # https://github.com/ORG/REPO
      "#{uri.scheme}://#{uri.host}"
    end

    # ORG/REPO
    def full_repo
      uri = URI(repo_url)
      uri.path.sub(/^\//,'')
    end

    # https://github.com/ORG/REPO
    def repo_url
      # https://github.com/ORG/REPO.git
      ENV['CODEBUILD_SOURCE_REPO_URL'].sub('.git','')
    end
  end
end
