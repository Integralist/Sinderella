require 'singleton'

class DataStore
  include Singleton

  def set(data)
    hash_data = {
      :original    => data[:original],
      :transformed => data[:transformed]
    }

    container.store(data[:id], hash_data)
  end

  def get(id)
    container.fetch(id)
  end

  private

  def container
    @store ||= Hash.new
  end
end
