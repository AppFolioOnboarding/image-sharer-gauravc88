module PageObjects
  module Images
    class ShowPage < PageObjects::Document
      path :image

      def image_url
        node.find('img.js-image-tag')['src']
      end

      def tags
        node.find('p#image-tags').text
      end

      def delete
        delete_button = node.find('a.js-delete-image-link')
        delete_button.click
        yield node.driver.browser.switch_to.alert
      end

      def delete_and_confirm!
        delete(&:accept)
        window.change_to(IndexPage)
      end

      def edit
        edit_button = node.find('a.js-edit-image-link')
        edit_button.click
        window.change_to(EditPage)
      end

      def go_back_to_index!
        all_images = node.find('a#all-images-tab')
        all_images.click
        window.change_to(IndexPage)
      end
    end
  end
end
