require 'active_record'

module IrwiMod::Extensions::Models
  autoload :WikiPage, 'irwi_mod/extensions/models/wiki_page'
  autoload :WikiPageVersion, 'irwi_mod/extensions/models/wiki_page_version'
  autoload :WikiPageAttachment, 'irwi_mod/extensions/models/wiki_page_attachment'
end

ActiveRecord::Base.instance_eval do

  def acts_as_wiki_page( config = {} )
    include IrwiMod::Extensions::Models::WikiPage
  end

  def acts_as_wiki_page_version( config = {} )
    include IrwiMod::Extensions::Models::WikiPageVersion
  end

  def acts_as_wiki_page_attachment
    include IrwiMod::Extensions::Models::WikiPageAttachment
    yield if block_given?
  end

end
