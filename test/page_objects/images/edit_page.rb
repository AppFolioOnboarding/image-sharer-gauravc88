module PageObjects
  module Images
    class EditPage < PageObjects::Document
      path :edit_image
      path 'images#update' # from POST to images for failed create

      form_for :image do
        element :url
        element :tag_list
      end

      def update_image!(tags: nil)
        tag_list.set(tags)
        node.click_button('Save Image')
        window.change_to(EditPage, ShowPage)
      end
    end
  end
end
