require 'action_controller'

module IrwiMod::Extensions::Controllers
  autoload :WikiPages, 'irwi_mod/extensions/controllers/wiki_pages'
  autoload :WikiPageAttachments, 'irwi_mod/extensions/controllers/wiki_page_attachments'
end

ActionController::Base.instance_eval do

  # @param config [Hash] config for controller class
  # @option page_class
  #
  def acts_as_wiki_pages_controller( config = {} )
    include IrwiMod::Extensions::Controllers::WikiPages
    include IrwiMod::Extensions::Controllers::WikiPageAttachments if IrwiMod::config.page_attachment_class_name
  end

end
