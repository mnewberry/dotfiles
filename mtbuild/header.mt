\documentclass[12pt]{amsart}
\usepackage[utf8]{inputenc}
\usepackage[margin=1.0in]{geometry}
\usepackage{amsmath}
\geometry{letterpaper}
\usepackage[math]{iwona}
\usepackage{libertine}
\renewcommand*\familydefault{\sfdefault}
\usepackage[defaultmono,scale=0.8]{droidmono}
\usepackage[T1]{fontenc}
%\usepackage{mathptmx}
%\usepackage[T1]{fontenc}
%\usepackage{cite}
\usepackage{graphicx}
\usepackage{epstopdf}
\DeclareGraphicsRule{.tif}{.png}{.png}%
{`convert #1 `dirname #1`/`basename #1 .tif`.png}
\newcommand{\party}{\frac{\partial}{\partial y}}
\newcommand{\half}{\frac{1}{2}}
\newcommand{\code}[1]{\texttt{#1}}
\newcommand{\TODO}[1]{\textbf{TODO:} #1}
\newcommand{\impl}{\Rightarrow}
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\Ber}{\operatorname{Ber}}
\newcommand{\Poly}{\operatorname{Poly}}
\newcommand{\Binom}{\operatorname{Binom}}
\newcommand{\Pois}{\operatorname{Poisson}}
\newcommand{\Cov}{\operatorname{Cov}}
\newcommand{\Corr}{\operatorname{Corr}}
\newcommand{\E}{\operatorname{E}}
\newcommand{\Ex}[2][]{\operatorname{E}\hspace{-0.2em}\ifthenelse{\equal{#1}{}}{\left( #2 \right)}{\left( #2 \middle| #1 \right)}}
\newcommand{\Erf}{\operatorname{Erf}}
\newcommand{\Pro}{\operatorname{Pr}}
\newcommand{\N}{\mathcal{N}}
\newcommand{\one}{\mathbf{1}}
\newcommand{\U}{\mathcal{U}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\inv}{{-1}}
\newcommand{\gene}[1]{\textit{#1}}
\usepackage[noae]{Sweave} 
\usepackage{setspace}
\usepackage{listings}
\usepackage{color}
\lstset{basicstyle=\small\ttfamily,frame=L,keepspaces=true,linewidth=0.8\linewidth,xleftmargin=0.1\linewidth}
\usepackage[round]{natbib}  % Comment this out in case of bib problems
\renewcommand{\cite}{\citep}
\usepackage{multicol}


% amsart's section headings otherwise have an awkward place and face.
\makeatletter
\def\section{\@startsection{section}{1}%
\z@{.7\linespacing\@plus\linespacing}{.5\linespacing}%
{\normalfont\bfseries}}
\makeatother

