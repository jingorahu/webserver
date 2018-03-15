#Notifying if the config file chanages
#notifies :action, 'resource[name]', :timer
#subscribes :action, 'resource[name]', :timer
#
#:timer can be :before, :delayed, :immediately
#
#
#
#
#
package 'apache2' do 
	action :install
end

#service 'apache2' do 
#	action [:enable, :start]
#end

remote_file '/var/www/html/canada.jpg' do
	source 'https://d36tnp772eyphs.cloudfront.net/blogs/1/2011/05/canada-940x705.jpg'
	
end

remote_file '/var/www/html/Crater-Lake-768x510.jpg' do

	source 'https://ecophiles.com/wp-content/uploads/2017/09/Crater-Lake-768x510.jpg'
end


remote_file '/var/www/html/crater-lake-in-summer-4a-smaller_2.jpg' do

        source 'https://www.nps.gov/crla/planyourvisit/images/crater-lake-in-summer-4a-smaller_2.jpg'
end


template '/var/www/html/index.html' do
  	source 'server.erb'
	action :create
	notifies :restart, 'service[apache2]', :immediately
end



service 'apache2' do
        action [:enable, :start]
	subscribes :restart, 'template[/var/www/html/index.html]', :immediately
end

