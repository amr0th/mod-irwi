module IrwiMod::Helpers
  autoload :WikiPagesHelper, 'irwi_mod/helpers/wiki_pages_helper'
  autoload :WikiPageAttachmentsHelper, 'irwi_mod/helpers/wiki_page_attachments_helper'
end

Module.class_eval do

  def acts_as_wiki_pages_helper( config = {} )
    include IrwiMod::Helpers::WikiPagesHelper
    include IrwiMod::Helpers::WikiPageAttachmentsHelper if IrwiMod::config.page_attachment_class_name
  end

end
