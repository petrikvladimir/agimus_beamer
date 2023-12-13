%! Copyright (c) CTU -- All Rights Reserved
%! Created on: 11/30/23
%!     Author: Vladimir Petrik <vladimir.petrik@cvut.cz>
%
%   2023-11-30
%       Initial version released based on ctuslides
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{agimusslidesschool}
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
\agimustitlelocation{
    \textbf{Agimus Winter School}\\11/12/2023 - 15/12/2023\\Banyuls (France)
}

\newif\iffooter\footertrue

% Set default aspect ration to 1609
\RequirePackage{kvoptions}
\DeclareStringOption[169]{aspectratio}
\ProcessKeyvalOptions{agimusslidesschool}\relax
\PassOptionsToClass{aspectratio=\agimusslidesschool@aspectratio}{beamer}

\newif\ifnotes
\notesfalse
% Other options
\DeclareOption{nofoot}{\footerfalse} % don't display footer
\DeclareOption{withoutnotes}{\notesfalse} % don't display notes in handout mode
\DeclareOption{withnotes}{\notestrue} % don't display notes in handout mode
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}} % Pass unknown options to Beamer class
\ProcessOptions
\LoadClass{beamer}

\date{~}

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
\newlength\agimussymbolwidth \setlength\agimussymbolwidth{2.652307692\agimussymbolheight}%
\newlength\euflagheight \setlength\euflagheight{0.08\beamer@paperheight}%
\newlength\euflagwidth \setlength\euflagwidth{1.428571429\euflagheight}%

\newlength\symbolmargin \setlength\symbolmargin{2mm}%

\usebackgroundtemplate{
    \iffooter
    \begin{minipage}{\paperwidth}%
        \centering %
        \begin{minipage}{\agimusfooterrulewidth}%
            \vspace{\agimusfooterplace}
            \begin{tikzpicture}
                \fill[left color=agimusorange, right color=agimusgray] (0,0) rectangle (\linewidth,\agimusfooterruleheight);
            \end{tikzpicture}

            \begin{minipage}{\agimussymbolwidth+2\symbolmargin}%
                \hspace{\symbolmargin}\includegraphics[width=\agimussymbolwidth]{figs_school/logo}\hspace{\symbolmargin}
            \end{minipage}%
            \begin{minipage}[t]{\agimusfooterrulewidth-\agimussymbolwidth-\euflagwidth-4\symbolmargin}%
                \vspace{-0.25\agimussymbolheight}
%                A
                \hfill
                \footnotesize{\bfseries \color{agimusorange} AGIMUS Winter School $|$ \inserttitle}
                \hfill
                \insertframenumber~/~\inserttotalframenumber
            \end{minipage}%
            \begin{minipage}{\euflagwidth+2\symbolmargin}%
                \hspace{\symbolmargin}\includegraphics[width=\euflagwidth]{figs_school/eu_flag}\hspace{\symbolmargin}
            \end{minipage}%
        \end{minipage}
    \end{minipage}%
    \fi
}

% Title frame
\newlength\agimustitlesep \setlength\agimustitlesep{0.4cm}


\newcommand{\agimustitleframe}[1][]{{
    \usebackgroundtemplate{
        \includegraphics[width=\paperwidth, height=\paperheight]{figs_school/title_background}
    }
    \frame[t]{
            {\color{agimusgray} \tiny \mdseries \titlelocation \\}
%        \vspace{1.5cm}
        \includegraphics[width=0.35\linewidth]{figs_school/logo} \\
        \vspace{2.0cm}
        {\color{white}
        {\bfseries \Large \inserttitle}  \\[\agimustitlesep]
        \insertauthor \\
        \insertinstitute \\
        \insertdate \\
        }
        \begin{tikzpicture}[remember picture,overlay]
            \node[yshift=-\agimusfooterplace] at (current page.north west) [anchor=north west] {\includegraphics[height=0.9\agimussymbolheight]{figs_school/logos_in_row}};
        \end{tikzpicture}
        \begin{tikzpicture}[remember picture,overlay]
            \node[yshift=-\agimusfooterplace] (euflag) at (current page.north east) [anchor=north east] {
                \begin{minipage}[t]{0.2\textwidth}
                    \vspace{0mm}
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
                    \vspace{-0.5mm}
                    \includegraphics[height=\agimussymbolheight]{figs_school/eu_flag}
                \end{minipage}
            };
        \end{tikzpicture}
    }
}}

\newcommand\agimussubtitleframe[2]{
        {
        \usebackgroundtemplate{
            \includegraphics[width=\paperwidth, height=\paperheight]{figs_school/subsection_bg}
        }
        \begin{frame}{}
            \begin{minipage}[t]{\agimusframemargin}
                \vspace{\paperheight}
            \end{minipage}%
            \begin{minipage}[t]{\textwidth-\agimusframemargin}
                \vspace{0pt}
                \includegraphics[width=0.35\linewidth]{figs_school/logo_white}\\
                \vspace{4cm}\\
                {\bfseries \LARGE \color{white} #1}  \\[\agimustitlesep]
                {\bfseries \large \color{white} #2}
            \end{minipage}
        \end{frame}
    }
}

\mode<handout>{
    \ifnotes
    \setbeameroption{show notes on second screen=bottom}
    \setbeamertemplate{note page}{\vspace{1cm}\insertnote}
    \fi
}
