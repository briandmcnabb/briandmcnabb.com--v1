class Admin::SkillsController < Admin::ResourceController
  belongs_to :service

  def sort
    params[:faq].each_with_index do |id, index|
      Skill.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
end