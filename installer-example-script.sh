virt-install \
  --name Server2019 \
  --description "Windows Server 2019 auto-install" \
  --os-variant win2k19 \
  --memory 12000 \
  --vcpus 6 \
  --disk path=/var/lib/libvirt/images/windows2019.qcow2,bus=sata,size=30 \
  --cdrom /home/eero/Downloads/17763.737.190906-2324.rs5_release_svc_refresh_SERVER_EVAL_x64FRE_en-us_1.iso \
  --disk /home/eero/eeron-git/windows-virt-toolkit/win2k19-setup.iso,device=cdrom,bus=sata \
  --graphics spice,listen=127.0.0.1 \
  --noautoconsole \
  --network bridge=br0-lan,model=virtio
