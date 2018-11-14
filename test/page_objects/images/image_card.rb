module PageObjects
  module Images
    class ImageCard < AePageObjects::Element
      def url
        node.find('img')[:src]
      end

      def tags
        node.find('p')['text']
      end

      def click_tag!(tag_name)

      end
    end
  end
end
