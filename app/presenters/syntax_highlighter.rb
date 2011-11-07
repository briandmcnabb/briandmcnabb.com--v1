class SyntaxHighlighter < Redcarpet::Render::HTML
  def block_code(code, language)
    CodeRay.scan(code, language).html(:wrap => :div)
  end
end