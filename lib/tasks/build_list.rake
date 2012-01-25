require 'rubygems'
require 'fog'

task :build_list  => :environment do

     @vcloud = ::Fog::Compute.new(:provider => 'ecloud',
                                    :ecloud_username => 'ctosswill@engineyard.com',
                                    :ecloud_password => 'password',
                                    :ecloud_version => '0.8b-ext2.6',
                                    :ecloud_versions_uri => 'https://services.enterprisecloud.terremark.com/api/versions')

   @vcloud.vdcs.each do |v|
            puts "Processing #{v.name}..."
            v.servers.each do |s|
              puts s.name
              disk = s.disks.inject {|sum , n| n[:size] }
              ram = s.memory[:amount]
              vm = Vm.new( :name => s.name , :disk => disk , :ram  => ram )
              Rails.cache.write( vm.name, vm , :expires_in => 6.hours )
            end

    end
end