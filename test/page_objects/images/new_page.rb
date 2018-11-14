module PageObjects
  module Images
    class NewPage < PageObjects::Document
      path :new_image
      path :images # from POST to images for failed create

      form_for :image do
        element :url
        element :tag_list
      end

      def create_image!(url: nil, tags: nil)
        self.url.set(url) if url.present?
        tag_list.set(tags) if tags.present?
        node.click_button('Save Image')
        window.change_to(ShowPage, self.class)
      end
    end
  end
end
