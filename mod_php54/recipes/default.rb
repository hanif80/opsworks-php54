case node[:platform]
    
    when "amazon"
    # add the webtatic repository
    yum_repository "webtatic" do
        repo_name "webtatic"
        description "webtatic Stable repo"
        url "http://repo.webtatic.com/yum/el6/x86_64/"
        key "RPM-GPG-KEY-webtatic-andy"
        action :add
    end
    
    yum_key "RPM-GPG-KEY-webtatic-andy" do
        url "http://repo.webtatic.com/yum/RPM-GPG-KEY-webtatic-andy"
        action :add
    end
    
    
    # remove any existing php/mysql
    execute "yum remove -y php*"
    
    # get the metadata
    execute "yum -q makecache"
    
    # manually install php 5.4....
    execute "yum install -y --skip-broken php54w-devel php54w-cli php55w-imap php54w-common"

  node.set['php']['packages'] = ['php54w-devel', 'php54w-cli', 'php55w-imap', 'php54w-common']
  
  include_recipe "php"

  end
