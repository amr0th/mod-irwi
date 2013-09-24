require 'irwi_mod/comparators/spans/changed_span'
require 'irwi_mod/comparators/spans/not_changed_span'

class IrwiMod::Comparators::Base

  def render_changes( old_text, new_text )
    build_changes( old_text, new_text ).join('').gsub( /\r?\n/, '<br />' )
  end

  protected

  def new_not_changed( value )
    IrwiMod::Comparators::Spans::NotChangedSpan.new( value )
  end

  def new_changed( action, old_value, new_value )
    IrwiMod::Comparators::Spans::ChangedSpan.new( action, old_value, new_value )
  end

end
