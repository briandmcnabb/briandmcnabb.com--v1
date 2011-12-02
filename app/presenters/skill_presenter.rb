class SkillPresenter < BasePresenter  
  def name
    handle_none skill.name do
      content_tag(:li, skill.name)
    end
  end
end