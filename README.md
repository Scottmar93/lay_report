# Lay report template

## Author

[Oliver Sheridan-Methven](mailto:oliver.sheridan-methven@maths.ox.ac.uk).

### Date

November 2017.

#### Last revised

January 2019.

### Collaborators

[Attila Kovaks](mailto:kovacs@maths.ox.ac.uk).

### Description

A lay report template writen for LaTeX, 
which is a revision from the previous MS Office Word. This is aimed to be 
a document which closely resembles the previous InFoMM style, with the
content focused nature of LaTeX documents. There will likely be significant 
measures in place to make the document more visualy striking than ordinary
LaTeX documents. 

## Requirements

 * Git.
 * PdfLaTeX.

## Getting Started

It should be easy to start writing your lay report. Simply copy the directory
structure and crate a tex document beginning with:

```[latex]
\documentclass[english,a4paper,oneside,9pt]{extarticle}
\input{preamble}
\title{Mini-project lay report}
\author{Oliver Sheridan-Methven}
\coverimage[cover_image] % Specify your own image using [].
\companylogo[company_logo]
\begin{document}
\input{cover_page}
\input{table_of_contents_page}
    %       ... 
    % Main body of report.
    %       ...
{\small\bibliography{references}}
\end{document}
```

All the relevent files can be found in `lay_report/latex/lay_report/`.


## Available features

For an extensive demonstration of some of the features available 
see the minimal working example.

For a real world example see the example Vodafone lay report. 
(**Don't take the files from the Vodafone example, use the MWE.**).

## File structure

The files for the figures are kept in the figures folder and the path
to this is set in the `preamble.tex` file through the graphicspath
option. Hence why we recommend keeping this directory structure:

```
lay_report
├── figures
│   ├── figure_1.pdf
│   ├── figure_2.pdf
│   ├── ... etc. 
│   └── logos
│       ├── andrew_wiles_building.jpg
│       ├── epsrc_logo.pdf
│       ├── infomm_logo_blue.pdf
│       └── oxford_logo_blue_long.pdf
├── latex
│   └── lay_report
│       ├── cover_page.tex
│       ├── lay_report.pdf
│       ├── lay_report.tex
│       ├── mcode.sty
│       ├── preamble.tex
│       ├── references.bib
│       └── table_of_contents_page.tex
└── README.md
```


## Building a report

Building a report should require:

```[bash]
pdflatex file.tex
makeindex file.idx
pdflatex file.tex
pdflatex file.tex
```


## Raising issues

Raise issues 
[here](https://github.com/oliversheridanmethven/lay_report/issues).
