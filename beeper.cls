% vim ft=latex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{beeper}[2020/07/21]

\LoadClass{beamer}

\usetheme[numbering=none,
          progressbar=frametitle,
          block=fill]{metropolis}
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
