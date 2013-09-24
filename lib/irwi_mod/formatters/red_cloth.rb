class IrwiMod::Formatters::RedCloth

  def initialize
    require 'RedCloth'
  end

  def format( text )
    RedCloth.new( text ).to_html
  end

end
