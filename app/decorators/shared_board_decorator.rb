class SharedBoardDecorator < Draper::Decorator
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
    model.shared_actives.length
  end

  def latest_activity
    if (latest = model.shared_actives.order(updated_at: :desc).first)
      latest.updated_at
    else
      model.created_at
    end
  end
end
