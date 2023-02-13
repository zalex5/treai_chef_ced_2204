#
# Cookbook Name:: ced_2204
# Recipe:: mastertree
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

script "mastertree" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
    rsync -e ssh -avzb /bigbang/MASTERTREE/ /
  EOH
end
