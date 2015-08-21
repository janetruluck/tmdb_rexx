module MovieRexx
  class InvalidAPIKeyError < StandardError; end
  class MissingAPIKeyError < StandardError; end
  class InvalidTypeError < StandardError; end
  class InvalidExternalSourceError < StandardError; end
end
