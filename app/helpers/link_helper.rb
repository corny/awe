module LinkHelper
  
  def add_link(text, url)
    link_to "<i class='icon-plus'></i> #{h text}".html_safe, url, class: 'btn btn-success'
  end
  
end
