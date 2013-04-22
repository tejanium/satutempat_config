module Satutempat
  class Config
    include ::Mongoid::Document
    include ::Mongoid::Timestamps

    with_options type: String do |string|
      string.field :key
      string.field :value
      string.field :description
    end

    with_options presence: true do |presence|
      presence.validates :key, format: /\A[a-zA-Z]+[\w_.]*\z/
    end

    def self.set key, value, description=''
      (get_instance(key) || new(key: key)).tap do |config|
        config.value       = value
        config.description = description
      end.save
    end

    def self.get_instance key
      where(key: key).first
    end

    def self.get key
      get_instance(key).try :value
    end

    def self.import file_path
      create_from_hash YAML.load_file file_path
    end

    def self.export file_destination
      File.open(file_destination, 'w') do |out|
        YAML.dump to_hash, out
      end
    end

    def self.to_hash
      all.to_a.map(&:to_hash).inject(&:deep_merge)
    end

    def to_hash
      inversed_keys = key.split('.').reverse
      hash          = { inversed_keys.shift => value }

      inversed_keys.inject(hash) do |memo, namespaced_key|
        { namespaced_key => memo }
      end
    end

    private
      def self.create_from_hash hash, namespace=nil
        namespaced = "#{ namespace }." if namespace

        hash.each do |key, value|
          namespaced_key = "#{ namespaced }#{ key }"

          if value.is_a? Hash
            create_from_hash value, namespaced_key
          else
            set namespaced_key, value
          end
        end
      end
  end
end
