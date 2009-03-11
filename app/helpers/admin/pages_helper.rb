module Admin::PagesHelper

  def draw_table_for_childs_of(page)
    html=""
    html+="<tr id='node-#{page.id}'" 
    html+= "class='child-of-node-#{page.parent_id}'>" if !page.parent_id.nil? 
   	html+="<td>#{ link_to h(page.name), admin_page_url(page)}</td>
   	      <td>#{human_state page.state}</td>
   	       <td>#{page.language}</td>
   	      <td>#{data_pt page.created_at}</td>
       <td class='actions'>
       #{ link_to 'Editar', edit_admin_page_path(page) }	
   		#{link_to 'Apagar', admin_page_url(page), :method => :delete, :confirm => 'Tem a certeza?'}		
   	</td>
    </tr>"
    for child in page.children
      html+= draw_table_for_childs_of child
    end
    return html
  end

end
