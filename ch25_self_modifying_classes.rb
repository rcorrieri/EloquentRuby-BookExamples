# classes can modify themselves
ENABLE_ENCRYPTION = true

class Document

  def self.enable_encryption( enabled )
    if enabled
      def encrypt_string( string )
        string.tr('a-zA-z', 'm-za-lM-ZA-L')
      end
    else
      def encrypt_string( string )
        string
      end
    end
  end

  enable_encryption( ENABLE_ENCRYPTION )
end
