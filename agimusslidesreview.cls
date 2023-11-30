% Copyright (c) AGIMUS  - All Rights Reserved
% Created on: 22/11/23
%     Author: Vladimir Petrik <vladimir.petrik@cvut.cz>
%
%   2023-11-22
%       Initial version released based on ctuslides
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{agimusslidesreview}
\RequirePackage{lastpage}
\RequirePackage{xcolor}
\RequirePackage{calc}
\RequirePackage{pgfpages}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{makecell}
\RequirePackage{arydshln}


\usepackage[absolute,overlay]{textpos}
\RequirePackage{agimusstyle}

\def\titlelocation{}
\newcommand\agimustitlelocation[1]{\def\titlelocation{#1}}
\agimustitlelocation{\textbf{Meeting}\\\insertdate\\Online}

\newif\iffooter\footertrue

% Set default aspect ration to 1610
\RequirePackage{kvoptions}
\DeclareStringOption[1610]{aspectratio}
\ProcessKeyvalOptions{agimusslidesreview}\relax
\PassOptionsToClass{aspectratio=\agimusslidesreview@aspectratio}{beamer}

\newif\ifnotes
\notesfalse
% Other options
\DeclareOption{nofoot}{\footerfalse} % don't display footer
\DeclareOption{withoutnotes}{\notesfalse} % don't display notes in handout mode
\DeclareOption{withnotes}{\notestrue} % don't display notes in handout mode
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}} % Pass unknown options to Beamer class
\ProcessOptions
\LoadClass{beamer}


\RequirePackage{enumitem}

\setlist[itemize]{label=$\bullet$}
\setlist[itemize,1]{before*=\small}
\setlist[itemize,2]{before*=\footnotesize}

% SOME CUSTOMIZATION
\newlength\agimusframemargin \setlength{\agimusframemargin}{0.8cm}
\setbeamertemplate{navigation symbols}{} % Remove navigation symbols
\setbeamertemplate{frametitle continuation}[from second]
\setbeamersize{text margin left=\agimusframemargin, text margin right=\agimusframemargin}
\setbeamertemplate{frametitle}{\vspace{0.4cm}\insertframetitle}
\iffooter\setbeamertemplate{footline}{\vspace{1.1cm}}\fi

\setbeamerfont{title}{size=\Large, series=\bfseries}
\setbeamerfont{frametitle}{size=\Large, series=\bfseries}
\setbeamerfont{alerted text}{series=\bfseries}

% Set colors
\setbeamercolor{structure}{fg=agimusorange}
\setbeamercolor{alerted text}{fg=agimusorange}
\setbeamercolor{example text}{fg=agimusorange}
\setbeamercolor{normal text}{fg=agimusgray}

% FOOTER
\newlength\agimusfooterplace \setlength\agimusfooterplace{0.90\beamer@paperheight}
\newlength\agimusfooterruleheight \setlength\agimusfooterruleheight{2.5pt}
\newlength\agimusfooterrulewidth \setlength\agimusfooterrulewidth{\beamer@paperwidth}
\newlength\agimussymbolheight \setlength\agimussymbolheight{0.08\beamer@paperheight}%
\newlength\agimussymbolwidth \setlength\agimussymbolwidth{1.546875\agimussymbolheight}%

\usebackgroundtemplate{
    \iffooter
    \begin{minipage}{\paperwidth}%
        \centering %
        \begin{minipage}{\agimusfooterrulewidth}%
            \vspace{\agimusfooterplace}{\color{agimusgray}\rule{\agimusfooterrulewidth}{\agimusfooterruleheight}}
%            \footnotesize \bfseries %
%            \begin{minipage}{\agimussymbolwidth}%
%%            \resizebox{!}{\agimussymbolheight}{}
%            \end{minipage}%
%            \begin{minipage}[t]{\agimusfooterrulewidth-\agimussymbolwidth}%
%                \vspace{-0.5\agimussymbolheight}
%                \footelemlt \hfill \footelemrt\\
%                \footelemlb \hfill \footelemrb
%            \end{minipage}
        \end{minipage}
    \end{minipage}%
        \begin{tikzpicture}[remember picture,overlay]
            \node[yshift=-\agimusfooterplace] at (current page.north west) [anchor=north west] {\includegraphics[height=0.9\agimussymbolheight]{figs_review/logos_in_row}};
        \end{tikzpicture}
        \begin{tikzpicture}[remember picture,overlay]
            \node at (current page.north east) [anchor=north east] {\includegraphics[width=.2\textwidth]{figs_review/logo}};
        \end{tikzpicture}

        \begin{tikzpicture}[remember picture,overlay]
            \node[yshift=-\agimusfooterplace] (euflag) at (current page.north east) [anchor=north east] {
            \begin{minipage}[t]{0.2\textwidth}
            \vspace{0.25\agimussymbolheight}
            \raggedleft
            \insertframenumber~/~\inserttotalframenumber
            \end{minipage}%
            \begin{minipage}[t]{0.02\textwidth}
            \vspace{0pt}
            \end{minipage}
            \begin{minipage}[t]{0.08\textwidth}
            \vspace{0mm}
            \includegraphics[height=\agimussymbolheight]{figs_review/eu_flag}
            \end{minipage}
            };
        \end{tikzpicture}
    \fi
}

% Title frame
\newlength\agimustitlesep \setlength\agimustitlesep{0.4cm}


\newcommand{\agimustitleframe}[1][]{{
    \usebackgroundtemplate{
        \includegraphics[width=\paperwidth, height=\paperheight]{figs_review/title_background}
    }
    \frame[t]{
        {\color{agimusgray} \tiny \mdseries \titlelocation \\}
%        \vspace{1.5cm}
        \includegraphics[width=0.35\linewidth]{figs_review/logo} \\
        \vspace{3.0cm}
        {\color{white}
        {\bfseries \Large \inserttitle}  \\[\agimustitlesep]
        \insertauthor \\
        \insertinstitute \\
        \insertdate \\
        }
        \begin{tikzpicture}[remember picture,overlay]
            \node[yshift=-\agimusfooterplace] at (current page.north west) [anchor=north west] {\includegraphics[height=0.9\agimussymbolheight]{figs_review/logos_in_row}};
        \end{tikzpicture}
        \begin{tikzpicture}[remember picture,overlay]
            \node[yshift=-\agimusfooterplace] (euflag) at (current page.north east) [anchor=north east] {
            \begin{minipage}[t]{0.2\textwidth}
            \vspace{0pt}
            \raggedleft
            \tiny
            \color{euflagblue}
            Founded by the \\ European Union under \\ GA no 101070165
            \end{minipage}%
            \begin{minipage}[t]{0.02\textwidth}
            \vspace{0pt}
            \end{minipage}
            \begin{minipage}[t]{0.08\textwidth}
%            \vspace{-0.75mm}
            \vspace{-0mm}
            \includegraphics[height=\agimussymbolheight]{figs_review/eu_flag}
            \end{minipage}
            };
        \end{tikzpicture}
    }
}}

\newcommand\agimussubtitleframe[2]{
    \begin{frame}{}
        \centering
        {\bfseries \LARGE \color{agimusorange} #1}  \\[\agimustitlesep]
        {\bfseries \large \color{agimusorange} #2}
    \end{frame}
}

\mode<handout>{
    \ifnotes
    \setbeameroption{show notes on second screen=bottom}
    \setbeamertemplate{note page}{\vspace{1cm}\insertnote}
    \fi
}

\newcommand*\itemincircle[1]{\tikz[baseline=(char.base)]{%
    \node[shape=circle,fill=agimusorange,draw,inner sep=4pt,draw=white] (char) {\color{white}#1};%
}}

\newcommand\overviewframe[1]{
    \begin{frame}{Overview}
        \begin{minipage}[t]{0.25\textwidth}
            \vspace{0.3\linewidth}
            \includegraphics[width=1.0\linewidth]{figs_review/overview_fig}
        \end{minipage}\hfill
        \begin{minipage}[t]{0.7\textwidth}
            \vspace{0pt}
            #1
        \end{minipage}
    \end{frame}
}
