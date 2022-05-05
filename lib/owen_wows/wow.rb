# frozen_string_literal: true

require "hashie/extensions/merge_initializer"
require "hashie/extensions/method_access"
module OwenWows
  class Wow < Hash
    include Hashie::Extensions::MergeInitializer
    include Hashie::Extensions::MethodAccess
  end
end
