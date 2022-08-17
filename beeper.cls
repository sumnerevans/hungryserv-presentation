% vim: ft=tex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{beeper}[2020/07/21]

\DeclareOption{handout}{\PassOptionsToClass{\CurrentOption}{beamer}} 
\ProcessOptions\relax
\LoadClass{beamer}

% Define colors
\definecolor{beeperpink}{RGB}{255, 73, 107}

\usetheme[progressbar=frametitle,
          block=fill]{metropolis}
% \setbeamercolor{altered text}{fg=red}
% \setbeamercolor{example text}{fg=red}
\setbeamercolor{palette primary}{bg=beeperpink}
% \setbeamercolor{progress bar}{fg=red}
\setbeamercolor{title separator}{fg=beeperpink}

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
