#!/bin/bash
set -e
shopt -s nullglob


prefix="/var/lib"

csl_root='./styles'
csl_files=($csl_root/*.csl)

package_name="-n csl-styles"
package_version=$(cd "${csl_root}" && git rev-parse --short HEAD)
excludes="-x .git"

file_transformations="${csl_root}=${prefix}"

fpm_cmd="/usr/local/bin/fpm"
fpm_cmd="${fpm_cmd} -s dir -t THE_TARGET_FORMAT -a all"
fpm_cmd="${fpm_cmd} $package_name -v $package_version"
fpm_cmd="${fpm_cmd} $excludes \"$csl_root\""
fpm_cmd="${fpm_cmd} $file_transformations"

deb_fpm=${fpm_cmd/THE\_TARGET\_FORMAT/deb}
rpm_fpm=${fpm_cmd/THE\_TARGET\_FORMAT/rpm}

#echo $deb_fpm && echo $rpm_fpm && exit 0

eval $deb_fpm
eval $rpm_fpm
