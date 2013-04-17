module Satutempat
  class Config
    include ::Mongoid::Document
    include ::Mongoid::Timestamps

    with_options type: String do |string|
      string.field :key
      string.field :value
      string.field :description
    end

    def self.set key, value, description=''
      (get(key) || new(key: key)).tap do |config|
        config.value       = value
        config.description = description
      end.save
    end


    def self.get key
      where(key: key).first rescue nil
    end

    def self.import file_path
      create_from_hash YAML.load_file file_path
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
