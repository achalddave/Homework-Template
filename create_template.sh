#!/bin/bash
# Creates a course and user specific template file from generic_template.tex.

# Exit on error
set -e

if [[ "$#" != 4 ]] ; then
cat << EOF
Usage: $0 <your name> <course name> <course semester> <course year>
Example: $0 "Achal Dave" "CS174" "Spring" "2015"
EOF
exit
fi

# Get the location of this script's directory.
script_dir="$( dirname "${BASH_SOURCE[0]}" )"

author="${1}"
course_name="${2}"
course_semester="${3}"
course_year="${4}"

# Concatenate the above arguments, replacing spaces with underscores.
template_name=$(echo "${author}_${course_name}_${course_semester}_${course_year}.template.tex" \
    | sed -e 's/ /_/g')

if [[ -f "${template_name}" ]] ; then
    echo "Template ${template_name} already exists! Refusing to overwrite." >&2
    exit 1
fi

cp "${script_dir}/generic_template.tex" "${template_name}"
sed -i '' \
    -e "s/#{TEMPLATE_NAME}/${author}/" \
    -e "s/#{TEMPLATE_COURSE_NAME}/${course_name}/" \
    -e "s/#{TEMPLATE_COURSE_SEMESTER}/${course_semester}/" \
    -e "s/#{TEMPLATE_COURSE_YEAR}/${course_year}/" \
    ${template_name}
