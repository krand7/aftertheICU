module Admin::ConsentFormsHelper
  def simple_markdown(text)
    result = ''
    markdown = Redcarpet::Markdown.new( Redcarpet::Render::HTML, no_intra_emphasis: true, fenced_code_blocks: true, autolink: true, strikethrough: true, superscript: true, tables: true, lax_spacing: true, space_after_headers: true, underline: true, highlight: true, footnotes: true )
    result = markdown.render(text.to_s)
    result = result.encode('UTF-16', undef: :replace, invalid: :replace, replace: "").encode('UTF-8')
    result = target_link_as_blank(result)
    result.html_safe
  end

  def target_link_as_blank(text)
    text.to_s.gsub(/<a(.*?)>/m, '<a\1 class="content-link" target="_blank">').html_safe
  end
end
