%%
%% This is file `ustcthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% ustcthesis.dtx  (with options: `class')
%% 
%% Copyright (C) 2015-2018 by Zeping Lee <zepinglee AT gmail.com>
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3c
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%    https://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{ustcthesis}
  [2018/05/16 v3.0.a USTC thesis template]
\newif\if@ustc@doctor
\newif\if@ustc@master
\newif\if@ustc@bachelor
\newif\if@ustc@professional
\newif\if@ustc@english
\newif\if@ustc@numerical
\newif\if@ustc@super
\newif\if@ustc@pdf
\newif\if@ustc@arabic
\DeclareOption{doctor}{\@ustc@doctortrue\@ustc@masterfalse\@ustc@bachelorfalse}
\DeclareOption{master}{\@ustc@doctorfalse\@ustc@mastertrue\@ustc@bachelorfalse}
\DeclareOption{bachelor}{\@ustc@doctorfalse\@ustc@masterfalse\@ustc@bachelortrue}
\DeclareOption{professional}{\@ustc@professionaltrue}
\DeclareOption{chinese}{\@ustc@englishfalse}
\DeclareOption{english}{\@ustc@englishtrue\@ustc@arabictrue}
\DeclareOption{print}{\@ustc@pdffalse}
\DeclareOption{pdf}{\@ustc@pdftrue}
\DeclareOption{super}{\@ustc@numericaltrue\@ustc@supertrue}
\DeclareOption{numbers}{\@ustc@numericaltrue\@ustc@superfalse}
\DeclareOption{authoryear}{\@ustc@numericalfalse}
\DeclareOption{arabic}{\@ustc@arabictrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ExecuteOptions{doctor,chinese,print,super}
\ProcessOptions\relax
\if@ustc@english
  \PassOptionsToClass{scheme=plain}{ctexbook}
\fi
\if@ustc@pdf
  \PassOptionsToClass{oneside}{book}
\fi
\PassOptionsToPackage{no-math}{fontspec}
\LoadClass[UTF8, a4paper, openany, zihao=-4]{ctexbook}[2015/07/01]
\@ifclasslater{ctexbook}{2015/07/01}{}{%
  \ClassError{ustcthesis}{%
    This template requires ctex 2.2 or later version.%
  }{%
    Please install the latest version of TeX Live.%
  }
}
\RequirePackage{hyperref}
\RequirePackage{etoolbox}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{xstring}
\RequirePackage{pifont}
\RequirePackage{tikz}
\RequirePackage{titletoc}
\RequirePackage[perpage]{footmisc}
\RequirePackage{caption}
\RequirePackage{calc}
\RequirePackage{amssymb}
\RequirePackage{upgreek}
\if@ustc@numerical
  \PassOptionsToPackage{sort&compress}{natbib}
\fi
\RequirePackage{natbib}
\hypersetup{
  bookmarksnumbered=true,
  bookmarksopen=true,
  bookmarksopenlevel=1,
  linktoc=all,
  pdfborder=0 0 0,
}
\if@ustc@pdf
  \hypersetup{
    colorlinks=true,
    allcolors=blue,
  }
\fi
\urlstyle{same}
\pdfstringdefDisableCommands{
  \let\\\empty
}
\setmainfont{Times New Roman}
\setsansfont{Arial}
\IfFileExists{/System/Library/Fonts/Menlo.ttc}{
  \setmonofont[Scale=MatchLowercase]{Menlo}
}{
  \setmonofont[Scale=MatchLowercase]{Courier New}
}
\ExplSyntaxOn
\str_if_eq:onT { \g__ctex_fontset_tl } { mac }
  {
    \setCJKmainfont
      [
           UprightFont = *~Light,
              BoldFont = *~Bold,
            ItalicFont = Kaiti~SC,
        BoldItalicFont = Kaiti~SC~Bold
      ] { Songti~SC }
    \setCJKsansfont { Heiti~SC }
    \setCJKfamilyfont { zhsong }
      [
           UprightFont = *~Light,
              BoldFont = *~Bold,
      ] { Songti~SC }
    \setCJKfamilyfont { zhhei } { Heiti~SC }
    \setCJKfamilyfont { zhkai } { Kaiti~SC }
  }
\str_if_eq:onT { \g__ctex_fontset_tl } { windows }
  {
    \file_if_exist:nTF { C:/bootfont.bin }
      {
        \setCJKmainfont
          [ AutoFakeBold , ItalicFont = KaiTi_GB2312 ] { SimSun }
      }
      {
        \setCJKmainfont
          [ AutoFakeBold , ItalicFont = KaiTi ] { SimSun }
      }
    \setCJKsansfont [ AutoFakeBold ] { SimHei }
    \setCJKfamilyfont { zhsong } [ AutoFakeBold ] { SimSun }
    \setCJKfamilyfont { zhhei }  [ AutoFakeBold ] { SimHei }
  }
\str_if_eq:onT { \g__ctex_fontset_tl } { adobe }
  {
    \setCJKmainfont
      [
        AutoFakeBold ,
        ItalicFont = AdobeKaitiStd-Regular
      ] { AdobeSongStd-Light }
    \setCJKsansfont [ AutoFakeBold ] { AdobeHeitiStd-Regular}
    \setCJKfamilyfont { zhsong } [ AutoFakeBold ] { AdobeSongStd-Light }
    \setCJKfamilyfont { zhhei }  [ AutoFakeBold ] { AdobeHeitiStd-Regular }
  }
\ExplSyntaxOff
\newdimen\bp@
\bp@=1bp
\if@ustc@bachelor
  \renewcommand\normalsize{%
    \@setfontsize\normalsize{12\bp@}{22\bp@}%
    \abovedisplayskip 12\bp@ \@plus3\bp@ \@minus7\bp@
    \abovedisplayshortskip \z@ \@plus3\bp@
    \belowdisplayshortskip 6.5\bp@ \@plus3.5\bp@ \@minus3\bp@
    \belowdisplayskip \abovedisplayskip
    \let\@listi\@listI}
  \normalsize
  \renewcommand\small{%
    \@setfontsize\small{10.5\bp@}{19.25\bp@}%
    \abovedisplayskip 10.5\bp@ \@plus3\bp@ \@minus6\bp@
    \abovedisplayshortskip \z@ \@plus3\bp@
    \belowdisplayshortskip 6.5\bp@ \@plus3.5\bp@ \@minus3\bp@
    \def\@listi{\leftmargin\leftmargini
                \topsep 9\bp@ \@plus3\bp@ \@minus5\bp@
                \parsep 4.5\bp@ \@plus2\bp@ \@minus\bp@
                \itemsep \parsep}%
    \belowdisplayskip \abovedisplayskip
  }
  \renewcommand\footnotesize{%
    \@setfontsize\footnotesize{9\bp@}{16.5\bp@}%
    \abovedisplayskip 9\bp@ \@plus2\bp@ \@minus5\bp@
    \abovedisplayshortskip \z@ \@plus3\bp@
    \belowdisplayshortskip 6\bp@ \@plus3\bp@ \@minus3\bp@
    \def\@listi{\leftmargin\leftmargini
                \topsep 6\bp@ \@plus2\bp@ \@minus2\bp@
                \parsep 3\bp@ \@plus2\bp@ \@minus\bp@
                \itemsep \parsep}%
    \belowdisplayskip \abovedisplayskip
  }
  \renewcommand\scriptsize{\@setfontsize\scriptsize{7.5\bp@}{13.75\bp@}}
  \renewcommand\tiny{\@setfontsize\tiny{6.5\bp@}{11.92\bp@}}
  \renewcommand\large{\@setfontsize\large{15\bp@}{27.5\bp@}}
  \renewcommand\Large{\@setfontsize\Large{18\bp@}{33\bp@}}
  \renewcommand\LARGE{\@setfontsize\LARGE{22\bp@}{40.33\bp@}}
  \renewcommand\huge{\@setfontsize\huge{24\bp@}{44\bp@}}
  \renewcommand\Huge{\@setfontsize\Huge{26\bp@}{47.67\bp@}}
\else
  \renewcommand\normalsize{%
    \@setfontsize\normalsize{12\bp@}{20\bp@}%
    \abovedisplayskip 12\bp@ \@plus3\bp@ \@minus7\bp@
    \abovedisplayshortskip \z@ \@plus3\bp@
    \belowdisplayshortskip 6.5\bp@ \@plus3.5\bp@ \@minus3\bp@
    \belowdisplayskip \abovedisplayskip
    \let\@listi\@listI}
  \normalsize
  \renewcommand\small{%
    \@setfontsize\small{10.5\bp@}{17.5\bp@}%
    \abovedisplayskip 10.5\bp@ \@plus3\bp@ \@minus6\bp@
    \abovedisplayshortskip \z@ \@plus3\bp@
    \belowdisplayshortskip 6.5\bp@ \@plus3.5\bp@ \@minus3\bp@
    \def\@listi{\leftmargin\leftmargini
                \topsep 9\bp@ \@plus3\bp@ \@minus5\bp@
                \parsep 4.5\bp@ \@plus2\bp@ \@minus\bp@
                \itemsep \parsep}%
    \belowdisplayskip \abovedisplayskip
  }
  \renewcommand\footnotesize{%
     \@setfontsize\footnotesize{9\bp@}{15\bp@}%
     \abovedisplayskip 9\bp@ \@plus2\bp@ \@minus5\bp@
     \abovedisplayshortskip \z@ \@plus3\bp@
     \belowdisplayshortskip 6\bp@ \@plus3\bp@ \@minus3\bp@
     \def\@listi{\leftmargin\leftmargini
                 \topsep 6\bp@ \@plus2\bp@ \@minus2\bp@
                 \parsep 3\bp@ \@plus2\bp@ \@minus\bp@
                 \itemsep \parsep}%
     \belowdisplayskip \abovedisplayskip
  }
  \renewcommand\scriptsize{\@setfontsize\scriptsize{7.5\bp@}{12.5\bp@}}
  \renewcommand\tiny{\@setfontsize\tiny{6.5\bp@}{10.83\bp@}}
  \renewcommand\large{\@setfontsize\large{15\bp@}{25\bp@}}
  \renewcommand\Large{\@setfontsize\Large{18\bp@}{30\bp@}}
  \renewcommand\LARGE{\@setfontsize\LARGE{22\bp@}{36.67\bp@}}
  \renewcommand\huge{\@setfontsize\huge{24\bp@}{40\bp@}}
  \renewcommand\Huge{\@setfontsize\Huge{26\bp@}{43.33\bp@}}
\fi
\linespread{1}
\newcommand\@ustc@setfontsize[2]{%
  \fontsize{#1}{#2}\selectfont}
\if@ustc@english
  \renewcommand\figurename{Fig.}
  \newcommand\@ustc@notesname{\textbf{Notes}: }
  \newcommand\@ustc@acknowledgementsname{Acknowledgements}
  \newcommand\@ustc@publicationsname{Publications}
  \newcommand\@ustc@notationname{Notation}
\else
  \newcommand\@ustc@notesname{\textbf{注}：}
  \newcommand\@ustc@acknowledgementsname{致谢}
  \newcommand\@ustc@publicationsname{在读期间发表的学术论文与取得的研究成果}
  \newcommand\@ustc@notationname{符号说明}
\fi
\geometry{
  paper=a4paper,
  top=2.54cm, bottom=2.54cm,
  left=3.17cm, right=3.17cm,
  headheight=0.75cm, headsep=0.29cm,
  footskip=0.79cm}
\renewcommand{\headrulewidth}{0.4pt}
\if@ustc@bachelor
  \fancypagestyle{ustc@headings}{
    \fancyhf{}
    \fancyhead[C]{\@ustc@setfontsize{9\bp@}{18\bp@}中国科学技术大学本科毕业论文}
    \fancyfoot[C]{\@ustc@setfontsize{9\bp@}{18\bp@}\thepage}}
\else
  \fancypagestyle{ustc@headings}{
    \fancyhf{}
    \fancyhead[C]{\@ustc@setfontsize{10.5\bp@}{21\bp@}\leftmark}
    \fancyfoot[C]{\@ustc@setfontsize{10.5\bp@}{21\bp@}\thepage}}
\fi
\fancypagestyle{ustc@notation}{\fancyfoot{}}
\pagestyle{ustc@headings}
\patchcmd\chaptermark{\MakeUppercase}{}{}{}
\patchcmd\chaptermark{#1}{\protect\@ustc@spacetitle{#1}}{}{}
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
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
\renewcommand\maketitle{%
  \hypersetup{
    pdftitle={\@ustc@title},
    pdfauthor={\@ustc@author}
  }
  \newgeometry{
    top=3.8cm, bottom=3.8cm,
    left=3.2cm, right=3.2cm,
    headheight=0cm, headsep=0.8cm,
    footskip=0.8cm}%
  \pagenumbering{gobble}%
  \pdfbookmark[0]{封面}{titlepage}%
  \@ustc@makezhtitle \cleardoublepage
  \pdfbookmark[0]{Title page}{entitlepage}%
  \@ustc@makeentitle \cleardoublepage
  \restoregeometry
  \if@ustc@bachelor\relax\else
    \if@ustc@pdf\relax\else
      \pdfbookmark[0]{原创性声明}{statement}%
      \make@statement \cleardoublepage
    \fi
  \fi
}
\if@ustc@doctor
  \newcommand\@ustc@thesisname{博士学位论文}
  \newcommand\@ustc@enthesisname{A dissertation for doctor's degree}
\else
  \if@ustc@master
    \newcommand\@ustc@thesisname{硕士学位论文}
    \newcommand\@ustc@enthesisname{A dissertation for master's degree}
  \else
    \newcommand\@ustc@thesisname{学士学位论文}
    \newcommand\@ustc@enthesisname{A dissertation for bachelor's degree}
  \fi
\fi
\if@ustc@professional
  \if@ustc@doctor
    \renewcommand\@ustc@thesisname{专业博士学位论文}
  \else
    \renewcommand\@ustc@thesisname{专业硕士学位论文}
  \fi
  \ExplSyntaxOn
  \str_if_eq:onTF { \g__ctex_fontset_tl } { mac }
    {
      \setCJKfamilyfont { zhli }{ Baoli~SC }
      \providecommand\lishu{\CJKfamily{zhli}}
    }
    { \providecommand\lishu{\relax} }
  \ExplSyntaxOff
  \newcommand\@ustc@specialityname{专业领域}
\else
  \newcommand\@ustc@specialityname{学科专业}
\fi
\def\@ustc@define@term#1#2{%
  \expandafter\gdef\csname #1\endcsname##1{%
    \expandafter\gdef\csname @ustc@#1\endcsname{##1}%
  }%
  \csname #1\endcsname{#2}%
}
\@ustc@define@term{title}{论文题目}
\@ustc@define@term{author}{XXX}
\@ustc@define@term{major}{XXX}
\@ustc@define@term{supervisor}{XXX\quad 教授}
\@ustc@define@term{cosupervisor}{}
\@ustc@define@term{date}{\zhnumsetup{time=Chinese}\zhtoday}
\@ustc@define@term{professionaltype}{}
\@ustc@define@term{secrettext}{}
\@ustc@define@term{entitle}{Title}
\@ustc@define@term{enauthor}{XXX}
\@ustc@define@term{enmajor}{XXX}
\@ustc@define@term{ensupervisor}{Prof. XXX}
\@ustc@define@term{encosupervisor}{}
\@ustc@define@term{endate}{\CTEX@todayold}
\@ustc@define@term{enprofessionaltype}{}
\@ustc@define@term{ensecrettext}{}
\newcommand\@ustc@vpostext[2]{%
  \tikz[remember picture,overlay]
    \node [yshift=-#1] at (current page.north) [below,align=flush center]
      {\parbox{\textwidth}{\centering#2}};}
\newcommand\@ustc@makezhtitle{%
  \begin{titlepage}%
    \tikz[remember picture,overlay]%
      \node [yshift=-4cm] at (current page.north) [below,align=flush center]%
        {\parbox{\textwidth}{%
           \raggedleft\fangsong\@ustc@setfontsize{14\bp@}{28\bp@}%
           \@ustc@secrettext}};%
    \@ustc@vpostext{4cm}{%
      \includegraphics[height=37\bp@]{figures/ustc_logo_text}}%
    \if@ustc@professional
      \@ustc@vpostext{6.3cm}{%
        \sffamily\@ustc@setfontsize{56\bp@}{112\bp@}\ziju{-0.09}%
        \@ustc@thesisname}%
      \@ustc@vpostext{9cm}{%
        \lishu\@ustc@setfontsize{26\bp@}{52\bp@}%
        \@ustc@professionaltype}%
      \@ustc@vpostext{10.3cm}{%
        \includegraphics[height=4.7cm]{figures/ustc_logo_fig}}%
      \@ustc@vpostext{16.3cm}{%
        \sffamily\bfseries\@ustc@setfontsize{26\bp@}{52\bp@}
        \@ustc@title}%
    \else
      \@ustc@vpostext{6.3cm}{%
        \sffamily\@ustc@setfontsize{56\bp@}{112\bp@}%
        \@ustc@thesisname}%
      \@ustc@vpostext{9.8cm}{%
        \includegraphics[height=4.7cm]{figures/ustc_logo_fig}}%
      \@ustc@vpostext{16.3cm}{%
        \sffamily\bfseries\@ustc@setfontsize{26\bp@}{52\bp@}
        \@ustc@title}%
    \fi
    \tikz[remember picture,overlay]%
      \node [xshift=4.6cm,yshift=-20.3cm] at (current page.north west)%
        [below right,align=left] {%
          \@ustc@setfontsize{16\bp@}{32\bp@}%
          \begin{tabular}{@{}l@{\hspace{\ccwd}}l@{}}%
            \textsf{作者姓名：} & \@ustc@author \\
            \textsf{\@ustc@specialityname：} & \@ustc@major \\
            \textsf{导师姓名：} & \@ustc@supervisor\quad\@ustc@cosupervisor \\
            \textsf{完成时间：} & \@ustc@date%
          \end{tabular}};%
  \end{titlepage}}
\newcommand\@ustc@supervisorline{%
  \ifx\@ustc@encosupervisor\@empty
    Supervisor: \@ustc@ensupervisor
  \else
    Supervisors: \@ustc@ensupervisor, \@ustc@encosupervisor
  \fi}
\newcommand\@ustc@makeentitle{%
  \begin{titlepage}%
    \tikz[remember picture,overlay]%
      \node [yshift=-4cm] at (current page.north) [below,align=flush center]%
        {\parbox{\textwidth}{\raggedleft\@ustc@setfontsize{14\bp@}{28\bp@}%
        \@ustc@ensecrettext}};%
    \@ustc@vpostext{3.9cm}{%
      \sffamily\@ustc@setfontsize{20\bp@}{30\bp@}%
      University of Science and Technology of China}%
    \@ustc@vpostext{4.9cm}{%
      \sffamily\@ustc@setfontsize{26\bp@}{30\bp@}%
      \@ustc@enthesisname}%
    \if@ustc@professional
      \@ustc@vpostext{6.2cm}{%
        \@ustc@setfontsize{16\bp@}{32\bp@}%
        \@ustc@enprofessionaltype}%
      \@ustc@vpostext{8.9cm}{%
        \includegraphics[height=5.1cm]{figures/ustc_logo_fig}}%
      \@ustc@vpostext{15cm}{%
        \sffamily\bfseries\@ustc@setfontsize{26\bp@}{30\bp@}%
        \@ustc@entitle}%
    \else
      \@ustc@vpostext{7.9cm}{%
        \includegraphics[height=5.1cm]{figures/ustc_logo_fig}}%
      \@ustc@vpostext{14.2cm}{%
        \sffamily\bfseries\@ustc@setfontsize{26\bp@}{30\bp@}%
        \@ustc@entitle}%
    \fi
    \tikz[remember picture,overlay]%
      \node [xshift=4.4cm,yshift=-20.2cm] at (current page.north west)%
        [below right,align=left] {%
          \@ustc@setfontsize{16\bp@}{30\bp@}%
          \begin{tabular}{@{}l@{}}
            Author:        \@ustc@enauthor \\
            Speciality:    \@ustc@enmajor \\
            \@ustc@supervisorline \\
            Finished time: \@ustc@endate%
          \end{tabular}};%
  \end{titlepage}}
\newcommand\@ustc@declaretext{%
本人声明所呈交的学位论文，是本人在导师指导下进行研究工作所取得的成果。
除已特别加以标注和致谢的地方外，论文中不包含任何他人已经发表或撰写过
的研究成果。与我一同工作的同志对本研究所做的贡献均已在论文中作了明确的说明。}
\newcommand\@ustc@authorization{%
作为申请学位的条件之一，学位论文著作权拥有者授权中国科学技术大学拥有
学位论文的部分使用权，即：学校有权按有关规定向国家有关部门或机构送交
论文的复印件和电子版，允许论文被查阅和借阅，可以将学位论文编入《中国
学位论文全文数据库》等有关数据库进行检索，可以采用影印、缩印或扫描等
复制手段保存、汇编学位论文。本人提交的电子文档的内容和纸质论文的内容
相一致。\par
保密的学位论文在解密后也遵守此规定。}
\newcommand\@ustc@underline[2][6em]{%
  \hskip1pt\underline{\hb@xt@ #1{\hss#2\hss}}\hskip3pt\relax
}
\newcommand\make@statement{%
  \thispagestyle{empty}%
  \vspace*{-0.15cm}%
  \begin{center}%
    \sffamily\@ustc@setfontsize{16\bp@}{32\bp@}%
    中国科学技术大学学位论文原创性声明%
  \end{center}%
  \vskip 0.3cm\par
  \@ustc@declaretext\par
  \vskip 0.7cm\relax
  \begin{tabular}{p{7cm}p{7cm}}%
    作者签名：\@ustc@underline[7.4em]{} & 签字日期：\@ustc@underline[7.4em]{}%
  \end{tabular}%
  \vskip 2.6cm\par
  \begin{center}%
    \sffamily\@ustc@setfontsize{16\bp@}{32\bp@}%
    中国科学技术大学学位论文授权使用声明%
  \end{center}%
  \vskip 0.3cm\par
  \@ustc@authorization\par
  \vskip 0.5cm\relax
  $\square$公开 \hspace{0.4cm} $\square$保密（\@ustc@underline[2em]{}年）\par
  \vskip 0.5cm\par
  {\renewcommand{\arraystretch}{2.0}%
  \begin{tabular}{p{7cm}p{7cm}}%
    作者签名：\@ustc@underline[7.4em]{} & 导师签名：\@ustc@underline[7.4em]{} \\
    签字日期：\@ustc@underline[7.4em]{} & 签字日期：\@ustc@underline[7.4em]{} \\
  \end{tabular}}%
}
\setcounter{secnumdepth}{5}
\newcommand\@ustc@spacetitle[1]{%
  \StrLen{#1}[\titlelength]%
  \if@ustc@bachelor
    \if@mainmatter\relax\else
      \ifnum\titlelength=2\ziju{1}\else
        \ifnum\titlelength=4\ziju{0.5}%
        \fi
      \fi
    \fi
  \else
    \ifnum\titlelength=2\ziju{2}\else
      \ifnum\titlelength=3\ziju{1}\else
        \ifnum\titlelength=4\ziju{0.5}%
        \fi
      \fi
    \fi
  \fi#1}
\def\@ustc@textcircled#1{%
  \ifnum\value{#1}>9\relax
    \ClassError{ustcthesis}{Cannot display more than 10 footnotes.}{}%
  \fi
  \ding{\the\numexpr\value{#1}+191\relax}}
\setcounter{secnumdepth}{5}
\ctexset{
  chapter = {
    format      = \centering\sffamily\bfseries\@ustc@setfontsize{16\bp@}{32\bp@},
    nameformat  = {},
    titleformat = \@ustc@spacetitle,
    number      = \thechapter,
    aftername   = \hspace{\ccwd},
    beforeskip  = -7\bp@, % 24bp - 31bp
    afterskip   = 8\bp@, % 18bp - 10bp
    % fixskip   = true, % will be used in future version
  },
  section = {
    format     = \sffamily\@ustc@setfontsize{14\bp@}{28\bp@},
    aftername  = \hspace{\ccwd},
    beforeskip = 24\bp@,
    afterskip  = 6\bp@,
  },
  subsection = {
    format     = \sffamily\@ustc@setfontsize{13\bp@}{26\bp@},
    aftername  = \hspace{\ccwd},
    indent     = 2\ccwd,
    beforeskip = 12\bp@,
    afterskip  = 6\bp@,
  },
  subsubsection = {
    format     = \sffamily\@ustc@setfontsize{12\bp@}{24\bp@},
    number     = \arabic{subsubsection},
    aftername  = .\space,
    indent     = 2\ccwd,
    beforeskip = 12\bp@,
    afterskip  = 6\bp@,
  },
  paragraph = {
    format     = \rmfamily\@ustc@setfontsize{12\bp@}{24\bp@},
    number     = （\arabic{paragraph}）,
    aftername  = \space,
    indent     = 2\ccwd,
    beforeskip = \z@,
    afterskip  = \z@,
    runin      = false,
  },
  subparagraph = {
    format     = \rmfamily\@ustc@setfontsize{12\bp@}{24\bp@},
    number     = \@ustc@textcircled{subparagraph},
    aftername  = \space,
    indent     = 2\ccwd,
    beforeskip = \z@,
    afterskip  = \z@,
    runin      = false,
  },
}
\if@ustc@bachelor
  \setcounter{secnumdepth}{4}
  \ctexset{
    chapter = {
      format = \centering\sffamily\@ustc@setfontsize{16\bp@}{32\bp@},
    },
    section = {
      format = \centering\sffamily\@ustc@setfontsize{15\bp@}{30\bp@},
    },
    subsection = {
      format    = \sffamily\@ustc@setfontsize{14\bp@}{28\bp@},
      indent    = \z@,
    },
    subsubsection = {
      format    = \rmfamily\@ustc@setfontsize{12\bp@}{24\bp@},
      indent    = \ccwd,
    },
    paragraph = {
      aftername = {},
      indent    = \ccwd,
    },
    subparagraph = {
      format    = {},
      name      = {},
      aftername = {},
      indent    = 2\ccwd,
    },
  }
  \if@ustc@arabic\else
    \ctexset{
      chapter = {
        number = \chinese{chapter},
      },
      section = {
        name   = {第,节},
        number = \chinese{section},
      },
      subsection = {
        number    = \chinese{subsection},
        aftername = {、},
      },
    }
  \fi
\fi
\newcounter{ustc@pdfbookmark}
\NewDocumentCommand\@ustc@chapter{o m}{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \addtocounter{ustc@pdfbookmark}\@ne
  \IfValueTF{#1}{%
    \pdfbookmark[0]{#1}{ustcchapter.\theustc@pdfbookmark}%
    \chaptermark{#1}%
  }{%
    \pdfbookmark[0]{#2}{ustcchapter.\theustc@pdfbookmark}%
    \chaptermark{#2}%
  }%
  \chapter*{#2}}
\newif\if@ustc@addtocspace
\if@ustc@bachelor
  \@ustc@addtocspacetrue
\fi
\renewcommand\chapter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \global\@topnum\z@
  \@afterindenttrue
  \if@ustc@bachelor
    \if@mainmatter
      \ctexset{chapter/format =
        \centering\sffamily\@ustc@setfontsize{16\bp@}{32\bp@}}%
    \else
      \ctexset{chapter/format =
        \centering\sffamily\@ustc@setfontsize{18\bp@}{36\bp@}}%
    \fi
    \if@ustc@addtocspace
      \addtocontents{toc}{\protect\addvspace{12\bp@}}%
    \fi
  \fi
  \secdef\@chapter\@schapter
}
\newenvironment{abstract}{%
  \if@ustc@bachelor
    \chapter{中文内容摘要}%
    \if@ustc@tocloaded\else
      需要将摘要的位置调整到目录后。\par
      \pagenumbering{Roman}%
    \fi
  \else
    \@ustc@chapter{摘要}%
  \fi
}{}
\newenvironment{enabstract}{%
  \if@ustc@bachelor
    \chapter[英文内容摘要]{Abstract}%
  \else
    \@ustc@chapter[Abstract]{ABSTRACT}%
  \fi}{}
\newcommand\keywords[1]{%
  \par\phantom{empty line}\par\noindent\hangindent=4\ccwd\relax
  \textbf{关键词}：#1}
\newcommand\enkeywords[1]{%
  \par\phantom{empty}\par\noindent\hangindent=5.3em\relax
  \textbf{Key Words}: #1}
\renewcommand\tableofcontents{%
  \cleardoublepage
  \if@ustc@bachelor
    \pagenumbering{arabic}%
    \@ustc@tocloadedtrue
  \fi
  \@ustc@chapter{\contentsname}%
  \@starttoc{toc}}
\newcommand\@ustc@leaders{\titlerule*[0.5pc]{$\cdot$}}
\if@ustc@bachelor
  \titlecontents{chapter}
    [\z@]
    {\@ustc@setfontsize{12\bp@}{20\bp@}}
    {\contentspush{\thecontentslabel\hskip\ccwd\relax}}
    {}{\@ustc@leaders\contentspage}
  \titlecontents{section}
    [\ccwd]
    {\@ustc@setfontsize{12\bp@}{20\bp@}}
    {\contentspush{\thecontentslabel\hskip\ccwd\relax}}
    {}{\@ustc@leaders\contentspage}
  \titlecontents{subsection}
    [2\ccwd]
    {\@ustc@setfontsize{12\bp@}{20\bp@}}
    {\contentspush{\thecontentslabel
      \if@ustc@arabic\hspace{\ccwd}\else 、\fi}}
    {}{\@ustc@leaders\contentspage}
\else
  \titlecontents{chapter}
    [\z@]
    {\addvspace{6\bp@}\@ustc@setfontsize{14\bp@}{20\bp@}}
    {\contentspush{\thecontentslabel\unskip\hskip\ccwd\relax}}
    {}{\@ustc@leaders\@ustc@setfontsize{12\bp@}{20\bp@}\contentspage}
  \titlecontents{section}
    [\ccwd]
    {\@ustc@setfontsize{12\bp@}{20\bp@}}
    {\contentspush{\thecontentslabel\hskip\ccwd\relax}}
    {}{\@ustc@leaders\@ustc@setfontsize{12\bp@}{20\bp@}\contentspage}
  \titlecontents{subsection}
    [2\ccwd]
    {\@ustc@setfontsize{10.5\bp@}{20\bp@}}
    {\contentspush{\thecontentslabel\hskip\ccwd\relax}}
    {}{\@ustc@leaders\@ustc@setfontsize{12\bp@}{20\bp@}\contentspage}
\fi
\titlecontents{figure}
  [\ccwd]
  {\addvspace{6\bp@}\@ustc@setfontsize{12\bp@}{20\bp@}}
  {\thecontentslabel\hspace*{0.5em}}
  {}{\@ustc@leaders\contentspage}
\titlecontents{table}
  [\ccwd]
  {\addvspace{6\bp@}\@ustc@setfontsize{12\bp@}{20\bp@}}
  {\thecontentslabel\hspace*{0.5em}}
  {}{\@ustc@leaders\contentspage}
\renewcommand\listoffigures{%
  \if@ustc@bachelor\clearpage\else\cleardoublepage\fi
  \@ustc@chapter{\listfigurename}%
  \@starttoc{lof}}
\renewcommand\listoftables{%
  \if@ustc@bachelor\clearpage\else\cleardoublepage\fi
  \@ustc@chapter{\listtablename}%
  \@starttoc{lot}}
\if@ustc@bachelor
  \g@addto@macro\frontmatter{\@ustc@addtocspacefalse}%
  \g@addto@macro\mainmatter{\@ustc@addtocspacetrue}%
  \g@addto@macro\backmatter{\@ustc@addtocspacefalse}%
  \g@addto@macro\appendix{\@ustc@addtocspacefalse}%
\fi
\newif\if@ustc@tocloaded
\newenvironment{notation}{%
  \if@ustc@bachelor\clearpage\else\cleardoublepage\fi
  \thispagestyle{ustc@notation}%
  \ctexset{chapter/format = \centering\rmfamily\@ustc@setfontsize{12\bp@}}%
  \@ustc@chapter{\@ustc@notationname}%
  \@ustc@setfontsize{10.5\bp@}{16\bp@}%
  \setlength{\itemsep}{\z@}}{}%
\setlength{\parindent}{2\ccwd}
\setlength{\parskip}{\z@}
\renewcommand{\thefootnote}{\@ustc@textcircled{footnote}}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.25\textwidth
  \kern2.6\p@}
\renewcommand\@makefntext[1]{%
  \parindent 2\ccwd\relax
  \noindent
  \hb@xt@2\ccwd{\hss\@makefnmark}#1}
\renewcommand{\topfraction}{.85}
\renewcommand{\bottomfraction}{.65}
\renewcommand\textfraction{.15}
\renewcommand{\floatpagefraction}{.6}
\DeclareCaptionLabelSeparator{zhspace}{\hspace{\ccwd}}
\captionsetup{
  format   = hang,
  font     = small,
  labelsep = zhspace,
}
\if@ustc@bachelor\else
  \captionsetup{font+=bf}
\fi
\captionsetup[figure]{
  position  = bottom,
  aboveskip = 6\bp@,
  belowskip = {12\bp@-\intextsep},
}
\captionsetup[table]{
  position  = top,
  aboveskip = 6\bp@,
  belowskip = 6\bp@,
}
\newcommand\note[1]{%
  \captionsetup{position=bottom, font=small}%
  \caption*{\raggedright\hangindent=2\ccwd\relax\@ustc@notesname#1}}
\renewcommand\le{\leqslant}
\renewcommand\leq{\leqslant}
\renewcommand\ge{\geqslant}
\renewcommand\geq{\geqslant}
\newcommand\bibstyle@super{\bibpunct{[}{]}{,}{s}{,}{\textsuperscript{,}}}
\newcommand\bibstyle@numbers{\bibpunct{[}{]}{,}{n}{,}{,}}
\newcommand\bibstyle@authoryear{\bibpunct{(}{)}{;}{a}{,}{,}}
\def\tmp@numerical{numerical}
\def\tmp@authoryear{authoryear}
\newcommand\@ustcbibstyle[1]{%
  \def\tmp@gbt{#1}%
  \ifx\tmp@gbt\tmp@numerical
    \bibliographystyle{ustcthesis-numerical}%
  \else
    \ifx\tmp@gbt\tmp@authoryear
      \bibliographystyle{ustcthesis-authoryear}%
    \else
      \PackageError{ustcthesis}{Unknown argument #1.}%
      {It should be `numerical' or `authoryear'.}%
    \fi
  \fi
}
\if@ustc@bachelor
  \if@ustc@super
    \citestyle{super}
  \else
    \citestyle{numbers}
  \fi
  \bibliographystyle{ustcthesis-bachelor}
\else
  \if@ustc@numerical
    \if@ustc@super
      \citestyle{super}
    \else
      \citestyle{numbers}
    \fi
    \bibliographystyle{ustcthesis-numerical}
  \else
    \citestyle{authoryear}
    \bibliographystyle{ustcthesis-authoryear}
  \fi
\fi
\patchcmd{\NAT@citexnum}{%
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
\patchcmd{\NAT@citexnum}{%
  \ifx\NAT@last@yr\relax
    \def@NAT@last@yr{\@citea}%
  \else
    \def@NAT@last@yr{--\NAT@penalty}%
  \fi
}{%
  \def@NAT@last@yr{-\NAT@penalty}%
}{}{}
\renewcommand\bibfont{\@ustc@setfontsize{10.5bp}{20bp}}
\setlength{\bibsep}{\z@}
\setlength{\bibhang}{2\ccwd}
\renewcommand\@biblabel[1]{[#1]\hfill}
\g@addto@macro\UrlBreaks{%
  \do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j
  \do\k\do\l\do\m\do\n\do\o\do\p\do\q\do\r\do\s\do\t
  \do\u\do\v\do\w\do\x\do\y\do\z
  \do\A\do\B\do\C\do\D\do\E\do\F\do\G\do\H\do\I\do\J
  \do\K\do\L\do\M\do\N\do\O\do\P\do\Q\do\R\do\S\do\T
  \do\U\do\V\do\W\do\X\do\Y\do\Z
  \do\1\do\2\do\3\do\4\do\5\do\6\do\7\do\8\do\9\do\0
}
\renewcommand\bibsection{%
  \@mainmatterfalse
  \chapter{\bibname}%
  \@mainmattertrue
}
\newenvironment{acknowledgements}{%
  \if@ustc@bachelor
    \@ustc@chapter{\@ustc@acknowledgementsname}%
    \if@ustc@tocloaded
      需要将致谢的位置调整到目录前。\par
    \fi
  \else
    \chapter{\@ustc@acknowledgementsname}%
  \fi
}{}
\newenvironment{publications}{\chapter{\@ustc@publicationsname}}{}
