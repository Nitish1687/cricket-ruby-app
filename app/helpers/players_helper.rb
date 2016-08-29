require 'redcloth'

module PlayersHelper
  def handleMarkup(text)
    text.nil? ? '' : RedCloth.new(text).to_html
  end
end
