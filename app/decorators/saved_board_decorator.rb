class SavedBoardDecorator < Draper::Decorator
  delegate_all

  def size
    pre_size = model.content.split(';').second
    size = pre_size.split('#').second

    size.split('-').join('x')
  end

  def theme
    pre_theme = model.content.split(';').first
    pre_theme.split('#').second
  end

  def actives
    pre_actives = model.content.split(';').last
    pre_expansion = pre_actives.split('#').second

    pre_filter = pre_expansion.gsub(/\:(.)(\d+)\:/) do
      match = Regexp.last_match
      match[1] == '*' ? nil : match[1] * match[2].to_i
    end

    pre_filter.delete('*').length
  end
end
