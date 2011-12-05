class BasePresenter
  
  # Initializer
  def initialize(object, template)
    @object = object
    @template = template
  end


  # Class Methods  
  def self.inherited(subclass)
    name = subclass.to_s.gsub('Presenter', "").downcase.to_sym
    self.presents(name)
  end
  
  def self.presents(name)
    define_method(name) do
      @object
    end
  end

  
  # Instance Methods
  def h
    @template
  end
  
  def method_missing(*args, &block)
    @template.send(*args, &block)
  end
  
  def handle_none(value, *placeholder)
    if value.present?
      yield
    else
      placeholder.present? ? placeholder.first : content_tag(:span, "Unspecified", class: "none")
    end
  end
  
  def render_markdown(text)
      extensions = { no_intra_emphasis: true, fenced_code_blocks: true, autolink: true, strikethrough: true, space_after_headers: true, superscript: true }
      render_options = { hard_wrap: true }
      markdown = Redcarpet::Markdown.new(SyntaxHighlighter.new(render_options), extensions)
      Redcarpet::Render::SmartyPants.render(markdown.render(text)).html_safe
  end
  
  def snippet(text, length)
    snippet = text.split[0..(length-1)].join(" ")
    snippet = snippet << ellipsis_link if text.split.size > length
    snippet.html_safe
  end
  
  def ellipsis_link
    '... ' + link_to(('continue reading &rarr;').html_safe, post_path(post))
  end
  
  def placeholder_image(size)
    image_tag "http://placehold.it/#{size}"
  end
  
end
