%%%  KI UP Diplom Class
%%%  Copyright (C) 2012 Martin Rotter, <rotter.martinos@gmail.com>
%%%  Copyright (C) 2014 Jan Outrata, <jan.outrata@upol.cz>

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{updiplom}[2012/09/09 UP Diploma Class]
\ClassWarningNoLine{updiplom}{[updiplom] You are using updiplom style 0.93}

\LoadClass[12pt]{article}

\RequirePackage{kvoptions}

\SetupKeyvalOptions {
	family=upd,
	prefix=upd@
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Deklarace parametrů.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareBoolOption{master}
\DeclareStringOption[ainfp]{field}[ainfp]
\DeclareStringOption[serif]{font}[serif]
\DeclareStringOption[utf8]{encoding}[utf8]
\DeclareStringOption[utf8]{bibencoding}[utf8]
\DeclareStringOption[czech]{language}[czech]
\DeclareStringOption[false]{printversion}[false]
\DeclareStringOption[true]{joinlists}[true]
\DeclareStringOption[true]{figures}[true]
\DeclareStringOption[true]{tables}[true]
\DeclareStringOption[false]{theorems}[false]
\DeclareStringOption[false]{sourcecodes}[false]
\DeclareStringOption[false]{glossaries}[false]
\DeclareStringOption[false]{index}[false]
\DeclareStringOption[true]{biblatex}[true]

%% Nerozpoznaný parametr hodí chybu.
\DeclareDefaultOption{\ClassWarningNoLine{updiplom}{[updiplom] Option '\CurrentOption' was not recognized}}

\ProcessKeyvalOptions*

\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{lastpage}

\RequirePackage[
  font=\upd@font,
  printversion=\upd@printversion,
  joinlists=\upd@joinlists,
  figures=\upd@figures,
  tables=\upd@tables,
  sourcecodes=\upd@sourcecodes,
  theorems=\upd@theorems,
  glossaries=\upd@glossaries,
  language=\upd@language,
  bibencoding=\upd@bibencoding,
  encoding=\upd@encoding,
  index=\upd@index,
  biblatex=\upd@biblatex
]{upbase}

% Nastavení geometrie papíru.
\RequirePackage[
  paper=a4paper,
  driver=pdftex,
  top=3.5cm,
  left=4cm,
  bottom=3.5cm,
  width=1.05\textwidth
]{geometry}

\ifthenelse{\boolean{@twoside}}{
  \ClassError{updiplom}{Two-sided document mode is not allowed for updiplom}
}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Nastavení dynamických textů.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Čeština.
\def\@bachelorcz{bakal\'a\v rsk\'a pr\'ace}
\def\@mastercz{diplomov\'a pr\'ace}
\def\@fieldinfcz{Informatika}
\def\@fieldainfcz{Aplikovan\'a informatika}
\def\@fieldinfvcz{Informatika pro vzd\v el\'av\'an\'i}
\def\@fielduvtcz{U\v citelstv\'i v\'ypo\v cetn\'i techniky pro
        st\v redn\'i \v skoly}
\def\@fieldbinfcz{Bioinformatika}
\def\@presentformcz{prezen\v cn\'i forma}
\def\@combinedformcz{kombinovan\'a forma}
\def\@czlangcz{\v cesk\'y}
\def\@enlangcz{anglick\'y}

\def\@textbibinfocz{Bibliografick\'e \'udaje}
\def\@texttitlecz{N\'azev pr\'ace}
\def\@textauthorcz{Autor}
\def\@textuppapercz{Typ pr\'ace}
\def\@textdeptcz{Pracovi\v st\v e}
\def\@textyearofsubmitcz{Rok obhajoby}
\def\@textpagescz{Po\v cet stran}
\def\@textsupplcz{P\v r\'ilohy}
\def\@textsupervisorcz{Vedouc\'i pr\'ace}
\def\@textfieldcz{Studijn\'i obor}
\def\@textlangcz{Jazyk práce}
\def\@textanotcz{Anotace}
\def\@textkeywordscz{Klí\v cov\'a slova}
\def\@textconclusionscz{Z\'av\v er}

% Angličtina.
\def\@bacheloren{bachelor thesis}
\def\@masteren{master thesis}
\def\@fieldinfen{Computer Science}
\def\@fieldainfen{Applied Computer Science}
\def\@fieldinfven{Computer Science for Education}
\def\@fielduvten{Computer Science for Education}
\def\@fieldbinfen{Bioinformatics}
\def\@presentformen{full-time form}
\def\@combinedformen{combined form}
\def\@czlangen{czech}
\def\@enlangen{english}

\def\@textbibinfoen{Bibliograhic info}
\def\@texttitleen{Title}
\def\@textauthoren{Author}
\def\@textuppaperen{Thesis type}
\def\@textdepten{Department}
\def\@textyearofsubmiten{Year of defense}
\def\@textpagesen{Page count}
\def\@textsupplen{Supplements}
\def\@textsupervisoren{Supervisor}
\def\@textfielden{Study field}
\def\@textlangen{Thesis language}
\def\@textanoten{Synopsis}
\def\@textkeywordsen{Keywords}
\def\@textconclusionsen{Conclusions}

\ifthenelse{\boolean{upd@master}}{
  \def\@uppapercz{\@mastercz}
  \def\@uppaperen{\@masteren}
  \ifthenelse{\equal{\upd@field}{uvt}}{
    \def\@fielden{\@fielduvten, \@presentformen}
    \def\@fieldcz{\@fielduvtcz, \@presentformcz}
  }{
    \ifthenelse{\equal{\upd@field}{binf}}{
      \def\@fielden{\@fieldbinfen, \@presentformen}
      \def\@fieldcz{\@fiendbinfcz, \@presentformcz}
    }{
      % \ifthenelse{\equal{\upd@field}{inf}}
      \def\@fielden{\@fieldinfen, \@presentformen}
      \def\@fieldcz{\@fieldinfcz, \@presentformcz}
    }
  }
}{
  \def\@uppapercz{\@bachelorcz}
  \def\@uppaperen{\@bacheloren}
  \ifthenelse{\equal{\upd@field}{ainfk}}{
    \def\@fielden{\@fieldainfen, \@combinedformen}
    \def\@fieldcz{\@fieldainfcz, \@combinedformcz}
  }{
    \ifthenelse{\equal{\upd@field}{inf}}{
      \def\@fielden{\@fieldinfen, \@presentformen}
      \def\@fieldcz{\@fieldinfcz, \@presentformcz}
    }{
      \ifthenelse{\equal{\upd@field}{infv}}{
        \def\@fielden{\@fieldinfven, \@presentformen}
        \def\@fieldcz{\@fieldinfvcz, \@presentformcz}
      }{
        \ifthenelse{\equal{\upd@field}{binf}}{
          \def\@fielden{\@fieldbinfen, \@presentformen}
          \def\@fieldcz{\@fieldbinfcz, \@presentformcz}
        }{
          % \ifthenelse{\equal{\upd@field}{ainfp}}
          \def\@fielden{\@fieldainfen, \@presentformen}
          \def\@fieldcz{\@fieldainfcz, \@presentformcz}
        }
      }
    }
  }
}

% Angličtina.
\ifthenelse{\equal{\upb@language}{english}}{
  \def\@uppaper{\@uppaperen}
  \def\@textfield{\@textfielden}
  \def\@field{\@fielden}
  \def\@textsupervisor{\@textsupervisoren}
  \def\@langcz{\@enlangcz}
  \def\@langen{\@enlangen}
  \def\@textanot{\@textanoten}
  \def\@textkeywords{\@textkeywordsen}
  \def\@textaffirm{Hereby I affirm that I completed the whole thesis
    including appendices on my own and that I cite in the thesis text and
    include in the bibliography list all used sources.}
  \def\@textsubmitdate{date of thesis submission}
  \def\@textsigniture{author's signature}
}{
  % Čeština.
  % \ifthenelse{\equal{\upb@language}{czech}}
  \def\@uppaper{\@uppapercz}
  \def\@textfield{\@textfieldcz}
  \def\@field{\@fieldcz}
  \def\@textsupervisor{\@textsupervisorcz}
  \def\@langcz{\@czlangcz}
  \def\@langen{\@czlangen}
  \def\@textanot{\@textanotcz}
  \def\@textkeywords{\@textkeywordscz}
  \def\@textaffirm{M\'istop\v r\'ise\v zn\v e prohla\v suji, \v ze
    jsem celou pr\'aci v\v cetn\v e p\v r\'iloh vypracoval/a
    samostatn\v e a \v ze v\v sechny pou\v zit\'e zdroje v textu pr\'ace cituji a
    uv\'ad\'im v seznamu literatury.}
  \def\@textsubmitdate{datum odevzd\'an\'i pr\'ace}
  \def\@textsigniture{podpis autora}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Závěry.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{upconclusions}[1][\upb@language]{
  \cleardoublepage
  \bgroup
  \phantomsection
  \ifthenelse{\equal{#1}{english}}{
    \addcontentsline{toc}{section}{\@textconclusionsen}
    \section*{\@textconclusionsen}
    \begin{otherlanguage}{english}
  }{
    \addcontentsline{toc}{section}{\@textconclusionscz}
    \section*{\@textconclusionscz}
    \begin{otherlanguage}{czech}
  }
}{
  \end{otherlanguage}
  \egroup
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Titulní strany.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Název práce.
%\def\title#1{\gdef\@title{#1}}
\renewcommand{\title}[2][\upb@language]{
  \ifthenelse{\equal{#1}{english}}{
    \gdef\@titleen{#2}
  }{
    \gdef\@titlecz{#2}
  }
}

% Podnázev práce.
%\def\subtitle#1{\gdef\@subtitle{#1}}
\newcommand{\subtitle}[2][\upb@language]{
  \ifthenelse{\equal{#1}{english}}{
    \gdef\@subtitleen{#2}
  }{
    \gdef\@subtitlecz{#2}
  }
}

% Anotace.
\newcommand{\annotation}[2][\upb@language]{
  \ifthenelse{\equal{#1}{english}}{
    \gdef\@annotationen{#2}
  }{
    \gdef\@annotationcz{#2}
  }
}
\newcommand{\keywords}[2][\upb@language]{
  \ifthenelse{\equal{#1}{english}}{
    \gdef\@keywordsen{#2}
  }{
    \gdef\@keywordscz{#2}
  }
}
\newcommand{\supplements}[2][\upb@language]{
  \ifthenelse{\equal{#1}{english}}{
    \gdef\@supplen{#2}
  }{
    \gdef\@supplcz{#2}
  }
}
\ifthenelse{\equal{\upb@language}{english}}{
  \gdef\@title{\@titleen}
  \gdef\@subtitle{\@subtitleen}
}{
  \gdef\@title{\@titlecz}
  \gdef\@subtitle{\@subtitlecz}
}
\def\author#1{\gdef\@author{#1}}

% Datum odevzdání práce.
\def\yearofsubmit#1{\gdef\@yearofsubmit{#1}}
\def\supervisor#1{\gdef\@supervisor{#1}}

% Poděkování.
\def\thanks#1{\gdef\@thanks{#1}}

% Výchozí hodnoty.
\ifthenelse{\equal{\upb@language}{english}}{
  \author{Author name}
  \supervisor{Supervisor name}
}{
  \author{Jm\'eno autora}
  \supervisor{Jm\'eno vedouc\'iho pr\'ace}
}
\title[czech]{N\'azev pr\'ace}
\title[english]{Thesis title}
\subtitle[czech]{}
\subtitle[english]{}
\annotation[czech]{V\'ysti\v zn\'a anotace pr\'ace}
\annotation[english]{Apposite thesis synopsis}
\keywords[czech]{stru\v cn\'a vhodn\'a kl\'i\v cov\'a slova}
\keywords[english]{short appropriate keywords}
\yearofsubmit{\the\year}
\supplements[czech]{1 CD/DVD}
\supplements[english]{1 CD/DVD}

\ifthenelse{\equal{\upb@language}{czech}}{
  %% HACK: pro sekvenční fyzické číslování stránek, protože
  %% např. \tableofcontents číslování resetuje.
  \let\orgsetcounter=\setcounter
  \renewcommand\setcounter[2]{%
    \def\tempa{#1}%
    \def\tempb{page}%
    \ifx\tempa\tempb\else\orgsetcounter{#1}{#2}\fi}
}{
  \relax
}

\def\maketitle{
\hypertarget{up:paper}{}
\bookmark[dest=up:paper]{\@title}
\ifthenelse{\equal{\upb@language}{english}}{
  \pagenumbering{roman}
}{}
% Číslování stran od 1.
\setcounter{page}{1}

% Titulní strana.
\begin{titlepage}
\hypertarget{up:title}{}
\bookmark[
  rellevel=1,
  keeplevel,
  dest=up:title
]{\uptexttitle}
\begin{center}
{\fontfamily{ppl}\selectfont \large \MakeUppercase{\uptextdept} \par
  \MakeUppercase{\uptextfaculty} \par \MakeUppercase{\uptextuniv} \par}
\vfill
{\LARGE\bfseries{\MakeUppercase{\@uppaper}} \\}
\vfill
{\Large \@title \\[4ex]\large\@subtitle}

\vfill
\centering
\includegraphics[width=2.5cm]{\uplogofile}
\vfill

\begin{tabular}{@{}p{6cm}@{}@{\hspace{1cm}}@{}p{7cm}@{}}
{\Large\@yearofsubmit} & {\Large\@author} \\[2ex]
\@textsupervisor: \@supervisor & \@textfield: \@field
\end{tabular}

\end{center}
\end{titlepage}

% Strana s bibliografickými identifikačními údaji.
\thispagestyle{empty}
{\small
{\bf \@textbibinfocz} \par
\bigskip
\renewcommand{\arraystretch}{1.5}
\begin{tabular}{@{}p{3cm}@{\hspace{.5cm}}@{}p{10cm}@{}}
\@textauthorcz: & \@author \\
\@texttitlecz: & \@titlecz%
\ifthenelse{\equal{\@subtitlecz}{}}{%
  \relax
}{%
, \@subtitlecz
} \\
\@textuppapercz: & \@uppapercz \\
\@textdeptcz: & \uptextdeptcz, \uptextfacultycz, \uptextunivcz \\
\@textyearofsubmitcz: & \@yearofsubmit \\
\@textfieldcz: & \@fieldcz \\
\@textsupervisorcz: & \@supervisor \\
\@textpagescz: & \nohref{\pageref{LastPage}} \\
\@textsupplcz: & \@supplcz \\
\@textlangcz: & \@langcz
\end{tabular}
\par
\vspace*{8ex}
{\bf \@textbibinfoen} \par
\bigskip
\renewcommand{\arraystretch}{1.5}
\begin{tabular}{@{}p{3cm}@{\hspace{.5cm}}@{}p{10cm}@{}}
\@textauthoren: & \@author \\
\@texttitleen: & \@titleen%
\ifthenelse{\equal{\@subtitleen}{}}{%
  \relax
}{%
, \@subtitleen
} \\
\@textuppaperen: & \@uppaperen \\
\@textdepten: & \uptextdepten, \uptextfacultyen, \uptextuniven \\
\@textyearofsubmiten: & \@yearofsubmit \\
\@textfielden: & \@fielden \\
\@textsupervisoren: & \@supervisor \\
\@textpagesen: & \nohref{\pageref{LastPage}} \\
\@textsupplen: & \@supplen \\
\@textlangen: & \@langen
\end{tabular}
}

% Strana s anotací a klíčovými slovy.
\cleardoublepage
\thispagestyle{empty}
\null\vfill
\hypertarget{up:anotation}{}
\bookmark[
  rellevel=1,
  keeplevel,
  dest=up:anotation
]{\@textanot}
\begin{center}
\textbf{\@textanotcz}
\end{center}
\bigskip
\emph{\@annotationcz}
\vspace*{4ex}
\begin{center}
\textbf{\@textanoten}
\end{center}
\bigskip
\emph{\@annotationen}
\par
\vspace*{10ex}
\noindent\textbf{\@textkeywordscz:} \@keywordscz
\par
\vspace*{2ex}
\noindent\textbf{\@textkeywordsen:} \@keywordsen
\vfill\null

% Strana s prohlášením.
\clearpage
\thispagestyle{empty}
\null\vfill
\ifthenelse{\equal{\@thanks}{}}{
\relax
}{
\noindent\@thanks
}
\vfill
\noindent\emph{\@textaffirm}\par
\vspace*{10ex}
\noindent\@textsubmitdate \hfill \@textsigniture

% Obsah a seznamy obrázků, tabulek, vět a zdrojových kódů.
\tableofcontents
\upprintlists

\ifthenelse{\equal{\upb@language}{english}}{
  \pagenumbering{arabic}
  \setcounter{page}{1}
}{}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Info o dokumentu.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginDocument{
\hypersetup{
  pdftitle={\@title\ (\@uppaper)},                           % nadpis
  pdfauthor={\@author\ (\@textsupervisor: \@supervisor)},    % autor dokumentu
  pdfsubject={\@title\ (\@uppaper)},                         % předmět dokumentu
  pdfcreator={\@author},                                     % tvůrce dokumentu
}
}

\endinput