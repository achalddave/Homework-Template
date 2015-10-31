# Homework Template

A small set of utilities to allow you to generate a .tex file for each homework
with the relevant information filled in.

## Usage

There's one generic template, aptly named `generic_template.tex`. This template
doesn't have any course or homework specific information.

First, create a course-specific template, like so:

    ./create_template.sh "Achal Dave" "CS174" "Spring" "2015"

This will generate a template file named
`Achal_Dave_CS174_Spring_2015.template.tex`. You can then use this template for
each homework in your course. To start homework 1, run

    ./create.sh "Achal_Dave_CS174_Spring_2015.template.tex" 1

This will create a `hw1` directory, with a `hw1.tex` file inside.
