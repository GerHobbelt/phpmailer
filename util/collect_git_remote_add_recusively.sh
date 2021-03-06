#! /bin/bash
#
# recursively collect registered git remotes and
# write them to a shell script for later use on other
# machines (and keeping the info in the repository)
#

pushd $(dirname $0)
mydir=$(pwd)
tmpdst=${mydir}/__tmp__.sh

cat > ${mydir}/register_git_remotes_recursive.sh <<EOT
#! /bin/bash
# generated by $0 $*
pushd \$(dirname \$0)

EOT

rm ${tmpdst}

for f in $( find ../$1 -name '.git' -exec echo '{}' \; | sed -e 's/\/\.git//' ); do
    pushd .
    cd $f
    echo $f
    git remote -v | grep -v origin | grep -v -e '(push)' |  sed -e "s#\([^ ]\+\)[ \t]\+\([^ ]\+\)[ \t]\+.*#pushd $f ; git remote add \1 \2 ; popd#" >> ${tmpdst}
    popd
done

cat ${tmpdst} | sort | uniq >> ${mydir}/register_git_remotes_recursive.sh

cat >> ${mydir}/register_git_remotes_recursive.sh <<EOT

popd

EOT


popd
