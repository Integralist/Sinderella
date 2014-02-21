require 'sinderella/version'
require 'sinderella/data_store'
require 'crimp'

module Sinderella
  def self.transforms(data, till_midnight = 60)
    identifier  = Crimp.signature(data)
    cloned_data = deep_copy data
    transformed = yield cloned_data

    store({
      :id => identifier,
      :original => data,
      :transformed => transformed
    })

    check(identifier, till_midnight)

    identifier
  end

  def self.get(id)
    DataStore.instance.get(id)[:transformed]
  end

  def self.midnight(id)
    reset_data_at(id)
  end

  private

  def self.store(data)
    DataStore.instance.set(data)
  end

  def self.deep_copy(object)
    Marshal.load(Marshal.dump(object))
  end

  def self.check(id, seconds)
    Thread.new { sleep seconds; reset_data_at id }
  end

  def self.reset_data_at(id)
    DataStore.instance.reset(id)
  end
end
