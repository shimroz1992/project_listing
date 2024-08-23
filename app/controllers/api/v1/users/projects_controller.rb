class Api::V1::ProjectsController < ApplicationController
 def index
 	user_projects = UserProject.where(user_id: params[:user_id])
    render json: serialize_response
 end

 def serialize_response
 	response = []
 	user_projects.each do |user_project|
 	   response << project_hash(user_project)
 	end
 	response
 end

 def project_hash(user_project)
 	{project_id: user_project.project_id, progress: user_project.progess, options: user_project.options}
 end
end
