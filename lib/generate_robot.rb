require "generate_robot/version"

module GenerateRobot
  # Your code goes here...
  desc 'GenerateRobot Install'

  def welcome
    say 'Installing GenerateRobot gem...'
  end

  def copy_migrations
    say 'Copying migrations, please make sure to `rake db:migrtae`'
    rake 'generate_robot:install:migrations'
  end

  def copy_admin
    say 'Copying configuration of admin'
    copy_file 'admin/robot.rb', 'app/admin/robot.rb'
  end

end
