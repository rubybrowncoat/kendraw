ActiveAdmin.register SharedBoard do
  permit_params :content, :url

  decorate_with SharedBoardDecorator

  index do
    selectable_column
    column :id

    column :theme
    column :size
    column :url
    column :actives, sortable: :actives

    column :latest_activity, sortable: :latest_activity

    actions
  end
end
