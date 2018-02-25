ActiveAdmin.register SavedBoard do
  permit_params :content, :url

  decorate_with SavedBoardDecorator

  index do
    selectable_column
    column :id

    column :theme
    column :size
    column 'Url' do |board|
      link_to(
        board.url,
        Rails.configuration.frontend_url + 'artefact/' + board.url,
        target: '_blank'
      )
    end
    column :actives, sortable: :actives

    column :created_at

    actions
  end
end
