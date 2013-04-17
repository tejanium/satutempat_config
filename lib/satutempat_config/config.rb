module Satutempat
  class Config
    include Mongoid::Document
    include Mongoid::Timestamps

    GLOBAL_NAMESPACE = :global

    with_options type: String do |string|
      string.field :namespace, default: GLOBAL_NAMESPACE
      string.field :key
      string.field :value
    end
  end
end
