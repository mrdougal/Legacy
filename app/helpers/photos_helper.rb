module PhotosHelper
  
  def tag_cloud(tags, active_tags, classes)
    max, min = 0, 0
    tags.each { |t|
      max = t.count.to_i if t.count.to_i > max
      min = t.count.to_i if t.count.to_i < min
    }

    divisor = ((max - min) / classes.size) + 1

    tags.each { |t|
      yield t.name, t.count, active_tags.include?(t), classes[(t.count.to_i - min) / divisor]
    }
  end

  
  def show_tags?
    # request.
    params[:action] != 'new'
    # false
  end
  

end
