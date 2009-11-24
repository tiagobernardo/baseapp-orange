class AdminatorGenerator < Rails::Generator::NamedBase
  def manifest
    targets = file_name.pluralize
    target = file_name.downcase
    target_class= file_name.capitalize
    record do |m|
     # Controllers
     m.template "controller.rb", "app/controllers/admin/#{targets}_controller.rb"

     # create the directory
     m.directory "app/views/admin/#{file_name.pluralize}"
       
     # Views
     m.template "_help.html.erb", "app/views/admin/#{targets}/_help.html.erb"
     m.template "_form.html.erb", "app/views/admin/#{targets}/_form.html.erb"
     m.template "edit.html.erb",  "app/views/admin/#{targets}/edit.html.erb"
     m.template "index.html.erb", "app/views/admin/#{targets}/index.html.erb"
     m.template "new.html.erb",   "app/views/admin/#{targets}/new.html.erb"
     m.template "show.html.erb",  "app/views/admin/#{targets}/show.html.erb" 
    end
  end
end