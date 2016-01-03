\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{elementary-physics}[2015/05/27 v1 elementary physics]

\LoadClass[a4paper,11pt]{article}

%\usepackage[latin1]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage{amsmath}
\usepackage{subfig}
\usepackage{graphicx}
\usepackage{datetime}
\usepackage{gensymb}
\usepackage{siunitx}
\usepackage[hyphens]{url}
\usepackage{hyperref}
\usepackage{lscape}
\usepackage[backend=bibtex]{biblatex}
\bibliography{../common/elementary-physics.bib}
\usepackage{sagetex}

\setlength{\sagetexindent}{10ex}

\DeclareGraphicsExtensions{.pdf,.png,.jpg}

\newcommand{\head}[1]{\textnormal{\textbf{#1}}}

\author{Hob Nilre \& Bo C. Herlin\\
		\texttt{hob.nilre@gmail.com}}
