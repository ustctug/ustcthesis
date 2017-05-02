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
    [2017/04/17 v3.0 USTC thesis template]
\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=ustc@opt, prefix=ustc@opt@, setkeys=\kvsetkeys}
\DeclareBoolOption[false]{doctor}
\DeclareBoolOption[false]{master}
\DeclareBoolOption[false]{bachelor}
\DeclareBoolOption[false]{pdf}
\DeclareComplementaryOption{print}{pdf}
\DeclareBoolOption[false]{english}
\DeclareComplementaryOption{chinese}{english}
\DeclareBoolOption[true]{numerical}
\DeclareComplementaryOption{authoryear}{numerical}
\SetupKeyvalOptions{family=ustc@page, prefix=ustc@page@, setkeys=\kvsetkeys}
\DeclareBoolOption[false]{oneside}
\DeclareComplementaryOption{twoside}{oneside}
\DeclareBoolOption[false]{pageouter}
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
\PassOptionsToPackage{no-math}{fontspec}
\LoadClass[UTF8, a4paper, openany, zihao=-4]{ctexbook}[2015/05/14]
\RequirePackage{etoolbox}
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
\ustc@define@term{supervisors}
\ustc@define@term{date}
\ustc@define@term{entitle}
\ustc@define@term{ensecrettext}
\ustc@define@term{enauthor}
\ustc@define@term{enmajor}
\ustc@define@term{ensupervisors}
\ustc@define@term{endate}
\date{\zhnumsetup{time=Chinese}\zhtoday}
\endate{\CTEX@todayold}
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
\renewcommand*{\cleardoublepage}{\clearpage\if@twoside \ifodd\c@page\else
  \hbox{}\thispagestyle{empty}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
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
                \begin{tabular}{@{}l@{\hspace{\ccwd}}l@{}}%
                    \textsf{作者姓名：} & \ustc@author \\%
                    \textsf{学科专业：} & \ustc@major \\%
                    \textsf{导师姓名：} & \ustc@supervisors \\%
                    \textsf{完成时间：} & \ustc@date%
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
                \begin{tabular}{@{}l@{}}%
                    Author:        \ustc@enauthor \\%
                    Speciality:    \ustc@enmajor \\%
                    Supervisors:   \ustc@ensupervisors \\%
                    Finished time: \ustc@endate%
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
\newcommand\keywords[1]{%
  \par\phantom{empty line}\par\noindent\hangindent=4\ccwd\relax%
  \textbf{关键词}：#1}
\newcommand\enkeywords[1]{%
  \par\phantom{empty}\par\noindent\hangindent=5.3em\relax%
  \textbf{Key Words}: #1}
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
        {\addvspace{6bp}\setfontsize{12bp}[20bp]}
        {\thecontentslabel\hspace*{0.5em}}
        {}{\ustc@leaders\contentspage}
    \titlecontents{section}
        [\ccwd]
        {\addvspace{6bp}\setfontsize{12bp}[20bp]}
        {\thecontentslabel\hspace*{0.5em}}
        {}{\ustc@leaders\contentspage}
    \titlecontents{subsection}
        [2\ccwd]
        {\addvspace{6bp}\setfontsize{12bp}[20bp]}
        {\thecontentslabel\hspace*{0.5em}}
        {}{\ustc@leaders\contentspage}
\else
    \titlecontents{chapter}
        [0bp]
        {\addvspace{6bp}\setfontsize{14bp}[20bp]}
        {\thecontentslabel\hspace*{0.5em}}
        {}{\ustc@leaders\setfontsize{12bp}[20bp]\contentspage}
    \titlecontents{section}
        [\ccwd]
        {\addvspace{6bp}\setfontsize{12bp}[20bp]}
        {\thecontentslabel\hspace*{0.5em}}
        {}{\ustc@leaders\setfontsize{12bp}[20bp]\contentspage}
    \titlecontents{subsection}
        [2\ccwd]
        {\addvspace{6bp}\setfontsize{10.5bp}[20bp]}
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
    % 为了让图目录另页起，重新定义 \cs{listoffigures}
\let\ustc@save@listoffigures=\listoffigures
\renewcommand\listoffigures{%
    \cleardoublepage%
    \ustc@save@listoffigures}
    % 表目录同样
\let\ustc@save@listoftables=\listoftables
\renewcommand\listoftables{%
    \cleardoublepage%
    \ustc@save@listoftables}
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
\RequirePackage{pifont}
\def\ustc@textcircled#1{%
  \ifnum\value{#1} >9
    \ClassError{ustcthesis}%
      {Too many footnotes in this page.}{Keep footnote less than 10.}
  \fi
  \ding{\the\numexpr\value{#1}+191\relax}}
\setcounter{secnumdepth}{5}
\ctexset{
    chapter = {
        format = \centering\sffamily\bfseries\setfontsize{16bp},
        nameformat = {},
        titleformat = {},
        number = \thechapter,
        aftername = \hspace{\ccwd},
        beforeskip = -7bp, % 24bp - 31bp
        afterskip = 8bp, % 18bp - 10bp
        % fixskip = true, % will be used in future version
    },
    section = {
        format = \sffamily\setfontsize{14bp},
        aftername = \hspace{\ccwd},
        beforeskip = 24bp,
        afterskip = 6bp,
    },
    subsection = {
        format = \sffamily\setfontsize{13bp},
        aftername = .\hspace{\ccwd},
        indent = 2\ccwd,
        beforeskip = 12bp,
        afterskip = 6bp,
    },
    subsubsection = {
        format = \sffamily\setfontsize{12bp},
        number = \arabic{subsubsection},
        aftername = .\hspace{\ccwd},
        indent = 3\ccwd,
    },
    paragraph = {
        format = \sffamily\setfontsize{12bp},
        number = (\arabic{paragraph}),
        aftername = \hspace{\ccwd},
        indent = 3\ccwd,
    },
    subparagraph = {
        format = \sffamily\setfontsize{12bp},
        number = \ustc@textcircled{subparagraph},
        aftername = \hspace{\ccwd},
        indent = 3\ccwd,
    },
}
\ifustc@opt@bachelor
    \setcounter{secnumdepth}{4}
    \ctexset{
        chapter={
            number = \chinese{chapter},
        },
        section = {
            format = \centering\sffamily\bfseries\setfontsize{15bp},
            name = {第,节},
            number = \chinese{section},
        },
        subsection = {
            format = \sffamily\setfontsize{14bp},
            number = \chinese{subsection},
            aftername = {、},
        },
        subsubsection = {
            format = {},
            number = \arabic{subsubsection},
            aftername = {.\ },
            indent = \ccwd,
        },
        paragraph = {
            format = {},
            number = (\arabic{paragraph}),
            aftername = {\ },
            indent = 2\ccwd,
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
    font = small,
    labelsep = zhspace,
}
\ifustc@opt@bachelor\else
    \captionsetup{font+=bf}
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
    \captionsetup{position = bottom, font = small}
    \caption*{\hangindent=2\ccwd\relax\ustc@notesname\rmfamily#1}}
\DeclareMathSizes{10.5bp}{10.5bp}{7.35bp}{5.25bp}
\newcommand*{\diff}{\mathop{}\!\mathrm{d}}
\RequirePackage{amssymb}
\renewcommand\le{\leqslant}
\renewcommand\leq{\leqslant}
\renewcommand\ge{\geqslant}
\renewcommand\geq{\geqslant}
\newenvironment{notation}{%
    \ctexset{chapter/format += \rmfamily\setfontsize{12bp}}
    \cleardoublepage%
    \chapter{\ustc@notationname}
    \setfontsize{10.5bp}[16bp]
    \setlength{\itemsep}{0bp}}{}
\renewcommand{\thefootnote}{\ustc@textcircled{footnote}}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.25\textwidth
  \kern2.6\p@}
\renewcommand\@makefntext[1]{%
  \parindent 2\ccwd%
  \noindent
  \hb@xt@2\ccwd{\hss\@makefnmark}#1}
\usepackage[sort&compress]{natbib}
\newcommand\bibstyle@numerical{\bibpunct{[}{]}{,}{s}{,}{\textsuperscript{,}}}
\newcommand\bibstyle@inline{\bibpunct{[}{]}{,}{n}{,}{,}}
\newcommand\bibstyle@authoryear{\bibpunct{(}{)}{;}{a}{,}{,}}
\renewcommand\bibfont{\setfontsize{10.5bp}[20bp]}
\setlength{\bibsep}{0bp}
\setlength{\bibhang}{1em}
\ifustc@opt@bachelor
    \newcommand\ustcjournal{\textit}
\else
    \newcommand\ustcjournal{\relax}
\fi
\urlstyle{rm}
\g@addto@macro\UrlBreaks{%
  \do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j%
  \do\k\do\l\do\m\do\n\do\o\do\p\do\q\do\r\do\s\do\t%
  \do\u\do\v\do\w\do\x\do\y\do\z%
  \do\A\do\B\do\C\do\D\do\E\do\F\do\G\do\H\do\I\do\J%
  \do\K\do\L\do\M\do\N\do\O\do\P\do\Q\do\R\do\S\do\T%
  \do\U\do\V\do\W\do\X\do\Y\do\Z%
  \do\1\do\2\do\3\do\4\do\5\do\6\do\7\do\8\do\9\do\0%
}
\def\tmp@numerical{numerical}
\def\tmp@authoryear{authoryear}
\newcommand\ustcbibstyle[1]{%
  \def\tmp@gbt{#1}%
  \ifx\tmp@gbt\tmp@numerical%
    \citestyle{numerical}
    \bibliographystyle{ustcnumerical}%
  \else%
    \ifx\tmp@gbt\tmp@authoryear%
      \citestyle{authoryear}
      \bibliographystyle{ustcauthoryear}%
    \else%
      \PackageError{ustcthesis}{Unknown argument #1.}
      {It should be `numerical' or `authoryear'.}
    \fi%
  \fi%
}
\ifustc@opt@numerical
  \ustcbibstyle{numerical}
\else
  \ustcbibstyle{authoryear}
\fi
\def\NAT@citexnum[#1][#2]#3{%
  \NAT@reset@parser
  \NAT@sort@cites{#3}%
  \NAT@reset@citea
  \@cite{\def\NAT@num{-1}\let\NAT@last@yr\relax\let\NAT@nm\@empty
    \@for\@citeb:=\NAT@cite@list\do
    {\@safe@activestrue
     \edef\@citeb{\expandafter\@firstofone\@citeb\@empty}%
     \@safe@activesfalse
     \@ifundefined{b@\@citeb\@extra@b@citeb}{%
       {\reset@font\bfseries?}
        \NAT@citeundefined\PackageWarning{natbib}%
       {Citation `\@citeb' on page \thepage \space undefined}}%
     {\let\NAT@last@num\NAT@num\let\NAT@last@nm\NAT@nm
      \NAT@parse{\@citeb}%
      \ifNAT@longnames\@ifundefined{bv@\@citeb\@extra@b@citeb}{%
        \let\NAT@name=\NAT@all@names
        \global\@namedef{bv@\@citeb\@extra@b@citeb}{}}{}%
      \fi
      \ifNAT@full\let\NAT@nm\NAT@all@names\else
        \let\NAT@nm\NAT@name\fi
      \ifNAT@swa
       \@ifnum{\NAT@ctype>\@ne}{%
        \@citea
        \NAT@hyper@{\@ifnum{\NAT@ctype=\tw@}{\NAT@test{\NAT@ctype}}{\NAT@alias}}%
       }{%
        \@ifnum{\NAT@cmprs>\z@}{%
         \NAT@ifcat@num\NAT@num
          {\let\NAT@nm=\NAT@num}%
          {\def\NAT@nm{-2}}%
         \NAT@ifcat@num\NAT@last@num
          {\@tempcnta=\NAT@last@num\relax}%
          {\@tempcnta\m@ne}%
         \@ifnum{\NAT@nm=\@tempcnta}{%
          \@ifnum{\NAT@merge>\@ne}{}{\NAT@last@yr@mbox}%
         }{%
           \advance\@tempcnta by\@ne
           \@ifnum{\NAT@nm=\@tempcnta}{%
             \ifx\NAT@last@yr\relax
               \def@NAT@last@yr{\@citea}%
             \else
               \def@NAT@last@yr{--\NAT@penalty}%
             \fi
           }{%
             \NAT@last@yr@mbox
           }%
         }%
        }{%
         \@tempswatrue
         \@ifnum{\NAT@merge>\@ne}{\@ifnum{\NAT@last@num=\NAT@num\relax}{\@tempswafalse}{}}{}%
         \if@tempswa\NAT@citea@mbox\fi
        }%
       }%
       \NAT@def@citea
      \else
        \ifcase\NAT@ctype
          \ifx\NAT@last@nm\NAT@nm \NAT@yrsep\NAT@penalty\NAT@space\else
            \@citea \NAT@test{\@ne}\NAT@spacechar\NAT@mbox{\NAT@super@kern\NAT@@open}%
          \fi
          \if*#1*\else#1\NAT@spacechar\fi
          \NAT@mbox{\NAT@hyper@{{\citenumfont{\NAT@num}}}}%
          \NAT@def@citea@box
        \or
          \NAT@hyper@citea@space{\NAT@test{\NAT@ctype}}%
        \or
          \NAT@hyper@citea@space{\NAT@test{\NAT@ctype}}%
        \or
          \NAT@hyper@citea@space\NAT@alias
        \fi
      \fi
     }%
    }%
      \@ifnum{\NAT@cmprs>\z@}{\NAT@last@yr}{}%
      \ifNAT@swa\else
        \NAT@mbox{\NAT@@close}%
        \@ifnum{\NAT@ctype=\z@}{%
          \if*#2*\else\textsuperscript{#2}\fi
        }{}%
      \fi
  }{#1}{#2}%
}%
\renewcommand\NAT@citesuper[3]{\ifNAT@swa
  \if*#2*\else#2\NAT@spacechar\fi
\unskip\kern\p@\textsuperscript{\NAT@@open#1\NAT@@close\if*#3*\else#3\fi}%
   \else #1\fi\endgroup}
\def\NAT@citex%
  [#1][#2]#3{%
  \NAT@reset@parser
  \NAT@sort@cites{#3}%
  \NAT@reset@citea
  \@cite{\let\NAT@nm\@empty\let\NAT@year\@empty
    \@for\@citeb:=\NAT@cite@list\do
    {\@safe@activestrue
     \edef\@citeb{\expandafter\@firstofone\@citeb\@empty}%
     \@safe@activesfalse
     \@ifundefined{b@\@citeb\@extra@b@citeb}{\@citea%
       {\reset@font\bfseries ?}\NAT@citeundefined
                 \PackageWarning{natbib}%
       {Citation `\@citeb' on page \thepage \space undefined}\def\NAT@date{}}%
     {\let\NAT@last@nm=\NAT@nm\let\NAT@last@yr=\NAT@year
      \NAT@parse{\@citeb}%
      \ifNAT@longnames\@ifundefined{bv@\@citeb\@extra@b@citeb}{%
        \let\NAT@name=\NAT@all@names
        \global\@namedef{bv@\@citeb\@extra@b@citeb}{}}{}%
      \fi
     \ifNAT@full\let\NAT@nm\NAT@all@names\else
       \let\NAT@nm\NAT@name\fi
     \ifNAT@swa\ifcase\NAT@ctype
       \if\relax\NAT@date\relax
         \@citea\NAT@hyper@{\NAT@nmfmt{\NAT@nm}\NAT@date}%
       \else
         \ifx\NAT@last@nm\NAT@nm\NAT@yrsep
            \ifx\NAT@last@yr\NAT@year
              \def\NAT@temp{{?}}%
              \ifx\NAT@temp\NAT@exlab\PackageWarningNoLine{natbib}%
               {Multiple citation on page \thepage: same authors and
               year\MessageBreak without distinguishing extra
               letter,\MessageBreak appears as question mark}\fi
              \NAT@hyper@{\NAT@exlab}%
            \else\unskip\NAT@spacechar
              \NAT@hyper@{\NAT@date}%
            \fi
         \else
           \@citea\NAT@hyper@{%
             \NAT@nmfmt{\NAT@nm}%
             \hyper@natlinkbreak{%
               \NAT@aysep\NAT@spacechar}{\@citeb\@extra@b@citeb
             }%
             \NAT@date
           }%
         \fi
       \fi
     \or\@citea\NAT@hyper@{\NAT@nmfmt{\NAT@nm}}%
     \or\@citea\NAT@hyper@{\NAT@date}%
     \or\@citea\NAT@hyper@{\NAT@alias}%
     \fi \NAT@def@citea
     \else
       \ifcase\NAT@ctype
        \if\relax\NAT@date\relax
          \@citea\NAT@hyper@{\NAT@nmfmt{\NAT@nm}}%
        \else
         \ifx\NAT@last@nm\NAT@nm\NAT@yrsep
            \ifx\NAT@last@yr\NAT@year
              \def\NAT@temp{{?}}%
              \ifx\NAT@temp\NAT@exlab\PackageWarningNoLine{natbib}%
               {Multiple citation on page \thepage: same authors and
               year\MessageBreak without distinguishing extra
               letter,\MessageBreak appears as question mark}\fi
              \NAT@hyper@{\NAT@exlab}%
            \else
              \unskip\NAT@spacechar
              \NAT@hyper@{\NAT@date}%
            \fi
         \else
           \@citea\NAT@hyper@{%
             \NAT@nmfmt{\NAT@nm}%
             \hyper@natlinkbreak{\NAT@spacechar\NAT@@open\if*#1*\else#1\NAT@spacechar\fi}%
               {\@citeb\@extra@b@citeb}%
             \NAT@date
           }%
         \fi
        \fi
       \or\@citea\NAT@hyper@{\NAT@nmfmt{\NAT@nm}}%
       \or\@citea\NAT@hyper@{\NAT@date}%
       \or\@citea\NAT@hyper@{\NAT@alias}%
       \fi
       \if\relax\NAT@date\relax
         \NAT@def@citea
       \else
         \NAT@def@citea@close
       \fi
     \fi
     }}\ifNAT@swa\else
     \if\relax\NAT@date\relax\else\NAT@@close\fi
     \if*#2*\else\textsuperscript{#2}\fi\fi}{#1}{#2}}
\renewcommand\NAT@cite%
    [3]{\ifNAT@swa\NAT@@open\if*#2*\else#2\NAT@spacechar\fi
        #1\NAT@@close\if*#3*\else\textsuperscript{#3}\fi\else#1\fi\endgroup}
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
