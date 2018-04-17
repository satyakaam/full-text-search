module HomeHelper
  def description_link_with_highlights(document)
    if document.respond_to?(:highlights).present?
      description = highlight document.description, Regexp.new(document.highlights.join("|"))
    else
      description = document.description
    end
    link_to(description, document_path(document))
  end
end