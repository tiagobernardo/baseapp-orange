class AdminatorGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|


     # Controllers
     m.template "controller.rb", "app/controllers/admin/#{file_name.pluralize}_controller.rb"

     # create the directory
     m.directory "app/views/admin/#{file_name.pluralize}"
       
     # Views
     m.template "_help.html.erb", "app/views/admin/#{file_name.pluralize}/_help.html.erb"
     m.template "_form.html.erb", "app/views/admin/#{file_name.pluralize}/_form.html.erb"
     m.template "edit.html.erb", "app/views/admin/#{file_name.pluralize}/edit.html.erb"
     m.template "index.html.erb", "app/views/admin/#{file_name.pluralize}/index.html.erb"
     m.template "new.html.erb", "app/views/admin/#{file_name.pluralize}/new.html.erb"
     m.template "show.html.erb", "app/views/admin/#{file_name.pluralize}/show.html.erb"
   
    end
  end
end