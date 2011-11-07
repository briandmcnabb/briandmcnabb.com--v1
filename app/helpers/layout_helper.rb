module LayoutHelper
  
  # Nested Layouts Helper  
  def parent_layout(layout)
    render :template => "layouts/#{layout}"
  end
  
  
  # Set title
  def title(page_title, show_title = true)
    content_for(:title) { h(page_title.to_s) }
    @show_title = show_title
  end
  
  def show_title?
    @show_title
  end

    
end