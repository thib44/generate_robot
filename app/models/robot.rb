class Robot < ActiveRecord::Base
  validates :url, uniqueness: true
  validates :url, presence: true

  def self.generate_the_robot_file
    path = "public/robots.txt"
    excludes = Robot.all
    content = excludes.map { |i| "Disallow: " + i.url }.join("\n")
    File.open(path, "w+") do |f|
      f.write( "User-agent: * \n" + content)
    end
  end
end
