module GithubShellHelper
  def create_github_repo(resource)
    # new project repo on github
    `cd scripts && create.sh #{resource.username} #{Rails.configuration.lkp['gitusername']} #{ENV['token']}`
    # copy default files to new folder named against username
    `cp -R default/ all_projects/#{resource.username}`
    # intializing git and pushing first commit
    `cd all_projects/#{resource.username} && git init && git add --all && git checkout -b #{Rails.configuration.lkp['branch']} && git commit -m "first commit" && git remote add origin git@github.com:#{Rails.configuration.lkp['gitusername']}/#{resource.username} && git push -u origin #{Rails.configuration.lkp['branch']}`
  end

  def deploy_github(blog)
    `cd all_projects/#{blog.name} && git add --all && git commit -m "new commit" && git push origin #{Rails.configuration.lkp['branch']}`
    blog.last_published_at=Time.now
    blog.save!
  end
end
