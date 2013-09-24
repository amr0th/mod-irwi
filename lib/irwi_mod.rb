require 'active_support/dependencies'
require 'rails_autolink' if defined?(Rails)

module IrwiMod

  module Formatters
    autoload :BlueCloth, 'irwi_mod/formatters/blue_cloth'
    autoload :RedCloth, 'irwi_mod/formatters/red_cloth'
    autoload :SimpleHtml, 'irwi_mod/formatters/simple_html'
    autoload :WikiCloth, 'irwi_mod/formatters/wiki_cloth'
  end

  module Comparators
    autoload :DiffLcs, 'irwi_mod/comparators/diff_lcs'
    autoload :Base, 'irwi_mod/comparators/base'
    module Spans
      autoload :ChangedSpan, 'irwi_mod/comparators/spans/changed_span'
      autoload :NotChangedSpan, 'irwi_mod/comparators/spans/not_changed_span'
    end
  end

  module Extensions; end

  module Paginators
    autoload :None, 'irwi_mod/paginators/none'
    autoload :WillPaginate, 'irwi_mod/paginators/will_paginate'
  end

  module Support
    autoload :TemplateFinder, 'irwi_mod/support/template_finder'
  end

  def self.config
    require 'irwi_mod/config'

    @@config ||= IrwiMod::Config.new
  end

end

require 'irwi_mod/extensions/controllers'
require 'irwi_mod/extensions/models'
require 'irwi_mod/support/route_mapper' # Routes
require 'irwi_mod/helpers'

ActionController::Base.append_view_path File.expand_path('../../app/views', __FILE__) # Append default views
