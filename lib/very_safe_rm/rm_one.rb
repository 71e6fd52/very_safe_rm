module VerySafeRm
  # TODO
  module RM
    def self.rm_one(file, args)
      `rm #{args.join ' '} #{file}`
    end
  end
end
