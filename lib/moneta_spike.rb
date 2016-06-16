require 'moneta'
require 'digest'

class MonetaSpike

  attr_reader :store

  def initialize external_system
    @external_system = external_system
    @store = Moneta::Expires.new(Moneta.new(:File, dir: "/tmp/moneta-gem-spike"), {expires: true } )      
    @md5 = Digest::MD5.new
  end

  def do_something params
    if !store.key?(key(params))
      response = @external_system.do_something(params)
      seconds = 10
      store.store(key(params), response, expires: seconds)
    end
    store[key(params)]
  end

  private
  
  def key(params)
    @md5.digest(params)
  end

end