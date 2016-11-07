# Solaris PCA Patching - ABE setup
Ansible Role for fully patching an ABE in solaris 10 with ZFS root and PCA+live upgrade

## Description

This role will setup a PCA working environment using the ansible server as a PCA proxy-style host that will push patches to hosts based on configured rules.
The schedule settings result in a quarterly refresh of patchdiag.xref

| Name           | Default Value | Description                        |
| -------------- | ------------- | -----------------------------------|
| `solaris_pca_operand` | missingrs | PCA operands to use for patching, see PCA documentation for possible values |
| `solaris_pca_update` | true | Controls if the playbook will attempt PCA autoupdate |
| `mos_user` | test.user@domain.com | This needs to be changed to a valid MOS username, to fetch patches |
| `mos_password` | abcd1234 | MOS password for above MOS username |
| `pca_basedir` | /var/pca | Path to ansible master pca installation/repo |
| `pca_tempdir` | /var/tmp | Temp dir to be used in target hosts for storing patches and other data |
| `pca_prereq` | prereq_list.txt | prepreq patches that should be installed to avoid issues with patching process |
| `pca_downloadfirst` | true | Controls if playbook should download a copy of the PCA script validated with checksum from the official site |
| `pca_patchdiag_minute_schedule` | '0' | Controls cron job for patchdiag.xref download |
| `pca_patchdiag_hour_schedule` | '0' | Controls cron job for patchdiag.xref download |
| `pca_patchdiag_dom_schedule` | '1' | Controls cron job for patchdiag.xref download |
| `pca_patchdiag_monthly_schedule` | '*/3' | Controls cron job for patchdiag.xref download |
| `pca_patchdiag_dow_schedule` | '*' | Controls cron job for patchdiag.xref download |
