ActiveAdmin.register SharedBoard do
  permit_params :content, :url
  remove_filter :shared_actives

  decorate_with SharedBoardDecorator

  index do
    selectable_column
    column :id

    column :theme
    column :size
    column 'Url' do |board|
      link_to(
        board.url,
        Rails.configuration.frontend_url + 'commune/' + board.url,
        target: '_blank'
      )
    end
    column :actives, sortable: :actives

    column :latest_activity, sortable: :latest_activity

    actions
  end
end
