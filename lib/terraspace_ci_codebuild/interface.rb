module TerraspaceCiCodebuild
  class Interface
    # required interface
    def vars
      Vars.new.data
    end
  end
end
