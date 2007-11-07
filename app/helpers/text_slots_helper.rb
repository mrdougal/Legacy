module TextSlotsHelper

  def editable_content(options)
    options[:content] = { :element => 'span' }.merge(options[:content])
    options[:url] = {}.merge(options[:url])
    options[:ajax] = { :okText => "'Save'", :cancelText => "'Cancel'"}.merge(options[:ajax] || {})
    script = Array.new
    script << "new Ajax.InPlaceEditor("
    script << "  '#{options[:content][:options][:id]}',"
    script << "  '#{url_for(options[:url])}',"
    script << "  {"
    script << options[:ajax].map{ |key, value| "#{key.to_s}: #{value}" }.join(", ")
    script << "  }"
    script << ")"

    content_tag(
      options[:content][:element],
      options[:content][:text],
      options[:content][:options]
    ) + javascript_tag( script.join("\n") )
  end
  
  def inline_slot_editor(message)
    if logged_in?
  	editable_content(
  		:content => {
  			:element => 'span',
  			:text => message.body_html,
  			:options => {
  				:id => "text_slot#{message.id}",
  				:class => 'editable-content'
  			}},
  		:url => {:controller => 'text_slots',:action => 'set_message_body',:id => message.id
  		},:ajax => {
  			:rows => '10',
  			:okText => "'Update text'",
  			:cancelText => "'Cancel'", 
  			:loadTextURL => "'#{ url_for :controller => 'text_slots', :action => 'get_message_body', :id => message.id }'"
  		})  
  	else
  		message.body_html
  	end
  end
  
end
