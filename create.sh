#!/bin/bash
# Create a homework directory with a ready-to-go tex file.

# Exit on error
set -e

if [[ "$#" != 2 ]] ; then
cat << EOF
Usage: $0 <course_specific_template> <homework_number>
Example: $0 "Achal_Dave_CS174_Spring_2015.template.tex" 2
EOF
exit
fi

# Get the location of this script's directory.
script_dir="$( dirname "${BASH_SOURCE[0]}" )"

template=${1}
hw_num=${2}
directory_name="hw${hw_num}"
tex_name="${directory_name}.tex"

mkdir -p ${directory_name}
cp ${template} "${directory_name}/${tex_name}"

cd ${directory_name}
sed -i '' "s/#{TEMPLATE_HOMEWORK_NUMBER}/${hw_num}/" ${tex_name}
