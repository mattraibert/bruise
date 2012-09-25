require 'highline/import'

module Bruise
  def self.uninstall
    bruises = `brew list`.split("\n")
    bruises = bruises.select {|bruise| /^y/ =~ ask("uninstall #{package}?") }
    bruise.each { |package| puts `brew uninstall #{package}` }
  end

  def self.upgrade
    bruise = `brew outdated`.split("\n")
    bruise = bruise.select { |package| /^y/ =~ ask("upgrade #{package}?") }
    bruise.each {|package| puts `brew upgrade #{package}` }
  end

  def self.deps
    bruises = `brew list`.split("\n")
    bruises.each do |bruise|
      deps = `brew deps #{bruise}`.split("\n").join(", ")
      puts "#{bruise} => [#{deps}]"
    end
  end
end







