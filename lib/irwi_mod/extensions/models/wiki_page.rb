module IrwiMod::Extensions::Models::WikiPage

  module ClassMethods

    def find_by_path_or_new( path )
      self.find_by_path( path ) || self.new( :path => path, :title => CGI::unescape(path) )
    end

  end

  module InstanceMethods

    # Retrieve number of last version
    def last_version_number
      last = versions.first
      last ? last.number : 0
    end

    protected

    def create_new_version
      n = last_version_number

      v = versions.build
      v.attributes = attributes.slice( *v.attribute_names )
      v.comment = comment
      v.number = n + 1
      v.save!
    end

  end

  def self.included( base )
    base.send :extend, IrwiMod::Extensions::Models::WikiPage::ClassMethods
    base.send :include, IrwiMod::Extensions::Models::WikiPage::InstanceMethods

    base.attr_protected :id

    base.send :attr_accessor, :comment, :previous_version_number

    base.belongs_to :creator, :class_name => IrwiMod.config.user_class_name
    base.belongs_to :updator, :class_name => IrwiMod.config.user_class_name

    base.has_many :versions, :class_name => IrwiMod.config.page_version_class_name, :foreign_key => IrwiMod.config.page_version_foreign_key, :order => 'id DESC'

    if IrwiMod::config.page_attachment_class_name
      base.has_many :attachments, :class_name => IrwiMod.config.page_attachment_class_name, :foreign_key => IrwiMod.config.page_version_foreign_key
    end

    base.before_save {|record| record.content = '' if record.content.nil? }
    base.before_save {|record| record.path = record.title} #Change by RH - I have to save the path
    base.after_save :create_new_version
  end

end
