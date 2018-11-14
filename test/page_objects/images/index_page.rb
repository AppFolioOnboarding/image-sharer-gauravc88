module PageObjects
  module Images
    class IndexPage < PageObjects::Document
      path :images

      collection :images, locator: '.card-columns', item_locator: '.card', contains: ImageCard do
        def view!
          # TODO
        end
      end

      def add_new_image!
        node.click_on('New Image')
        window.change_to(NewPage)
      end

      def showing_image?(url:, tags: nil)
        images.any? do |card|
          card.url == url &&
            (tags.blank? || card.tag_list == tags)
        end
      end

      def clear_tag_filter!
        # TODO
      end
    end
  end
end
