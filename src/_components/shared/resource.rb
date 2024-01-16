class Shared::Resource < Bridgetown::Component
  def initialize(entry:, cluster:, meta: 'Take Action')
    @entry, @cluster,@meta = entry, cluster, meta
  end

  def render?
    return false if @entry.nil?
    return false if @cluster.nil?
    true
  end
end
