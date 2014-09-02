\documentclass[14pt]{beamer}
\usepackage[utf8]{inputenc}
\usepackage{amsmath}
\usepackage[math]{iwona}
\usepackage{libertine}
\renewcommand*\familydefault{\sfdefault}
\usepackage[T1]{fontenc}
\usepackage{graphicx}
\usepackage{epstopdf}
\usepackage{setspace}
\DeclareGraphicsRule{.tif}{.png}{.png}%
{`convert #1 `dirname #1`/`basename #1 .tif`.png}
\usepackage[noae]{Sweave} 
\usepackage[round]{natbib}

%\useoutertheme[subsection=false]{smoothbars}
\usecolortheme{dove}
\setbeamertemplate{title page}{
  \hbox{}
  \vspace{1.3in}
  {\Large \textbf{\inserttitle}}\par\bigskip\par
  {\large \insertauthor}\par\bigskip\par
  {\insertinstitute}\par\bigskip\par
  {\large \insertdate}}

\setbeamertemplate{frametitle}{\hbox{}\vfill\hspace{-0.15in}\insertframetitle}

\newcommand{\rightimage}[1]{
  \setbeamertemplate{background}{
    \begin{minipage}[c][\paperheight][c]{\paperwidth} 
      \hbox{}\hfill\includegraphics[width=0.6\paperwidth]{#1}
    \end{minipage}} }

\newcommand{\rightimagev}[2]{
  \setbeamertemplate{background}{
    \begin{minipage}[c][\paperheight][c]{\paperwidth} 
      \hbox{}\hfill\includegraphics[width=#1\paperwidth]{#2}
    \end{minipage}} }

\newcommand{\fullimage}[1]{
  \setbeamertemplate{background}{
    \includegraphics[width=\paperwidth,height=\paperheight]{#1}} }

\newcommand{\footcredit}[1]{
  \setbeamertemplate{footline}{\vspace{-0.2in}\scriptsize \color{gray} #1}}

