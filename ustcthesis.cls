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
    [2017/07/01 v3.0-beta USTC thesis template]
\newif\if@ustc@doctor
\newif\if@ustc@master
\newif\if@ustc@bachelor
\newif\if@ustc@professional
\newif\if@ustc@english
\newif\if@ustc@numerical
\newif\if@ustc@super
\newif\if@ustc@pdf
\DeclareOption{doctor}{\@ustc@doctortrue\@ustc@masterfalse\@ustc@bachelorfalse}
\DeclareOption{master}{\@ustc@doctorfalse\@ustc@mastertrue\@ustc@bachelorfalse}
\DeclareOption{bachelor}{\@ustc@doctorfalse\@ustc@masterfalse\@ustc@bachelortrue}
\DeclareOption{professional}{\@ustc@professionaltrue}
\DeclareOption{chinese}{\@ustc@englishfalse}
\DeclareOption{english}{\@ustc@englishtrue}
\DeclareOption{print}{\@ustc@pdffalse}
\DeclareOption{pdf}{\@ustc@pdftrue}
\DeclareOption{super}{\@ustc@numericaltrue\@ustc@supertrue}
\DeclareOption{numbers}{\@ustc@numericaltrue\@ustc@superfalse}
\DeclareOption{authoryear}{\@ustc@numericalfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ExecuteOptions{doctor,chinese,print,super}
\ProcessOptions\relax
\newif\if@ustc@addtocspace
\if@ustc@bachelor
    \@ustc@addtocspacetrue
\fi
\if@ustc@english
  \PassOptionsToClass{scheme=plain}{ctexbook}
\fi
\if@ustc@pdf
  \PassOptionsToClass{oneside}{book}
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
\if@ustc@pdf
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
\NewDocumentCommand\setfontsize{mo}{\IfValueTF{#2}{\fontsize{#1}{#2}}{\fontsize{#1}{2\dimexpr#1}}\linespread{1}\selectfont\relax}
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
\ustc@define@term{professionaltype}
\ustc@define@term{title}
\ustc@define@term{secrettext}
\ustc@define@term{author}
\ustc@define@term{major}
\ustc@define@term{supervisor}
\ustc@define@term{cosupervisor}
\ustc@define@term{date}
\ustc@define@term{enprofessionaltype}
\ustc@define@term{entitle}
\ustc@define@term{ensecrettext}
\ustc@define@term{enauthor}
\ustc@define@term{enmajor}
\ustc@define@term{ensupervisor}
\ustc@define@term{encosupervisor}
\ustc@define@term{endate}
\date{\zhnumsetup{time=Chinese}\zhtoday}
\endate{\CTEX@todayold}
\if@ustc@english
  \renewcommand\figurename{Fig.}
  \newcommand\ustc@notesname{\textbf{Notes}: }
  \newcommand\ustc@acknowledgementsname{Acknowledgements}
  \newcommand\ustc@publicationsname{Publications}
  \newcommand\ustc@notationname{Notation}
\else
  \renewcommand\listfigurename{图目录}
  \renewcommand\listtablename{表目录}
  \newcommand\ustc@notesname{\textbf{注}：}
  \newcommand\ustc@acknowledgementsname{致谢}
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
    headheight=0.75cm, headsep=0.29cm,
    footskip=0.79cm}
\RequirePackage{fancyhdr}
\renewcommand{\headrulewidth}{0.4pt}
\if@ustc@bachelor
  \fancypagestyle{ustc@headings}{%
    \fancyhf{}%
    \fancyhead[C]{\setfontsize{9bp}中国科学技术大学本科毕业论文}%
    \fancyfoot[C]{\setfontsize{9bp}\thepage}}%
\else
  \fancypagestyle{ustc@headings}{%
    \fancyhf{}%
    \fancyhead[C]{\setfontsize{10.5bp}\leftmark}%
    \fancyfoot[C]{\setfontsize{10.5bp}\thepage}}%
\fi
\fancypagestyle{ustc@notation}{\fancyfoot{}}
\pagestyle{ustc@headings}
\renewcommand\chaptermark[1]{%
      \markboth {\MakeUppercase{%
        \CTEXifname{\CTEXthechapter\quad}{}
      \protect\spacetitle{#1}}}{}}%
\renewcommand*{\cleardoublepage}{\clearpage\if@twoside \ifodd\c@page\else
  \hbox{}\thispagestyle{empty}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
\g@addto@macro\frontmatter{%
  \if@ustc@bachelor
    \pagenumbering{gobble}%
  \else
    \pagenumbering{Roman}%
  \fi}
\renewcommand\mainmatter{%
  \if@ustc@bachelor
    \clearpage
  \else
    \cleardoublepage
    \pagenumbering{arabic}%
  \fi
  \@mainmattertrue
}
\renewcommand\chapter{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \global\@topnum\z@
    \@afterindenttrue
    \if@ustc@bachelor
      \if@mainmatter
        \ctexset{chapter/format = \centering\sffamily\setfontsize{16bp}}
      \else
        \ctexset{chapter/format = \centering\sffamily\setfontsize{18bp}}
      \fi
      \if@ustc@addtocspace
        \addtocontents{toc}{\protect\addvspace{12bp}}%
      \fi
    \fi
    \secdef\@chapter\@schapter
}
\RequirePackage{pifont}
\def\ustc@textcircled#1{%
  \ifnum\value{#1} >9
    \ClassError{ustcthesis}%
      {Too many footnotes in this page.}{Keep footnote less than 10.}
  \fi
  \ding{\the\numexpr\value{#1}+191\relax}}
\RequirePackage{stringstrings}
\newcounter{titlelength}
\newcommand\spacetitle[1]{%
  \@getstringlength{#1}{titlelength}%
  \if@ustc@bachelor
    \if@mainmatter#1\else
      \ifnum\thetitlelength=2{\ziju{1}#1}\else%
        \ifnum\thetitlelength=4{\ziju{0.5}#1}\else#1%
        \fi
      \fi
    \fi
  \else
    \ifnum\thetitlelength=2{\ziju{2}#1}\else%
      \ifnum\thetitlelength=3{\ziju{1}#1}\else%
        \ifnum\thetitlelength=4{\ziju{0.5}#1}\else#1%
        \fi
      \fi
    \fi
  \fi}
\setcounter{secnumdepth}{5}
\ctexset{
    chapter = {
        format      = \centering\sffamily\bfseries\setfontsize{16bp},
        nameformat  = {},
        titleformat = \spacetitle,
        number      = \thechapter,
        aftername   = \hspace{\ccwd},
        beforeskip  = -7bp, % 24bp - 31bp
        afterskip   = 8bp, % 18bp - 10bp
        % fixskip   = true, % will be used in future version
    },
    section = {
        format     = \sffamily\setfontsize{14bp},
        aftername  = \hspace{\ccwd},
        beforeskip = 24bp,
        afterskip  = 6bp,
    },
    subsection = {
        format     = \sffamily\setfontsize{13bp},
        aftername  = .\hspace{\ccwd},
        indent     = 2\ccwd,
        beforeskip = 12bp,
        afterskip  = 6bp,
    },
    subsubsection = {
        format    = \sffamily\setfontsize{12bp},
        number    = \arabic{subsubsection},
        aftername = .\hspace{\ccwd},
        indent    = 3\ccwd,
    },
    paragraph = {
        format    = \sffamily\setfontsize{12bp},
        number    = (\arabic{paragraph}),
        aftername = \hspace{\ccwd},
        indent    = 3\ccwd,
    },
    subparagraph = {
        format    = \sffamily\setfontsize{12bp},
        number    = \ustc@textcircled{subparagraph},
        aftername = \hspace{\ccwd},
        indent    = 3\ccwd,
    },
}
\if@ustc@bachelor
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
\newcounter{ustc@pdfbookmark}
\NewDocumentCommand\ustc@chapter{o m}{%
  \if@openright\cleardoublepage\else\clearpage\fi%
  \addtocounter{ustc@pdfbookmark}\@ne
  \IfValueTF{#1}{%
    \pdfbookmark[0]{#1}{ustcchapter.\theustc@pdfbookmark}%
    \chaptermark{#1}%
  }{%
    \pdfbookmark[0]{#2}{ustcchapter.\theustc@pdfbookmark}%
    \chaptermark{#2}%
  }%
  \chapter*{#2}}
\renewcommand\maketitle{%
    \newgeometry{
        top=3.8cm, bottom=3.8cm,
        left=3.2cm, right=3.2cm,
        headheight=0cm, headsep=0.8cm,
        footskip=0.8cm}
    \pagenumbering{gobble}
    \pdfbookmark[0]{封面}{titlepage}
    \make@cntitle \cleardoublepage
    \pdfbookmark[0]{Title page}{entitlepage}
    \make@entitle \cleardoublepage
    \restoregeometry
    \if@ustc@bachelor\relax\else
        \if@ustc@pdf\relax\else%
            \pdfbookmark[0]{原创性声明}{statement}
            \make@statement \cleardoublepage
        \fi
    \fi
}
\if@ustc@doctor
  \if@ustc@professional
    \newcommand\ustc@thesisname{专业博士学位论文}%
  \else
    \newcommand\ustc@thesisname{博士学位论文}%
  \fi
  \newcommand\ustc@enthesisname{A dissertation for doctor's degree}%
\else
  \if@ustc@master
    \if@ustc@professional
      \newcommand\ustc@thesisname{专业硕士学位论文}
    \else
      \newcommand\ustc@thesisname{硕士学位论文}
    \fi
    \newcommand\ustc@enthesisname{A dissertation for master's degree}
  \else
    \newcommand\ustc@thesisname{学士学位论文}
    \newcommand\ustc@enthesisname{A dissertation for bachelor's degree}
  \fi
\fi
\newcommand\ustc@supervisorline{%
  \ifx\ustc@encosupervisor\@empty%
    Supervisor: \ustc@ensupervisor%
  \else%
    Supervisors: \ustc@ensupervisor, \ustc@encosupervisor%
  \fi}
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
        \vpostext{4cm}{\includegraphics[height=37bp]{figures/ustc_logo_text}}%
        \if@ustc@professional
          \vpostext{6.3cm}{\sffamily\setfontsize{56bp}\ziju{-0.09}\ustc@thesisname}%
          \vpostext{9cm}{\setfontsize{26bp}\ustc@professionaltype}%
          \vpostext{10.3cm}{\includegraphics[height=4.7cm]{figures/ustc_logo_fig}}%
          \vpostext{16.3cm}{\sffamily\bfseries\setfontsize{26bp}\ustc@title}%
        \else
          \vpostext{6.3cm}{\sffamily\setfontsize{56bp}\ustc@thesisname}%
          \vpostext{9.8cm}{\includegraphics[height=4.7cm]{figures/ustc_logo_fig}}%
          \vpostext{16.3cm}{\sffamily\bfseries\setfontsize{26bp}\ustc@title}%
        \fi
        \tikz[remember picture,overlay]%
            \node [xshift=4.6cm,yshift=-20.3cm] at (current page.north west)%
            [below right,align=left] {%
                \setfontsize{16bp}%
                \begin{tabular}{@{}l@{\hspace{\ccwd}}l@{}}%
                    \textsf{作者姓名：} & \ustc@author \\%
                    \textsf{学科专业：} & \ustc@major \\%
                    \textsf{导师姓名：} & \ustc@supervisor\quad\ustc@cosupervisor \\%
                    \textsf{完成时间：} & \ustc@date%
                \end{tabular}};%
    \end{titlepage}}
\newcommand\make@entitle{%
    \begin{titlepage}%
        \tikz[remember picture,overlay]%
            \node [yshift=-4cm] at (current page.north) [below,align=flush center]%
                {\parbox{\textwidth}{\raggedleft\setfontsize{14bp}\ustc@ensecrettext}};%
        \vpostext{3.9cm}{\sffamily\setfontsize{20bp}[30bp]%
            University of Science and Technology of China}%
        \vpostext{4.9cm}{\sffamily\setfontsize{26bp}[30bp]\ustc@enthesisname}%
        \if@ustc@professional
          \vpostext{6.2cm}{\setfontsize{16bp}\ustc@enprofessionaltype}%
          \vpostext{8.9cm}{\includegraphics[height=5.1cm]{figures/ustc_logo_fig}}%
          \vpostext{15cm}{\sffamily\bfseries\setfontsize{26bp}[30bp]\ustc@entitle}%
        \else
          \vpostext{7.9cm}{\includegraphics[height=5.1cm]{figures/ustc_logo_fig}}%
          \vpostext{14.2cm}{\sffamily\bfseries\setfontsize{26bp}[30bp]\ustc@entitle}%
        \fi
        \tikz[remember picture,overlay]%
            \node [xshift=4.4cm,yshift=-20.2cm] at (current page.north west)%
            [below right,align=left] {%
                \setfontsize{16bp}[30bp]%
                \begin{tabular}{@{}l@{}}%
                    Author:        \ustc@enauthor \\%
                    Speciality:    \ustc@enmajor \\%
                    \ustc@supervisorline \\%
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
    \thispagestyle{empty}
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
    \if@ustc@bachelor
        \chapter{中文内容摘要}%
    \else
        \ustc@chapter{摘要}%
    \fi
  }{}
\newenvironment{enabstract}{%
    \if@ustc@bachelor
        \chapter[英文内容摘要]{Abstract}
    \else
        \ustc@chapter[Abstract]{ABSTRACT}
    \fi}{}
\newcommand\keywords[1]{%
  \par\phantom{empty line}\par\noindent\hangindent=4\ccwd\relax%
  \textbf{关键词}：#1}
\newcommand\enkeywords[1]{%
  \par\phantom{empty}\par\noindent\hangindent=5.3em\relax%
  \textbf{Key Words}: #1}
\renewcommand\tableofcontents{%
    \cleardoublepage%
    \if@ustc@bachelor\pagenumbering{arabic}\fi
    \ustc@chapter{\contentsname}%
    \@starttoc{toc}}
\RequirePackage{titletoc}
\newcommand\ustc@leaders{\titlerule*[0.5pc]{$\cdot$}}
\if@ustc@bachelor
    \titlecontents{chapter}
        [0bp]
        {\setfontsize{12bp}[20bp]}
        {\contentspush{\thecontentslabel\hskip\ccwd\relax}}
        {}{\ustc@leaders\contentspage}
    \titlecontents{section}
        [\ccwd]
        {\setfontsize{12bp}[20bp]}
        {\contentspush{\thecontentslabel\hskip\ccwd\relax}}
        {}{\ustc@leaders\contentspage}
    \titlecontents{subsection}
        [2\ccwd]
        {\setfontsize{12bp}[20bp]}
        {\contentspush{\thecontentslabel、}}
        {}{\ustc@leaders\contentspage}
\else
    \titlecontents{chapter}
        [0bp]
        {\addvspace{6bp}\setfontsize{14bp}[20bp]}
        {\contentspush{\thecontentslabel\unskip\hskip\ccwd\relax}}
        {}{\ustc@leaders\setfontsize{12bp}[20bp]\contentspage}
    \titlecontents{section}
        [\ccwd]
        {\setfontsize{12bp}[20bp]}
        {\contentspush{\thecontentslabel\hskip\ccwd\relax}}
        {}{\ustc@leaders\setfontsize{12bp}[20bp]\contentspage}
    \titlecontents{subsection}
        [2\ccwd]
        {\setfontsize{10.5bp}[20bp]}
        {\contentspush{\thecontentslabel\hskip\ccwd\relax}}
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
\renewcommand\listoffigures{%
    \if@ustc@bachelor\clearpage\else\cleardoublepage\fi
    \ustc@chapter{\listfigurename}%
    \@starttoc{lof}}
    % 表目录同样
\renewcommand\listoftables{%
    \if@ustc@bachelor\clearpage\else\cleardoublepage\fi
    \ustc@chapter{\listtablename}%
    \@starttoc{lot}}
\if@ustc@bachelor
    \g@addto@macro\frontmatter{\@ustc@addtocspacefalse}%
    \g@addto@macro\mainmatter{\@ustc@addtocspacetrue}%
    \g@addto@macro\backmatter{\@ustc@addtocspacefalse}%
    \g@addto@macro\appendix{\@ustc@addtocspacefalse}%
\fi
\newenvironment{notation}{%
    \if@ustc@bachelor\clearpage\else\cleardoublepage\fi
    \thispagestyle{ustc@notation}
    \ctexset{chapter/format = \centering\rmfamily\setfontsize{12bp}}
    \ustc@chapter{\ustc@notationname}
    \setfontsize{10.5bp}[16bp]
    \setlength{\itemsep}{0bp}}{}
\if@ustc@bachelor
    \renewcommand\normalsize{\setfontsize{12bp}[22bp]}
\else
    \renewcommand\normalsize{\setfontsize{12bp}[20bp]}
\fi
\setlength{\parindent}{2\ccwd}
\setlength{\parskip}{0bp}
\RequirePackage{upgreek}
\renewcommand\pi{\uppi}
\RequirePackage{amssymb}
\renewcommand\le{\leqslant}
\renewcommand\leq{\leqslant}
\renewcommand\ge{\geqslant}
\renewcommand\geq{\geqslant}
\DeclareMathSizes{10.5bp}{10.5bp}{7.35bp}{5.25bp}
\renewcommand{\topfraction}{.85}
\renewcommand{\bottomfraction}{.65}
\renewcommand\textfraction{.15}
\renewcommand{\floatpagefraction}{.6}
\RequirePackage{caption}
\RequirePackage{calc}
\DeclareCaptionLabelSeparator{zhspace}{\hspace{\ccwd}}
\captionsetup{
    format = hang,
    font = small,
    labelsep = zhspace,
}
\if@ustc@bachelor\else
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
\renewcommand{\thefootnote}{\ustc@textcircled{footnote}}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.25\textwidth
  \kern2.6\p@}
\renewcommand\@makefntext[1]{%
  \parindent 2\ccwd%
  \noindent
  \hb@xt@2\ccwd{\hss\@makefnmark}#1}
\RequirePackage[sort&compress]{natbib}
\newcommand\bibstyle@super{\bibpunct{[}{]}{,}{s}{,}{\textsuperscript{,}}}
\newcommand\bibstyle@numbers{\bibpunct{[}{]}{,}{n}{,}{,}}
\newcommand\bibstyle@authoryear{\bibpunct{(}{)}{;}{a}{,}{,}}
\def\tmp@numerical{numerical}
\def\tmp@authoryear{authoryear}
\newcommand\ustcbibstyle[1]{%
  \def\tmp@gbt{#1}%
  \ifx\tmp@gbt\tmp@numerical%
    \bibliographystyle{ustcnumerical}%
  \else%
    \ifx\tmp@gbt\tmp@authoryear%
      \bibliographystyle{ustcauthoryear}%
    \else%
      \PackageError{ustcthesis}{Unknown argument #1.}
      {It should be `numerical' or `authoryear'.}
    \fi%
  \fi%
}
\if@ustc@numerical
  \if@ustc@super
    \citestyle{super}
    \bibliographystyle{ustcnumerical}%
  \else
    \citestyle{numbers}
    \bibliographystyle{ustcnumerical}%
  \fi
\else
  \citestyle{authoryear}
  \bibliographystyle{ustcauthoryear}%
\fi
\patchcmd\NAT@citexnum{%
  \@ifnum{\NAT@ctype=\z@}{%
    \if*#2*\else\NAT@cmt#2\fi
  }{}%
  \NAT@mbox{\NAT@@close}%
}{%
  \NAT@mbox{\NAT@@close}%
  \@ifnum{\NAT@ctype=\z@}{%
    \if*#2*\else\textsuperscript{#2}\fi
  }{}%
}{}{}
\renewcommand\NAT@citesuper[3]{\ifNAT@swa
\if*#2*\else#2\NAT@spacechar\fi
\unskip\kern\p@\textsuperscript{\NAT@@open#1\NAT@@close\if*#3*\else#3\fi}%
   \else #1\fi\endgroup}
\renewcommand\NAT@citenum%
    [3]{\ifNAT@swa\NAT@@open\if*#2*\else#2\NAT@spacechar\fi
        #1\NAT@@close\if*#3*\else\textsuperscript{#3}\fi\else#1\fi\endgroup}
\patchcmd{\NAT@citex}{%
  \if*#2*\else\NAT@cmt#2\fi
  \if\relax\NAT@date\relax\else\NAT@@close\fi
}{%
  \if\relax\NAT@date\relax\else\NAT@@close\fi
  \if*#2*\else\textsuperscript{#2}\fi
}{}{}
\renewcommand\NAT@cite%
    [3]{\ifNAT@swa\NAT@@open\if*#2*\else#2\NAT@spacechar\fi
        #1\NAT@@close\if*#3*\else\textsuperscript{#3}\fi\else#1\fi\endgroup}
\renewcommand\bibfont{\setfontsize{10.5bp}[20bp]}
\setlength{\bibsep}{0bp}
\setlength{\bibhang}{2\ccwd}
\renewcommand\@biblabel[1]{[#1]\hfill}
\if@ustc@bachelor
    \newcommand\ustcjournal{\textit}
\else
    \newcommand\ustcjournal{\relax}
\fi
\urlstyle{same}
\g@addto@macro\UrlBreaks{%
  \do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j%
  \do\k\do\l\do\m\do\n\do\o\do\p\do\q\do\r\do\s\do\t%
  \do\u\do\v\do\w\do\x\do\y\do\z%
  \do\A\do\B\do\C\do\D\do\E\do\F\do\G\do\H\do\I\do\J%
  \do\K\do\L\do\M\do\N\do\O\do\P\do\Q\do\R\do\S\do\T%
  \do\U\do\V\do\W\do\X\do\Y\do\Z%
  \do\1\do\2\do\3\do\4\do\5\do\6\do\7\do\8\do\9\do\0%
}
\renewcommand\bibsection{%
    \@mainmatterfalse
    \chapter{\bibname}%
    \@mainmattertrue
}
\newenvironment{acknowledgements}{%
  \if@ustc@bachelor
    \ustc@chapter{\ustc@acknowledgementsname}%
  \else
    \chapter{\ustc@acknowledgementsname}%
  \fi
}{}
\newenvironment{publications}{\chapter{\ustc@publicationsname}}{}
