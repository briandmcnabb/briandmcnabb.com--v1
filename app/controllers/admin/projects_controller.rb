class Admin::ProjectsController < Admin::ResourceController
  belongs_to :client, :optional => true
end