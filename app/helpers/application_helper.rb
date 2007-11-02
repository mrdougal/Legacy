# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def title(msg)
    content_for(:title){
      "#{msg} :: "
    }
  end
  

  
  
  def photo_tag(photo, options = {})
    
    options.assert_valid_keys(:size)
    options.reverse_merge! :size => 'large'

    image_tag(photo.file.instance_eval(options[:size]).url,{
                    :alt => photo.title, 
                    :class => 'photo'})
  end
  
  
  private
  
  def my_controller(url)
    
    if request.path_parameters[:controller].to_s == url
      return 'current'
    end   
  end
  
  def my_page(url)
    if current_page?(url)
      return 'current'
    end
  end
  

  
end
