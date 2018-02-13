package 'vim'
package 'nano'

package 'git' do
   action :install
end

package 'tree' do
	action :install
end


file '/etc/motd' do
	#action :create
	content 'this server is the property of techno trainer'
	action :create
	owner  'root'
	group  'root'
	
end
