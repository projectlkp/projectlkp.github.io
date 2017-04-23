module BlogsHelper
  include GithubShellHelper
  def create_blog(resource,name)
    blog=Blog.new
    blog.user_id=resource.id
    blog.name=name
    blog.url="#{Rails.configuration.lkp['base_url']}/#{name}"
    blog.path="all_projects/#{name}"
    blog.theme="#{Rails.configuration.lkp['default_theme']}"
    blog.description="#{Rails.configuration.lkp['default_description']}"
    blog.about="#{Rails.configuration.lkp['default_about']}"
    blog.twitter="#{Rails.configuration.lkp['default_twitter']}"
    blog.email="#{Rails.configuration.lkp['default_email']}"
    blog.save!
    blog.update_about
    blog.update_config
    deploy_github(blog)
  end
end
