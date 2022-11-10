% <2017-07-19> Frauke Sprenge
% edit: <2020-03-19> Jamie Temple

% ━━ Class Identification ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
\typeout{Beamer class for talks with F4 style}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{f4_beamer}[2022/03/19 beamer class F4 style]

% ━━ Packages  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
\RequirePackage{ifthen}
\RequirePackage{etex} 
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern} 
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{graphicx}
\RequirePackage{lipsum}

% ━━ Global Variables  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
\def \fhhlogo{./img/logo.png}
\def \wortmarke{./img/wortmarke.png}

% ━━ Pre-Settings  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
\DeclareOption{ngerman}{
  \PassOptionsToPackage{\CurrentOption}{babel}
}

\DeclareOption{english}{
  \PassOptionsToPackage{\CurrentOption}{babel}
}

\ExecuteOptions{ngerman}
\ExecuteOptions{english}
\ProcessOptions

\LoadClass[german, compress, hyperref={pdfpagelabels=false},
  unknownkeysallowed]{beamer}
\RequirePackage{babel}
\RequirePackage{geometry}
\geometry{paperwidth=16cm,paperheight=9cm} % 16 zu 9 format

% ━━ Beamer Template  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
\mode<presentation>{%

  \hypersetup{%
    pdffitwindow=true,
    pdfpagelayout=SinglePage,
    breaklinks=true,
    urlcolor=Gray
  }

  % themes for basics styles
  \usetheme{default}
  \useinnertheme{circles}
  \usecolortheme{orchid}

  % general template settings
  \setbeamercovered{invisible}
  \setbeamertemplate{theorems}[numbered]
  \setbeamertemplate{captions}[numbered]
  \setbeamertemplate{bibliography item}[book]
  \setbeamertemplate{items}[circle]
  \setbeamertemplate{bibliography item}[book]

  % default, professionalfonts, serif, structurebold
  \usefonttheme{structurebold}

  % algin left
  \raggedright


  \titlegraphic{\includegraphics[width=0.15\textwidth]{\wortmarke}}

  \defbeamertemplate*{title page}{customized}[1][]{%
    \inserttitlegraphic\par\vfill\vfill
    \usebeamerfont{title}{\bfseries \inserttitle}
    \par
    \usebeamerfont{subtitle}{\slshape \insertsubtitle}
    \par\bigskip
    \usebeamerfont{author}{
      \footnotesize\insertauthor\par
      \usebeamerfont{date}
      \insertdate\par
    }
    \vspace*{-1cm}
  }

  \AtBeginDocument{%
    \setcounter{framenumber}{0}{%
      \setbeamertemplate{footline}{}
      \setbeamertemplate{sidebar right}{%
        ~\vfill\par
        \mbox{}\hspace{-2cm}
        \includegraphics[width=3cm]{\fhhlogo}
      }
    \maketitle 
    }
  }

  \AtBeginSection[]
  {
    \begin{frame}<beamer>
      \tableofcontents[currentsection,hideothersubsections]
    \end{frame}
  }

% ━━ Frame layout ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  % redefine hrulefill to change thickness of line
  \def\hrulefill{\leavevmode\leaders\hrule height 2pt\hfill\kern\z@}

  \pgfdeclareimage[height=1.7cm]{fhh-logo}{\fhhlogo}
  \logo{\pgfuseimage{fhh-logo}}  

  \definecolor{structureOrange}{rgb}{0.8627, 0.2353, 0.0196}

  \renewcommand{\alert}[1]{{\textcolor{structureOrange}{#1}}}

  \setbeamertemplate{navigation symbols}{%
    \insertslidenavigationsymbol{}
    \insertframenavigationsymbol{}
    \insertbackfindforwardnavigationsymbol{}%
  }

  \setbeamertemplate{sidebar left}{}
  
  \setbeamertemplate{footline}{%
    \hspace{0.1cm}
    \parbox{0.95\textwidth}{{%
      \fontsize{6}{8}
      \mbox{~}\textcolor{structureOrange}{\hrulefill}\mbox{} \\
      \mbox{~}{\bfseries Hochschule Hannover}, Fak. IV, \insertshortauthor{}, 
      \insertshorttitle{}, \insertdate{} \hfill \insertframenumber{}
      \vspace*{8pt}
    }}
    \hspace{0.1cm}
  }

  \setbeamersize{sidebar width right=1.5cm}
  \setbeamertemplate{sidebar right}{~ \vfill \insertlogo \vspace*{10pt} 

    ~}

  \setbeamercolor{structure}{fg=structureOrange!70!black}
}
