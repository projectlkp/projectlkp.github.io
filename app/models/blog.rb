class Blog < ApplicationRecord
  has_many :posts, :dependent => :destroy
  belongs_to :user

  after_update :update_config
  after_update :update_about
  after_create :first_post

    def update_config()
      File.write("#{self.path}/_config.yml",
      <<-HEREDOC
title: #{self.name || Rails.configuration.lkp['default_name']}
email: #{self.email || Rails.configuration.lkp['default_email']}
description: > # this means to ignore newlines until "baseurl:"
    #{self.description || Rails.configuration.lkp['default_description']}

baseurl: "" # the subpath of your site, e.g. /blog
url: #{self.url} # the base hostname & protocol for your site
twitter_username: #{self.twitter || Rails.configuration.lkp['default_twitter']}

markdown: kramdown
theme: #{self.theme || "minima"}
      HEREDOC
      )
    end

    def update_about()
      File.write("#{self.path}/about.md",
      <<-HEREDOC
---
layout: page
title: About
permalink: /about/
---

#{self.about || Rails.configuration.lkp['default_about']}
      HEREDOC
      )
    end

    def first_post
      puts "not sure wants to keep it or not"
    end
end
