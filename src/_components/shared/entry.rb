class Shared::Entry < Bridgetown::Component
  def initialize(entry:, cluster:, meta: '')
    @entry, @cluster,@meta = entry, cluster, meta
  end

  def render?
    return false if @entry.nil?
    return false if @cluster.nil?
    true
  end
end

