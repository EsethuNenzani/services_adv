module PodsHelper

  def set_pod_limit(locals)
    if locals.has_key? :limit
      locals[:limit]
    else
      nil
    end
  end

  def set_pod_types(locals)
    if locals.has_key? :pod_types
      locals[:pod_types]
    else
      Refinery::Pods::Pod::POD_TYPES
    end
  end

end
