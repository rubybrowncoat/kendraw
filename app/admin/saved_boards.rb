ActiveAdmin.register SavedBoard do
  permit_params :content, :url

  decorate_with SavedBoardDecorator

  index do
    selectable_column
    column :id

    column :theme
    column :size
    column :url
    column :actives, sortable: :actives

    column :created_at

    actions
  end
end
