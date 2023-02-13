default['ced_2204']['aptproxy_ip'] = '192.168.5.2'

default['ced_2204']['bigbang_address'] = '192.168.4.190'
default['ced_2204']['bigbang_remotedir'] = '/bigbang/ubuntu18.04'
default['ced_2204']['bigbang_mountpoint'] = '/bigbang'

default['ced_2204']['sites_backup_address'] = '192.168.3.22'
default['ced_2204']['sites_backup_remotedir'] = '/data01/SITES_BACKUP'
default['ced_2204']['sites_backup_mountpoint'] = '/SITES_BACKUP'

default['postfix']['main']['relayhost'] = '192.168.3.100'
default['postfix']['main']['mydomain'] = 'tremira.net'
default['postfix']['main']['mynetworks'] = '127.0.0.0/8'
default['postfix']['main']['inet_interfaces'] = 'loopback-only'

default['ced_2204']['memory_thr'] = '250000000'
default['ced_2204']['tre_cache_dim'] = '236032000'

default['ced_2204']['lsf_mountpoint'] = '/lsf'
default['ced_2204']['lsf_remotedir'] = 'panfs://snow/lsf2204'
default['ced_2204']['lsf_fstab_options'] = 'rmlist=(192.168.4.190;192.168.4.192;192.168.4.193)'

default['ced_2204']['panfs_mounts'] = {
  'box' => ['panfs://snow/box','rmlist=(192.168.4.190;192.168.4.192;192.168.4.193)'],
  'users' => ['panfs://snow/users','rmlist=(192.168.4.190;192.168.4.192;192.168.4.193)'],
  'bud' => ['panfs://snow/bud','rmlist=(192.168.4.190;192.168.4.192;192.168.4.193)'],
  'CM_PROJECTS' => ['panfs://snow/CM_PROJECTS','rmlist=(192.168.4.190;192.168.4.192;192.168.4.193)'],
  'SWdevelopment' => ['panfs://snow/SWdevelopment','rmlist=(192.168.4.190;192.168.4.192;192.168.4.193)'],
  'spencer' => ['panfs://snow/spencer','rmlist=(192.168.4.190;192.168.4.192;192.168.4.193)'],
  'STARTUP_SITI' => ['panfs://snow/STARTUP_SITI','rmlist=(192.168.4.190;192.168.4.192;192.168.4.193)']
}

default['ced_2204']['netapp3_rootdir'] = '/netapp3'

default['ced_2204']['netapp3_mounts'] = {
  '/netapp3/vol1' => ['netapp_nfs:/vol_1','rsize=32768,wsize=32768,rw,bg,soft,intr'],
  '/netapp3/vol2' => ['netapp_nfs:/vol_2','rsize=32768,wsize=32768,rw,bg,soft,intr'],
  '/netapp3/vol3' => ['netapp_nfs:/vol_3','rsize=32768,wsize=32768,rw,bg,soft,intr'],
  '/bud_repo' => ['netapp_nfs:/vol_4','rsize=32768,wsize=32768,rw,bg,soft,intr'],
  '/pablo' => ['netapp_nfs:/vol_6','rsize=32768,wsize=32768,rw,bg,soft,intr']
}

