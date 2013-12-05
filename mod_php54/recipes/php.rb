%w{profile_picture lead_images client_images repair_images purchase_images wish_images sales_images}.each do |dir|
  directory "/APPLICATION PATH/images/#{dir}" do
    mode 00775
    owner "root"
    group "root"
    action :create
    recursive true
  end
end
{
    "custom_env": {
        "cron_jobs": [ 
         {
                // Run every 5 minutes
                "name": "do_sent_mail_5m",
                "minute": "5", 
                "hour" :  "*",
                "month" :  "*",
                "weekday" :  "*",
                "command": "cd /srv/www/production_site/current && php app/console memory:leak"
                },
                
                {
               // Run every 5 minutes
                "name": "check_inbox_5m",
                "minute": "5", 
                "hour" :  "*",
                "month" :  "*",
                "weekday" :  "*",
                "command": "cd /srv/www/production_site/current && php app/console memory:leak" 
            },
             {
                // Run every day
                "name": "daily_cron",
                "minute": "0", 
                "hour" :  "1",
                "month" :  "1",
                "weekday" :  "*",
                "command": "cd /srv/www/production_site/current && php app/console memory:leak"
            },
             {
                // Run every week
                "name": "weekly_cron",
                "minute": "0", 
                "hour" :  "1",
                "month" :  "1",
                "weekday" :  "1",
                "command": "cd /srv/www/production_site/current && php app/console memory:leak"
            },
              ]
    }
}
