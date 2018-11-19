module PageObjects
  module Images
    class EditPage < PageObjects::Document
      path :image

      def image_url
        node.find('img.js-image-tag')['src']
      end

      def tags
        node.find('p#image-tags').text
      end

      def update_image!(tags: nil)
        tag_list.set(tags) if tags.present?
        node.click_button('Save Image')
        window.change_to(ShowPage, self.class)
      end
    end
  end
end
