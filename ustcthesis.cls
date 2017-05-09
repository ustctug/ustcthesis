%%
%% This is file `ustcthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% ustcthesis.dtx  (with options: `class')
%% 
%% Copyright (C) 2015-2017 by Zeping Lee <zepinglee AT gmail.com>
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either
%% version 1.2 of this license or (at your option) any later
%% version. The latest version of this license is in:
%% 
%%     http://www.latex-project.org/lppl.txt
%% 
%% and version 1.2 or later is part of all distributions of
%% LaTeX version 1999/12/01 or later.
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{ustcthesis}
    [2017/05/09 v2.2.4 USTC thesis template]
\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=ustc@opt, prefix=ustc@opt@, setkeys=\kvsetkeys}
\DeclareBoolOption[false]{doctor}
\DeclareBoolOption[false]{master}
\DeclareBoolOption[false]{bachelor}
\DeclareBoolOption[false]{pdf}
\DeclareComplementaryOption{print}{pdf}
\DeclareBoolOption[false]{english}
\DeclareComplementaryOption{chinese}{english}
\SetupKeyvalOptions{family=ustc@page, prefix=ustc@page@, setkeys=\kvsetkeys}
\DeclareBoolOption[false]{oneside}
\DeclareComplementaryOption{twoside}{oneside}
\DeclareBoolOption[false]{openany}
\DeclareComplementaryOption{openright}{openany}
\DeclareBoolOption[true]{pageouter}
\DeclareComplementaryOption{pagecenter}{pageouter}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessKeyvalOptions{ustc@opt}
\ifustc@opt@bachelor
    \ustc@page@onesidetrue
    \ustc@page@pageouterfalse
\fi
\ifustc@opt@pdf
    \ustc@page@onesidetrue
    \ustc@page@pageouterfalse
\fi
\ifustc@opt@english
  \PassOptionsToClass{scheme=plain}{ctexbook}
\fi
\ProcessKeyvalOptions*\relax
\ifustc@page@oneside
    \PassOptionsToClass{oneside}{ctexbook}
\fi
\ifustc@page@openany
    \PassOptionsToClass{openany}{ctexbook}
\fi
\PassOptionsToPackage{no-math}{fontspec}
\LoadClass[a4paper, UTF8, zihao=-4]{ctexbook}[2015/05/14]
\@ifclasslater{ctexbook}{2015/05/14}{}{%
    \ClassError{ustcthesis}{%
        Requiring ctex 2.0 or later version!\MessageBreak
        Please update the package using your\MessageBreak
        TeX package manager or from CTAN
    }{%
        See ustcthesis.pdf for more detailed update guide.
    }
}
\setmainfont{Times New Roman}
\setsansfont{Arial}
\setmonofont{Courier New}
\RequirePackage{hyperref}
\hypersetup{
    bookmarksopen=true,
    bookmarksnumbered=true,
    bookmarksopenlevel=1,
    CJKbookmarks=true,
    pdfborder=0 0 0,
    unicode=true,
    linktoc=all,
}
\urlstyle{rm}
\ifustc@opt@pdf
    \hypersetup{
        colorlinks=true,
        allcolors=blue,
    }
\fi
\AtBeginDocument{
    \hypersetup{
        pdftitle={\ustc@title},
        pdfauthor={\ustc@author}
    }
}
\RequirePackage{xparse}
\DeclareDocumentCommand\setfontsize{mo}{\IfValueTF{#2}{\fontsize{#1}{#2}}{\fontsize{#1}{2\dimexpr#1}}\linespread{1}\selectfont\relax}
\newcommand\zhspace[1][1]{\hspace{#1\ccwd}}
\newcommand\ustc@underline[2][6em]{%
    \hskip1pt\underline{\hb@xt@ #1{\hss#2\hss}}\hskip3pt\relax
}
\def\ustc@define@term#1{
    \expandafter\gdef\csname #1\endcsname##1{
        \expandafter\gdef\csname ustc@#1\endcsname{##1}
    }
    \csname #1\endcsname{}
}
\ustc@define@term{title}
\ustc@define@term{secrettext}
\ustc@define@term{author}
\ustc@define@term{depart}
\ustc@define@term{major}
\ustc@define@term{advisor}
\ustc@define@term{coadvisor}
\ustc@define@term{submitdate}
\ustc@define@term{entitle}
\ustc@define@term{ensecrettext}
\ustc@define@term{enauthor}
\ustc@define@term{enmajor}
\ustc@define@term{enadvisor}
\ustc@define@term{encoadvisor}
\ustc@define@term{ensubmitdate}
\ifustc@opt@english
  \newcommand\ustc@contentsname{\contentsname}
  \newcommand\ustc@pdf@contentsname{\contentsname}
  \renewcommand\figurename{Fig.}
  \newcommand\ustc@notesname{\textbf{Notes}: }
  \newcommand\ustc@acknowledgementsname{Acknowledgements}
  \newcommand\ustc@pdf@acknowledgementsname{Acknowledgements}
  \newcommand\ustc@publicationsname{Publications}
  \newcommand\ustc@notationname{Notation}
\else
  \renewcommand\contentsname{目\zhspace 录}
  \newcommand\ustc@pdf@contentsname{目录}
  \renewcommand\listfigurename{图目录}
  \renewcommand\listtablename{表目录}
  \newcommand\ustc@notesname{\textbf{注}：}
  \newcommand\ustc@acknowledgementsname{致\hspace{\ccwd}谢}
  \newcommand\ustc@pdf@acknowledgementsname{致谢}
  \newcommand\ustc@publicationsname{在读期间发表的学术论文与取得的研究成果}
  \newcommand\ustc@notationname{符号说明}
  \def\equationautorefname~#1\null{公式~(#1)\null}%
  \def\footnoteautorefname{脚注}%
  \def\itemautorefname~#1\null{第~#1~项\null}%
  \def\figureautorefname{图}%
  \def\tableautorefname{表}%
  \def\partautorefname~#1\null{第~#1~部分\null}%
  \def\appendixautorefname{附录}%
  \def\chapterautorefname~#1\null{第~#1~章\null}%
  \def\sectionautorefname~#1\null{第~#1~节\null}%
  \def\subsectionautorefname~#1\null{第~#1~小节\null}%
  \def\subsubsectionautorefname~#1\null{第~#1~小小节\null}%
  \def\paragraphautorefname~#1\null{第~#1~段\null}%
  \def\subparagraphautorefname~#1\null{第~#1~小段\null}%
  \def\theoremautorefname{定理}%
  \def\pageautorefname~#1\null{第~#1~页\null}%
\fi
\RequirePackage{geometry}
\geometry{
    paper=a4paper,
    top=2.54cm, bottom=2.54cm,
    left=3.17cm, right=3.17cm,
    headsep=0.74cm, headheight=0.34cm,
    footskip=0.79cm}
\RequirePackage[pagestyles]{titlesec}
\ifustc@opt@bachelor
    \newcommand\ustc@header@size{\zihao{-5}}
    \newcommand\ustc@main@header{中国科学技术大学本科毕业论文}
\else
    \newcommand\ustc@header@size{\zihao{5}}
    \newcommand\ustc@main@header{%
        \if@mainmatter\CTEXthechapter\quad\fi%
        \chaptertitle}
\fi
\newpagestyle{front}[\ustc@header@size]{
    \sethead{}{\ustc@main@header}{}
    \setfoot{}{\thepage}{}
    \headrule
}
\ifustc@page@pageouter
    \newpagestyle{main}[\ustc@header@size]{
        \sethead{}{\ustc@main@header}{}
            \setfoot[\thepage][][]{}{}{\thepage}
        \headrule
    }
\else
    \newpagestyle{main}[\ustc@header@size]{
        \sethead{}{\ustc@main@header}{}
        \setfoot{}{\thepage}{}
        \headrule
    }
\fi
\renewcommand\frontmatter{%
    \cleardoublepage
    \@mainmatterfalse
    \ifustc@opt@bachelor
        \pagenumbering{gobble}%
    \else
        \pagenumbering{Roman}%
    \fi
    \pagestyle{front}%
}%
\renewcommand\mainmatter{%
    \cleardoublepage
    \@mainmattertrue
    \ifustc@opt@bachelor
        \relax
    \else
        \pagenumbering{arabic}%
    \fi
    \pagestyle{main}%
}%
\renewcommand\chapter{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \global\@topnum\z@
    \@afterindenttrue
    \secdef\@chapter\@schapter
}
\renewcommand\maketitle{%
    \newgeometry{
        top=3.8cm, bottom=3.8cm,
        left=3.2cm, right=3.2cm,
        headheight=0cm, headsep=0.8cm,
        footskip=0.8cm}
    \pagestyle{empty}
    \pdfbookmark[-1]{\ustc@title}{title}
    \make@cntitle \cleardoublepage
    \make@entitle \cleardoublepage
    \restoregeometry
    \ifustc@opt@bachelor\relax\else
        \ifustc@opt@pdf\relax\else%
            \make@statement \cleardoublepage
        \fi
    \fi
    \pagestyle{main}%
}
\ifustc@opt@doctor
    \newcommand\ustc@thesisname{博士学位论文}%
    \newcommand\ustc@enthesisname{A dissertation for doctor's degree}%
\else
    \ifustc@opt@master
        \newcommand\ustc@thesisname{硕士学位论文}
        \newcommand\ustc@enthesisname{A dissertation for master's degree}
    \else
        \newcommand\ustc@thesisname{学士学位论文}
        \newcommand\ustc@enthesisname{A dissertation for bachelor's degree}
    \fi
\fi
\RequirePackage{tikz}
\newcommand\vpostext[2]{%
    \tikz[remember picture,overlay]%
        \node [yshift=-#1] at (current page.north) [below,align=flush center]%
            {\parbox{\textwidth}{\centering#2}};}
\newcommand\make@cntitle{%
    \begin{titlepage}%
        \tikz[remember picture,overlay]%
            \node [yshift=-4cm] at (current page.north) [below,align=flush center]%
                {\parbox{\textwidth}{\raggedleft\fangsong\setfontsize{14bp}\ustc@secrettext}};%
        \vpostext{5.2cm}{\includegraphics[height=37bp]{figures/ustc_logo_text}}%
        \vpostext{8.5cm}{\sffamily\setfontsize{56bp}\ustc@thesisname}%
        \vpostext{11cm}{\includegraphics[height=4cm]{figures/ustc_logo_fig}}%
        \vpostext{15.8cm}{\sffamily\bfseries\setfontsize{26bp}\ustc@title}%
        \tikz[remember picture,overlay]%
            \node [xshift=6cm,yshift=-20.5cm] at (current page.north west)%
            [below right,align=left] {%
                \setfontsize{16bp}%
                \begin{tabular}{@{}l@{}c@{}}%
                    \textsf{作者姓名：} & \ustc@author \\%
                    \textsf{学科专业：} & \ustc@major \\%
                    \textsf{导师姓名：} & \ustc@advisor \\%
                    \textsf{完成时间：} & \ustc@submitdate%
                \end{tabular}};%
    \end{titlepage}}
\newcommand\make@entitle{%
    \begin{titlepage}%
        \tikz[remember picture,overlay]%
            \node [yshift=-4cm] at (current page.north) [below,align=flush center]%
                {\parbox{\textwidth}{\raggedleft\setfontsize{14bp}\ustc@ensecrettext}};%
        \vpostext{5cm}{\sffamily\setfontsize{20bp}[30bp]%
            University of Science and Technology of China}%
        \vpostext{6cm}{\sffamily\setfontsize{26bp}[30bp]\ustc@enthesisname}%
        \vpostext{8.2cm}{\includegraphics[height=5cm]{figures/ustc_logo_fig}}%
        \vpostext{16cm}{\sffamily\bfseries\setfontsize{26bp}[30bp]\ustc@entitle}%
        \tikz[remember picture,overlay]%
            \node [xshift=6cm,yshift=5cm] at (current page.south west)%
            [above right,align=left] {%
                \setfontsize{16bp}[30bp]%
                \begin{tabular}{@{}lc@{}}%
                    Author's Name: & \ustc@enauthor \\%
                    Speciality:    & \ustc@enmajor \\%
                    Supervisor:    & \ustc@enadvisor \\%
                    Finished Time: & \ustc@ensubmitdate%
                \end{tabular}};%
    \end{titlepage}}
\newcommand{\ustc@declaretext} {
本人声明所呈交的学位论文，是本人在导师指导下进行研究工作所取得的成果。
除已特别加以标注和致谢的地方外，论文中不包含任何他人已经发表或撰写过
的研究成果。与我一同工作的同志对本研究所做的贡献均已在论文中作了明确的说明。
}
\newcommand{\ustc@authorization}{
作为申请学位的条件之一，学位论文著作权拥有者授权中国科学技术大学拥有
学位论文的部分使用权，即：学校有权按有关规定向国家有关部门或机构送交
论文的复印件和电子版，允许论文被查阅和借阅，可以将学位论文编入《中国
学位论文全文数据库》等有关数据库进行检索，可以采用影印、缩印或扫描等
复制手段保存、汇编学位论文。本人提交的电子文档的内容和纸质论文的内容
相一致。

保密的学位论文在解密后也遵守此规定。
}
\newcommand\make@statement{
    \setfontsize{12bp}[20bp]
    \vspace*{-0.15cm}
    \begin{center}
      \setfontsize{16bp}\textbf{中国科学技术大学学位论文原创性声明}
    \end{center}
    \vskip 0.3cm

    \ustc@declaretext\par

    \vskip 0.7cm
    \begin{tabular}{p{7cm}p{7cm}}
      作者签名：\ustc@underline[7.4em]{} & 签字日期：\ustc@underline[7.4em]{}
    \end{tabular}
    \vskip 2.6cm

    \begin{center}
      \setfontsize{16bp}\textbf{中国科学技术大学学位论文授权使用声明}
    \end{center}
    \vskip 0.3cm

    \ustc@authorization\par
    \vskip 0.5cm
    $\square$公开 \hspace{0.4cm} $\square$保密（\ustc@underline[2em]{}年）

    \vskip 0.5cm

    {\renewcommand{\arraystretch}{2.0}
    \begin{tabular}{p{7cm}p{7cm}}
      作者签名：\ustc@underline[7.4em]{} & 导师签名：\ustc@underline[7.4em]{} \\
      签字日期：\ustc@underline[7.4em]{} & 签字日期：\ustc@underline[7.4em]{} \\
    \end{tabular}}
}
\newenvironment{abstract}{%
    \ifustc@opt@bachelor
        \ctexset{chapter/format += \zihao{-2}}
    \fi
    \chapter[摘要]{摘\zhspace 要}}{}
\newenvironment{enabstract}{%
    \ifustc@opt@bachelor
        \ctexset{chapter/format += \zihao{-2}}
        \chapter{Abstract}
    \else
        \chapter[Abstract]{ABSTRACT}
    \fi}{}
\newcommand\keywords[1]{\par\phantom{关键词}\par\noindent\hangindent=4\ccwd\relax
    \textbf{关键词：}#1}
\newcommand\enkeywords[1]{\par\phantom{keywords}\par\noindent\hangindent=5.3em\relax
    \textbf{Key Words:} #1}
\let\ustc@save@tableofcontents=\tableofcontents
\renewcommand\tableofcontents{%
    \cleardoublepage%
    \ifustc@opt@bachelor
        \pagenumbering{arabic}%
    \fi
    \pdfbookmark[0]{\ustc@pdf@contentsname}{ustctoc}%
    \ustc@save@tableofcontents}
\RequirePackage{titletoc}
\newcommand\ustc@leaders{\titlerule*[0.5pc]{$\cdot$}}
\ifustc@opt@bachelor
    \titlecontents{chapter}
        [0bp]
        {\setfontsize{12bp}[20bp]}
        {\thecontentslabel\hskip\ccwd}
        {}{\ustc@leaders\contentspage}
    \titlecontents{section}
        [\ccwd]
        {\setfontsize{12bp}[20bp]}
        {\thecontentslabel\hskip\ccwd}
        {}{\ustc@leaders\contentspage}
    \titlecontents{subsection}
        [2\ccwd]
        {\setfontsize{12bp}[20bp]}
        {\thecontentslabel、}
        {}{\ustc@leaders\contentspage}
\else
    \titlecontents{chapter}
        [0bp]
        {\addvspace{6bp}\setfontsize{14bp}[20bp]}
        {\thecontentslabel\hspace*{0.5em}}
        {}{\ustc@leaders\setfontsize{12bp}[20bp]\contentspage}
    \titlecontents{section}
        [\ccwd]
        {\setfontsize{12bp}[20bp]}
        {\thecontentslabel\hspace*{0.5em}}
        {}{\ustc@leaders\setfontsize{12bp}[20bp]\contentspage}
    \titlecontents{subsection}
        [2\ccwd]
        {\setfontsize{10.5bp}[20bp]}
        {\thecontentslabel\hspace*{0.5em}}
        {}{\ustc@leaders\setfontsize{12bp}[20bp]\contentspage}
\fi
\titlecontents{figure}
    [\ccwd]
    {\addvspace{6bp}\setfontsize{12bp}}
    {\thecontentslabel\hspace*{0.5em}}
    {}{\ustc@leaders\contentspage}
\titlecontents{table}
    [\ccwd]
    {\addvspace{6bp}\setfontsize{12bp}}
    {\thecontentslabel\hspace*{0.5em}}
    {}{\ustc@leaders\contentspage}
\ifustc@opt@bachelor
    \let\ustc@save@chapter=\chapter
    \let\ustc@save@mainmatter=\mainmatter
    \let\ustc@save@backmatter=\backmatter
    \let\ustc@save@appendix=\appendix
    \renewcommand\mainmatter{%
        \ustc@save@mainmatter
        \renewcommand\chapter{%
            \addtocontents{toc}{\protect\addvspace{12bp}}%
            \ustc@save@chapter
        }%
    }%
    \renewcommand\backmatter{%
        \ustc@save@backmatter
        \renewcommand\chapter{\ustc@save@chapter}%
    }%
    \renewcommand\appendix{%
        \ustc@save@appendix
        \renewcommand\chapter{\ustc@save@chapter}%
    }%
\fi
\setcounter{secnumdepth}{3}
\ctexset{
    chapter = {
        format = \centering\sffamily\bfseries\setfontsize{16bp},
        nameformat = {},
        titleformat = {},
        number = \arabic{chapter},
        aftername = \quad,
        beforeskip = -7bp, % 24bp - 31bp
        afterskip = 8bp, % 18bp - 10bp
        % fixskip = true, % will be used in future version
    },
    section = {
        format = \sffamily\setfontsize{14bp},
        beforeskip = 24bp,
        afterskip = 6bp,
    },
    subsection = {
        format = \sffamily\setfontsize{13bp},
        beforeskip = 12bp,
        afterskip = 6bp,
    },
    subsubsection = {
        format = \sffamily\setfontsize{12bp},
        beforeskip = 12bp,
        afterskip = 6bp,
    }
}
\ifustc@opt@bachelor
    \setcounter{secnumdepth}{4}
    \ctexset{
        chapter={
            format = \centering\sffamily\setfontsize{16bp},
            number = \chinese{chapter},
        },
        section = {
            format = \centering\sffamily\setfontsize{15bp},
            name   = {第,节},
            number = \chinese{section},
        },
        subsection = {
            format    = \sffamily\setfontsize{14bp},
            number    = \chinese{subsection},
            aftername = {、},
        },
        subsubsection = {
            format    = {\rmfamily\setfontsize{12bp}},
            number    = \arabic{subsubsection},
            aftername = {.\ },
            indent    = \ccwd,
        },
        paragraph = {
            format    = {\rmfamily\setfontsize{12bp}},
            name      = {(,)},
            number    = \arabic{paragraph},
            aftername = {\ },
            indent    = 2\ccwd,
        },
        subparagraph = {
            format    = {},
            name      = {},
            indent    = 2\ccwd,
        },
    }
\fi
\ifustc@opt@bachelor
    \renewcommand\normalsize{\setfontsize{12bp}[22bp]}
\else
    \renewcommand\normalsize{\setfontsize{12bp}[20bp]}
\fi
\setlength{\parindent}{2\ccwd}
\setlength{\parskip}{0bp}
\RequirePackage{caption}
\RequirePackage{calc}
\DeclareCaptionLabelSeparator{zhspace}{\hspace{\ccwd}}
\captionsetup{
    format = hang,
    labelsep = zhspace,
}
\ifustc@opt@bachelor
    \captionsetup{font = normalsize}
\else
    \captionsetup{
        font = small,
        labelfont+={bf},
    }
\fi
\captionsetup[figure]{
    position = bottom,
    aboveskip = 6bp,
    belowskip = {12bp-\intextsep},
}
\captionsetup[table]{
    position = top,
    aboveskip = 6bp,
    belowskip = 6bp,
}
\newcommand\note[1]{%
    \captionsetup{position = bottom}
    \caption*{\hangindent=2\ccwd\relax\ustc@notesname#1}}
\DeclareMathSizes{10.5bp}{10.5bp}{7.35bp}{5.25bp}
\newenvironment{notation}{%
    \ctexset{chapter/format += \rmfamily\setfontsize{12bp}}
    \chapter{\ustc@notationname}
    \setfontsize{10.5bp}[16bp]
    \setlength{\itemsep}{0bp}}{}
\usepackage[sort&compress]{natbib}
\newcommand\bibstyle@ustcnumerical{\bibpunct{[}{]}{,}{s}{,}{\textsuperscript{,}}}
\newcommand\bibstyle@ustcinline{\bibpunct{[}{]}{,}{n}{,}{,}}
\newcommand\bibstyle@ustcauthoryear{\bibpunct{(}{)}{;}{a}{,}{,}}
\setlength{\bibsep}{0bp}
\setlength{\bibhang}{1em}
\ifustc@opt@bachelor
    \newcommand\ustcjournal{\textit}
\else
    \newcommand\ustcjournal{\relax}
\fi
\renewenvironment{thebibliography}[1]{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \@mainmatterfalse
    \ifustc@opt@bachelor\ctexset{chapter/format += \zihao{-2}}\fi
    \chapter{\bibname}%
    \parindent\z@
    \bibpreamble
    \bibfont
    \list{\@biblabel{\the\c@NAT@ctr}}{\@bibsetup{#1}\global\c@NAT@ctr\z@}%
    \ifNAT@openbib
        \renewcommand\newblock{\par}%
    \else
        \renewcommand\newblock{\hskip .11em \@plus.33em \@minus.07em}%
    \fi
    \sloppy\clubpenalty4000\widowpenalty4000
    \sfcode`\.\@m
    \let\NAT@bibitem@first@sw\@firstoftwo
        \let\citeN\cite \let\shortcite\cite
        \let\citeasnoun\cite
}{%
    \bibitem@fin
    \bibpostamble
    \def\@noitemerr{%
        \PackageWarning{natbib}{Empty `thebibliography' environment}%
    }%
    \endlist
    \bibcleanup
    \if@openright\cleardoublepage\else\clearpage\fi
    \@mainmattertrue
}%
\newenvironment{acknowledgements}{%
    \ifustc@opt@bachelor
        \ctexset{chapter/format += \zihao{-2}}%
        \chapter*{\ustc@acknowledgementsname}%
    \else
        \chapter[\ustc@pdf@acknowledgementsname]{\ustc@acknowledgementsname}%
    \fi}{}
\newenvironment{publications}{\chapter{\ustc@publicationsname}}{}
\endinput
%%
%% End of file `ustcthesis.cls'.
