\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{infommlay}[2017/10/06 InFoMM Lay Report Style file]
\LoadClass[english,twoside,12pt,a4paper]{article}
% Packages
\RequirePackage[includeall]{geometry} % Geometry of page
\RequirePackage{titling} % Use internal title variables
\RequirePackage{tikz} % Creating graphics
\RequirePackage{sectsty} % Section Colors
\RequirePackage{amssymb} % Square for the itemize
\RequirePackage{fancyhdr} % Header footer
\RequirePackage{xcolor} % Colors
\RequirePackage{graphicx} % Insert images
\RequirePackage{marginnote} % For nice margin notes.
\RequirePackage[framemethod=tikz]{mdframed} % Gives nices boxed and sidesrules.
\RequirePackage[colorlinks=true,linkcolor=black,urlcolor=black,citecolor=black,anchorcolor=black]{hyperref} % Colour links.
\RequirePackage{caption} % Add caption to figures
\RequirePackage{multicol} % Multicolumn for the table of contents page
\RequirePackage{listings}
\RequirePackage{cleveref}
\RequirePackage{booktabs}
\RequirePackage[numbers, sort&compress]{natbib} % Nice references.
% Tolerance set
%\tolerance=1
%\emergencystretch=\maxdimen
%\hyphenpenalty=10000
%\hbadness=10000

% Geometry # needs geometry
\geometry{total={125mm,250mm},inner=20mm,outer=20mm,top=20mm,bottom=20mm,marginparwidth=5cm}

% Colors # Needs xcolor
\definecolor{oxfordblue}{RGB}{0, 33, 71}
\definecolor{lightoxfordblue}{RGB}{0,91,192}
\definecolor{notecolor}{RGB}{255,255,204}
\definecolor{noteborder}{RGB}{0,0,128}
\definecolor{noteshadow}{RGB}{51,51,51}
\definecolor{header1}{RGB}{253,252,204}
\definecolor{header2}{RGB}{204,236,255}
\definecolor{header3}{RGB}{37,141,255}
\definecolor{header4}{RGB}{0,117,246}
\definecolor{header5}{RGB}{0,73,154}
\definecolor{footertopline}{RGB}{17,130,255}

% Define the dummy sentence, an ancient palindrome.
\def\sator{Sator Arepo tenet opera rotas.}

% A command to print the sentence repeatedly.
% Argument #1 is the number of times to repeat it.
\newcount\loopcounter
\def\dummysentences#1{%
\loopcounter = #1
\loop
\sator\ %
\advance\loopcounter by -1
\ifnum\loopcounter > 0
\repeat%
}

% Minor changes
\usetikzlibrary{shadows} % For shadowed boxes. # Needs TikZ
\usetikzlibrary{calc} % For shadowed boxes. # Needs TikZ
\tikzset{every shadow/.style={opacity=1}} % Shadows given full opacity. # Needs TikZ
\allsectionsfont{\sffamily\color{oxfordblue}} % Color and shape of sections # Needs secsty
\renewcommand{\labelitemi}{\color{lightoxfordblue}\scriptsize$\blacksquare$} % Black square for itemize # Needs amssymb
%\newcommand\litem[1]{\item{\textbf{\underline{{#1}:}}}} % Underline itemize /alternative
\newcommand\litem[1]{\item{\textbf{{#1}:}}} % Underline itemize
\newcommand{\coverimage}[1]{\newcommand{\thecoverimage}{#1}} % Use coverimage
\newcommand{\companylogo}[1]{\newcommand{\thecompanylogo}{#1}} % Use coverimage
\renewcommand{\lstlistingname}{Code}
\crefname{listing}{code}{codes}
\Crefname{listing}{Code}{Codes}
\lstset{
	numbers=left, 
	basicstyle=\ttfamily\footnotesize,
	frame=single, % adds a frame around the code
	xleftmargin=20.4pt,
	xrightmargin=3.4pt,
%	numbersep=3mm,
}
\bibliographystyle{unsrtnat}

% Titlepage
\renewcommand*{\maketitle}{
\begin{titlepage}
    \newgeometry{left = 20mm, right = 20mm, top = 50mm, bottom = 30mm}%
    \begin{tikzpicture}[remember picture, overlay]%
        \draw [line width=2mm, oxfordblue]%
        ($ (current page.south west) + (8mm, 8mm) $) rectangle ($ (current page.north east) + (-8mm, -8mm)$);%
        \node[anchor=north west, xshift=10mm, yshift=-10mm] at (current page.north west) {\includegraphics[width=0.3\linewidth]{epsrc_logo}};%
        \node[anchor=north east, xshift=-10mm, yshift=-10mm] at (current page.north east) {\includegraphics[width=0.3\linewidth]{infomm_logo_blue}};%
        \node[anchor=south west, xshift=10mm, yshift=10mm] at (current page.south west) {\includegraphics[width=0.3\linewidth]{oxford_logo_blue_long}};%
        \node[anchor=south east, xshift=-10mm, yshift=10mm] at (current page.south east) {\includegraphics[width=0.3\linewidth]{\thecompanylogo}};%
        \end{tikzpicture}%
    \begin{center}%
    \Huge{\sffamily\bfseries\color{oxfordblue} EPSRC Centre for Doctoral Training in Industrially Focused Mathematical Modelling}%
    \vfill%
    \begin{figure}[h]%
        \centering%
        \includegraphics[width=0.7\linewidth]{\thecoverimage}%
    \end{figure}%
    \vfill%
    \Huge{\sffamily\bfseries\color{oxfordblue}\thetitle}\\%
    \vspace{0.02\paperheight}%
    \Large{\sffamily\bfseries\color{oxfordblue}\theauthor}%
    \vspace{0.02\paperheight}%
    \end{center}
\end{titlepage}}

\setlength\columnsep{1cm} % Column separation # Needs multicol
\newcommand*{\maketoc}{
\newgeometry{marginparwidth=0mm,marginparsep=0mm,outer=20mm,inner=20mm,top=30mm,bottom=20mm,footskip=0mm}
\begin{multicols}{2}
    \includegraphics[width=\columnwidth]{andrew_wiles_building}
    \columnbreak
    \tableofcontents
\end{multicols}}

% Quotation at the end
\let\oldquote\quote
\let\endoldquote\endquote
\RenewDocumentEnvironment{quote}{om}{\itshape\oldquote}{\normalfont\par\nobreak\smallskip \hfill#2\IfValueT{#1}{~---~#1}\endoldquote \addvspace{\bigskipamount}}

% Temporary environment for the InFoMM side bubble. 
\NewDocumentEnvironment{mysidenote}{}{% verticle offset
\noindent\begin{minipage}[t]{\linewidth}\begin{mdframed}[roundcorner=5pt, linecolor=oxfordblue, linewidth=2pt, backgroundcolor=yellow!30, shadow=true,shadowcolor=black,shadowsize=8pt]}{\end{mdframed}\end{minipage}}
% The final command for an InFoMM margin bubble. 
\newcommand{\infommmarginnote}[2][0mm]{\marginnote{\sffamily{}\sansmath\begin{mysidenote}{#2}\end{mysidenote}}[{#1}]}

\fancypagestyle{style}{
\fancyhf{}
% Define header graphics
\renewcommand{\headrulewidth}{0pt}
\fancyhead[RE]{\begin{tikzpicture}[remember picture,overlay]
    \node (a1) [shape=rectangle, fill=header5, draw=header5, minimum height=8mm, minimum width=16.4cm, anchor=north east] at ([yshift=-1cm]current page.north east) {};
    \node (a2) [shape=rectangle, fill=header4, draw=header4, minimum height=8mm, minimum width=1.8cm, anchor=north east] at (a1.north west) {};
    \node (a3) [shape=rectangle, fill=header3, draw=header3, minimum height=8mm, minimum width=0.9cm, anchor=north east] at (a2.north west) {};
    \node (a4) [shape=rectangle, fill=header2, draw=header2, minimum height=8mm, minimum width=0.5cm, anchor=north east] at (a3.north west) {};
    \node (a5) [shape=rectangle, fill=header1, draw=header1, minimum height=8mm, minimum width=1.4cm, anchor=north east] at (a4.north west) {};
\end{tikzpicture}}
\fancyhead[LO]{\begin{tikzpicture}[remember picture,overlay]
    \node (a1) [shape=rectangle, fill=header5, draw=header5, minimum height=8mm, minimum width=16.4cm, anchor=north west] at ([yshift=-1cm]current page.north west) {};
    \node (a2) [shape=rectangle, fill=header4, draw=header4, minimum height=8mm, minimum width=1.8cm, anchor=north west] at (a1.north east) {};
    \node (a3) [shape=rectangle, fill=header3, draw=header3, minimum height=8mm, minimum width=0.9cm, anchor=north west] at (a2.north east) {};
    \node (a4) [shape=rectangle, fill=header2, draw=header2, minimum height=8mm, minimum width=0.5cm, anchor=north west] at (a3.north east) {};
    \node (a5) [shape=rectangle, fill=header1, draw=header1, minimum height=8mm, minimum width=1.4cm, anchor=north west] at (a4.north east) {};
\end{tikzpicture}}
% Make the footer longer
\setlength{\headwidth}{\textwidth} 
\addtolength{\headwidth}{\marginparsep}
\addtolength{\headwidth}{\marginparwidth}
% Define footer
\fancyfoot[LE]{{\color{header3}\hrule height 1pt} \parbox[c][1.5em]{1cm}{\centering\thepage} \hfill{\color{oxfordblue}\hrule height 1pt}}
\fancyfoot[RO]{{\color{header3}\hrule height 1pt} \hfill \parbox[c][1.5em]{1cm}{\centering\thepage} {\color{oxfordblue}\hrule height 1pt}}
}
% Use defined style
\pagestyle{style}