% vim: ft=tex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{beeper}[2020/07/21]

\DeclareOption{handout}{\PassOptionsToClass{\CurrentOption}{beamer}} 
\ProcessOptions\relax
\LoadClass{beamer}

% Define colors
\definecolor{beeperorange}{RGB}{255, 155, 113}
\definecolor{beeperlightpink}{RGB}{219, 72, 243}
\definecolor{beeperpink}{RGB}{181, 71, 233}
\definecolor{beeperblue}{RGB}{73, 88, 245}

\usetheme[progressbar=frametitle,
          block=fill]{metropolis}
% \setbeamercolor{normal text}{fg=beeperblue}
% \setbeamercolor{altered text}{fg=red}
% \setbeamercolor{example text}{fg=red}
\setbeamercolor{palette primary}{bg=beeperblue}
\setbeamercolor{progress bar}{fg=beeperlightpink}
\setbeamercolor{title separator}{fg=beeperlightpink}

\makeatletter
\setlength{\metropolis@titleseparator@linewidth}{2pt}
\setlength{\metropolis@progressonsectionpage@linewidth}{2pt}
\setlength{\metropolis@progressinheadfoot@linewidth}{1.5pt}
\makeatother

\setbeamercovered{dynamic}
\RequirePackage{graphicx}

\RequirePackage{ifxetex}
\ifxetex\RequirePackage{fontspec}\fi

\RequirePackage{minted}
\RequirePackage{xcolor}
\RequirePackage{hyperref}

\renewcommand*\footnoterule{}
\setminted{autogobble,python3,mathescape,breaklines}
%\usemintedstyle{emacs}

\beamertemplatenavigationsymbolsempty%
\def\logoimage{graphics/lug}

\setlength\parindent{0pt}

\AtBeginDocument{%
    \maketitle
}
