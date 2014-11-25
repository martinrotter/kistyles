\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{updiplom}[2012/09/09 UP Diploma Class]
\PackageWarningNoLine{updiplom}{[updiplom] You are using updiplom style 0.89}

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
\DeclareStringOption[false]{iwona}[false]
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

%% Nerozpoznaný parametr hodí chybu.
\DeclareDefaultOption{\PackageWarningNoLine{updiplom}{[updiplom] Option '\CurrentOption' was not recognized}}

\ProcessKeyvalOptions*

\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{lastpage}

\RequirePackage[
  iwona=\upd@iwona,
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
  index=\upd@index
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
  \PackageError{updiplom}{Two-sided document mode is not allowed for updiplom}
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
\def\@fielduvt{U\v citelstv\'i v\'ypo\v cetn\'i techniky pro
        st\v redn\'i \v skoly}
\def\@fieldbinf{Bioinformatika}
\def\@presentformcz{prezen\v cn\'i forma}
\def\@combinedformcz{kombinovan\'a forma}

\def\@textbibinfocz{Bibliografick\'e \'udaje}
\def\@texttitlecz{N\'azev pr\'ace}
\def\@textauthorcz{Autor}
\def\@textuppapercz{Typ pr\'ace}
\def\@textdeptcz{Katedra}
\def\@textyearofsubmitcz{Rok obhajoby}
\def\@textpagescz{Po\v cet stran}
\def\@textsupplcz{P\v r\'ilohy}
\def\@textsupervisorcz{Vedouc\'i pr\'ace}
\def\@textfieldcz{Studijn\'i obor}
\def\@textconclusionscz{Z\'av\v er}

% Angličtina.
\def\@bacheloren{bachelor thesis}
\def\@masteren{master thesis}
\def\@fieldinfen{Computer Science}
\def\@fieldainfen{Applied Computer Science}
\def\@fieldinfven{Computer Science for Education}
\def\@fielduvten{Computer Science for Education}
\def\@fieldbinfen{Bioinformatics}
\def\@presentformen{present form}
\def\@combinedformen{combined form}

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
  \def\@textanot{Synopsis}
  \def\@textkeywords{Keywords}
  \def\@textaffirm{Hereby I affirm that I completed the whole thesis
    including appendices on my own and that I included all the sources
    used during the thesis creation.}
  \def\@textsubmitdate{Date of thesis submission}
  \def\@textsigniture{Author's signature}
}{
  % Čeština.
  % \ifthenelse{\equal{\upb@language}{czech}}
  \def\@uppaper{\@uppapercz}
  \def\@textfield{\@textfieldcz}
  \def\@field{\@fieldcz}
  \def\@textsupervisor{\@textsupervisorcz}
  \def\@textanot{Anotace}
  \def\@textkeywords{Klí\v cov\'a slova}
  \def\@textaffirm{M\'istop\v r\'ise\v zn\v e prohla\v suji, \v ze
    jsem celou pr\'aci v\v cetn\v e p\v r\'iloh vypracoval/a
    samostatn\v e a \v ze jsem uvedl/a v\v sechny zdroje pou\v zit\'e p\v ri tvorb\v e pr\'ace.}
  \def\@textsubmitdate{Datum odevzd\'an\'i pr\'ace}
  \def\@textsigniture{Podpis autora}
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

%\def\title#1{\gdef\@title{#1}}
\renewcommand{\title}[2][\upb@language]{
  \ifthenelse{\equal{#1}{english}}{
    \gdef\@titleen{#2}
  }{
    \gdef\@titlecz{#2}
  }
}
%\def\subtitle#1{\gdef\@subtitle{#1}}
\newcommand{\subtitle}[2][\upb@language]{
  \ifthenelse{\equal{#1}{english}}{
    \gdef\@subtitleen{#2}
  }{
    \gdef\@subtitlecz{#2}
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
\def\yearofsubmit#1{\gdef\@yearofsubmit{#1}}
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\thanks#1{\gdef\@thanks{#1}}
\def\annotation#1{\gdef\@annotation{#1}}
\def\keywords#1{\gdef\@keywords{#1}}

% Výchozí hodnoty.
\ifthenelse{\equal{\upb@language}{english}}{
  \author{Author name}
  \supervisor{Supervisor name}
  \annotation{Apposite thesis synopsis}
  \keywords{short appropriate keywords}
}{
  \author{Jm\'eno autora}
  \supervisor{Jm\'eno vedouc\'iho pr\'ace}
  \annotation{V\'ysti\v zn\'a anotace pr\'ace}
  \keywords{stru\v cn\'a vhodn\'a kl\'i\v cov\'a slova}
}
\title[czech]{N\'azev pr\'ace}
\title[english]{Thesis title}
\subtitle[czech]{}
\subtitle[english]{}
\yearofsubmit{\the\year}
\supplements[czech]{1 CD/DVD}
\supplements[english]{1 CD/DVD}

\ifthenelse{\equal{\upb@language}{czech}}{
  %% HACK: Nastavení čísla strany.
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
  \MakeUppercase{\uptextfaculty} \par \MakeUppercase{\uptextuniv}}
\vfill
{\LARGE\bfseries{\MakeUppercase{\@uppaper}} \\}
\vfill
{\Large \@title \\[2em]\large\@subtitle}

\vfill
\centering
\includegraphics[width=2.5cm]{\uplogofile}
\vfill

\begin{tabular}{@{}p{6cm}@{}@{\hspace{1cm}}@{}p{7cm}@{}}
{\Large\@yearofsubmit} & {\Large\@author} \\[1em]
\@textsupervisor: \@supervisor & \@textfield: \@field
\end{tabular}

\end{center}
\end{titlepage}

% Strana s bibliografickými identifikačními údaji
\thispagestyle{empty}
{\small
{\bf \@textbibinfocz} \par
\bigskip
\renewcommand{\arraystretch}{1.5}
\begin{tabular}{@{}p{2.5cm}@{\hspace{1cm}}@{}p{10cm}@{}}
\@texttitlecz: & \@titlecz%
\ifthenelse{\equal{\@subtitlecz}{}}{%
  \relax
}{%
, \@subtitlecz
} \\
\@textauthorcz: & \@author \\
\@textuppapercz: & \@uppapercz \\
\@textdeptcz: & \uptextdeptcz, \uptextfacultycz, \uptextunivcz \\
\@textyearofsubmitcz: & \@yearofsubmit \\
\@textsupervisorcz: & \@supervisor \\
\@textfieldcz: & \@fieldcz \\
\@textpagescz: & \pageref{LastPage} \\
\@textsupplcz: & \@supplcz
\end{tabular}
\par
\vspace*{5ex}
{\bf \@textbibinfoen} \par
\bigskip
\renewcommand{\arraystretch}{1.5}
\begin{tabular}{@{}p{2.5cm}@{\hspace{1cm}}@{}p{10cm}@{}}
\@texttitleen: & \@titleen%
\ifthenelse{\equal{\@subtitleen}{}}{%
  \relax
}{%
, \@subtitleen
} \\
\@textauthoren: & \@author \\
\@textuppaperen: & \@uppaperen \\
\@textdepten: & \uptextdepten, \uptextfacultyen, \uptextuniven \\
\@textyearofsubmiten: & \@yearofsubmit \\
\@textsupervisoren: & \@supervisor \\
\@textfielden: & \@fielden \\
\@textpagesen: & \pageref{LastPage} \\
\@textsupplen: & \@supplen
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
\textbf{\@textanot}
\end{center}
\bigskip
\emph{\@annotation}
\par
\vspace*{5em}
\noindent\textbf{\@textkeywords:} \@keywords
\vfill\null

% Strana s prohlášením
\clearpage
\thispagestyle{empty}
\null\vfill
\ifthenelse{\equal{\@thanks}{}}{
\relax
}{
\noindent\@thanks
}
\vfill
\noindent\@textaffirm\par
\vspace*{3cm}
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
%% Hypertexty.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginDocument{
\hypersetup{
  pdftitle={\@title\ (\@uppaper)},                            % nadpis
  pdfauthor={\@author\ (\@textsupervisor\@supervisor)},      % autor dokumentu
  pdfsubject={\@title\ (\@uppaper)},                          % předmět dokumentu
  pdfcreator={\@author},                                      % tvůrce dokumentu
}
}

\endinput