# frozen_string_literal: true

require "terraspace_ci_codebuild/autoloader"
TerraspaceCiCodebuild::Autoloader.setup

require "json"

module TerraspaceCiCodebuild
  class Error < StandardError; end
end

require "terraspace"
Terraspace::Cloud::Ci.register(
  name: "codebuild",
  env_key: "CODEBUILD_CI",
  root: __dir__,
  exe: ".cody/bin",
)
