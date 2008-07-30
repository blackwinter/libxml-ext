module LibXML

  module XML

    module XQuery

      module Version

        MAJOR = 0
        MINOR = 0
        TINY  = 9

        class << self

          # Returns array representation.
          def to_a
            [MAJOR, MINOR, TINY]
          end

          # Short-cut for version string.
          def to_s
            to_a.join('.')
          end

        end

      end

      VERSION = Version.to_s

    end

  end

end