class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    pair_index = @map.index { |pair| pair[0] == key }
    pair_index ? @map[pair_index][1] = value : @map.push([key, value])
    [key, value]
  end

  def lookup(key)
    @map.each { |kv_pair| return kv_pair[1] if kv_pair[0] == key }
    nil
  end

  def remove(key)
    @map.reject! { |kv_pair| kv_pair[0] == key }
    nil
  end

  def show
    deep_dup(@map) #why do you have to deep_dup???
  end

  private

  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end
end
