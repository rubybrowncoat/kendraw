# frozen_string_literal: true

ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    columns do
      column do
        panel 'Recent Artefacts' do
          table_for SavedBoard.order('created_at desc').limit(5) do
            column :id
            column 'Url' do |board|
              link_to(
                board.url,
                admin_saved_boards_path(q: { url_eq: board.url })
              )
            end
            column :created_at
          end
        end
      end

      column do
        panel 'Recent Communes' do
          table_for SharedBoard.order('created_at desc').limit(5) do
            column :id
            column 'Url' do |board|
              link_to(
                board.url,
                admin_shared_boards_path(q: { url_eq: board.url })
              )
            end
            column :created_at
          end
        end
      end
    end

    # div class: 'blank_slate_container', id: 'dashboard_default_message' do
    #   span class: 'blank_slate' do
    #     span I18n.t('active_admin.dashboard_welcome.welcome')
    #     small I18n.t('active_admin.dashboard_welcome.call_to_action')
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end
end
