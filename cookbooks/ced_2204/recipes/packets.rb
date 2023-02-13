node['ced_2204']['pkgs'].each do |pkg, vers|
  package "#{pkg}" do
    version "#{vers}"
    action :install
    options '--force-yes'
  end
end

node['ced_2204']['geopkgs'].each do |pkg, vers|
   package "#{pkg}" do
     version "#{vers}"
     options '--force-yes'
     action :install
   end
 end
