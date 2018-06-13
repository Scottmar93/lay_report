# Lay report template

## Author

[Oliver Sheridan-Methven](mailto:oliver.sheridan-methven@maths.ox.ac.uk).

### Date

November 2017.

#### Last revised

June 2018.

### Contributors

[Attila Kovaks](mailto:kovacs@maths.ox.ac.uk).

### Description

A revised template on the previous lay report template writen for LaTeX, 
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
\documentclass[english,a4,oneside,9pt]{extarticle}
\input{preamble}
\title{Mini-project lay report}
\author{Oliver Sheridan-Methven}
\coverimage[cover_image] % Specify your own image using [].
\begin{document}
\input{cover_page}
\input{table_of_contents_page}
    %       ... 
    % Main body of report.
    %       ...
{\small\bibliography{references}}
\end{document}
```

## Available features

For an extensive demonstration of some of the features available 
see the minimal working example.

For a real world example see the example Vodafone lay report. 

## File structure

The files for the figures are kept in the figures folder and the path
to this is set in the `preamble.tex` file through the graphicspath
option. Hence why we recommend keeping this directory structure.

## Building a report

Building a report should require:

```[bash]
pdflatex file.tex
makeindex file.idx
pdflatex file.tex
pdflatex file.tex
```
