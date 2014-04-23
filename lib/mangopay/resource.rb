module MangoPay
  # @abstract
  class Resource
    class << self
      def class_name
        name.split('::')[-1]
      end

      def url(id = nil)
        if self == Resource
          raise NotImplementedError.new('Resource is an abstract class. Do not use it directly.')
        end
        if id
          "/v2/#{MangoPay.configuration.client_id}/#{CGI.escape(class_name.downcase)}s/#{CGI.escape(id.to_s)}"
        else
          "/v2/#{MangoPay.configuration.client_id}/#{CGI.escape(class_name.downcase)}s"
        end
      end
    end
  end
end
