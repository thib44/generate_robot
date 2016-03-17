ActiveAdmin.register Robot do

  label: 'Manage the robot'

  config.comments = false
  permit_params :url

  controller do
    def create
      params[:robot][:url].each do |address|
        if address.present?
          Robot.create(url: address)
        end
      end
      redirect_to url_for(action: :index)
    end
  end

  action_item only: :index do
    link_to "Generate the file robot.txt", generate_file_administration_robots_path, method: :patch
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    columns do
      column do
        f.inputs "Add a route to exclude" do
          @x = Rails.application.routes.named_routes.helpers.select {|x| x =~ /path/}.map do |x|
              send(x) rescue nil
          end.compact
            f.input :url, as: :check_boxes, collection: @x
          f.actions
        end
      end
    end
  end

  collection_action :generate_file, method: :patch do
    Robot.generate_the_robot_file
    redirect_to url_for(action: :index)
  end

end
