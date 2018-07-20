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
  [2018/09/01 v3.1 USTC thesis template]
\newif\ifustc@doctor
\newif\ifustc@master
\newif\ifustc@bachelor
\newif\ifustc@professional
\newif\ifustc@english
\newif\ifustc@numerical
\newif\ifustc@super
\newif\ifustc@pdf
\newif\ifustc@arabic
\DeclareOption{doctor}{\ustc@doctortrue\ustc@masterfalse\ustc@bachelorfalse}
\DeclareOption{master}{\ustc@doctorfalse\ustc@mastertrue\ustc@bachelorfalse}
\DeclareOption{bachelor}{\ustc@doctorfalse\ustc@masterfalse\ustc@bachelortrue}
\DeclareOption{professional}{\ustc@professionaltrue}
\DeclareOption{chinese}{\ustc@englishfalse}
\DeclareOption{english}{\ustc@englishtrue\ustc@arabictrue}
\DeclareOption{print}{\ustc@pdffalse}
\DeclareOption{pdf}{\ustc@pdftrue}
\DeclareOption{super}{\ustc@numericaltrue\ustc@supertrue}
\DeclareOption{numbers}{\ustc@numericaltrue\ustc@superfalse}
\DeclareOption{authoryear}{\ustc@numericalfalse}
\DeclareOption{arabic}{\ustc@arabictrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ExecuteOptions{doctor,chinese,print,super}
\ProcessOptions\relax
\ifustc@english
  \PassOptionsToClass{scheme=plain}{ctexbook}
\fi
\ifustc@pdf
  \PassOptionsToClass{oneside}{book}
\fi
\PassOptionsToPackage{quiet}{xeCJK}
\LoadClass[UTF8, a4paper, openany, zihao=-4]{ctexbook}[2016/05/16]
\@ifclasslater{ctexbook}{2016/05/16}{}{
  \ClassError{ustcthesis}{%
    This template requires TeX Live\MessageBreak 2016 or later version}{}
}
\RequirePackage{hyperref}
\RequirePackage{etoolbox}
\RequirePackage{amsmath}
\RequirePackage{unicode-math}
\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{pifont}
\RequirePackage{titletoc}
\RequirePackage[perpage]{footmisc}
\RequirePackage{caption}
\RequirePackage{calc}
\ifustc@numerical
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
\ifustc@pdf
  \hypersetup{
    colorlinks=true,
    allcolors=blue,
  }
\fi
\pdfstringdefDisableCommands{
  \let\\\empty
}
\urlstyle{same}
\def\UrlBreaks{%
  \do\/%
  \do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j\do\k\do\l%
     \do\m\do\n\do\o\do\p\do\q\do\r\do\s\do\t\do\u\do\v\do\w\do\x\do\y\do\z%
  \do\A\do\B\do\C\do\D\do\E\do\F\do\G\do\H\do\I\do\J\do\K\do\L%
     \do\M\do\N\do\O\do\P\do\Q\do\R\do\S\do\T\do\U\do\V\do\W\do\X\do\Y\do\Z%
  \do0\do1\do2\do3\do4\do5\do6\do7\do8\do9\do=\do/\do.\do:%
  \do\*\do\-\do\~\do\'\do\"\do\-}
\Urlmuskip=0mu plus 0.1mu
\newcommand\ustc@strifeq{\csname str_if_eq_x:nnTF\endcsname}
\newcommand\ustc@fontset{\csname g__ctex_fontset_tl\endcsname}
\ustc@strifeq{\ustc@fontset}{mac}{
  \setmainfont{Times New Roman}
  \setsansfont{Arial}
  \setmonofont[Scale=MatchLowercase]{Menlo}
  \setCJKmainfont[
       UprightFont = * Light,
          BoldFont = * Bold,
        ItalicFont = Kaiti SC,
    BoldItalicFont = Kaiti SC Bold,
  ]{Songti SC}
  \setCJKsansfont{Heiti SC}
  \setCJKfamilyfont{zhsong}[
       UprightFont = * Light,
          BoldFont = * Bold,
  ]{Songti SC}
  \setCJKfamilyfont{zhhei}{Heiti SC}
  \setCJKfamilyfont{zhkai}{Kaiti SC}
}{
  \ustc@strifeq{\ustc@fontset}{windows}{
    \setmainfont{Times New Roman}
    \setsansfont{Arial}
    \setmonofont[Scale=MatchLowercase]{Menlo}
    \IfFileExists{C:/bootfont.bin}{
      \setCJKmainfont[AutoFakeBold,ItalicFont=KaiTi_GB2312]{SimSun}
    }{
      \setCJKmainfont[AutoFakeBold,ItalicFont=KaiTi]{SimSun}
    }
    \setCJKsansfont[AutoFakeBold]{SimHei}
    \setCJKfamilyfont{zhsong}[AutoFakeBold]{SimSun}
    \setCJKfamilyfont{zhhei}[AutoFakeBold]{SimHei}
  }{
    \ustc@strifeq{\ustc@fontset}{adobe}{
      \setmainfont{Times New Roman}
      \setsansfont{Arial}
      \setmonofont[Scale=MatchLowercase]{Menlo}
      \setCJKmainfont[
        AutoFakeBold,
        ItalicFont=AdobeKaitiStd-Regular,
      ]{AdobeSongStd-Light}
      \setCJKsansfont[AutoFakeBold]{AdobeHeitiStd-Regular}
      \setCJKfamilyfont{zhsong}[AutoFakeBold]{AdobeSongStd-Light}
      \setCJKfamilyfont{zhhei}[AutoFakeBold]{AdobeHeitiStd-Regular}
    }{
      \ustc@strifeq{\ustc@fontset}{fandol}{
        \setmainfont[
          Extension      = .otf,
          UprightFont    = *-regular,
          BoldFont       = *-bold,
          ItalicFont     = *-italic,
          BoldItalicFont = *-bolditalic,
        ]{texgyretermes}
        \setsansfont[
          Extension      = .otf,
          UprightFont    = *-regular,
          BoldFont       = *-bold,
          ItalicFont     = *-italic,
          BoldItalicFont = *-bolditalic,
          Scale          = MatchLowercase,
        ]{texgyreheros}
        \setmonofont[
          Extension      = .otf,
          UprightFont    = *-regular,
          BoldFont       = *-bold,
          ItalicFont     = *-italic,
          BoldItalicFont = *-bolditalic,
          Scale          = MatchLowercase,
        ]{texgyrecursor}
        \ClassWarningNoLine{ustcthesis}{%
          You are using Fandol font family.\MessageBreak
          Some glyphs may be missing.\MessageBreak
          Please switch to a high-quality font set.
        }
      }{}
    }
  }
}
\unimathsetup{
  math-style = ISO,
  bold-style = ISO,
  nabla      = upright,
  partial    = upright,
}
\newcommand\ustc@mathfont{xits}
\@ifpackagelater{fontspec}{2017/01/20}{
  \IfFontExistsTF{STIX2Math.otf}{
    \renewcommand\ustc@mathfont{stix2}
  }{}
}{}
\ustc@strifeq{\ustc@mathfont}{stix2}{
  \setmathfont[StylisticSet=8]{STIX2Math.otf}
  \setmathfont[range={scr,bfscr},StylisticSet=1]{STIX2Math.otf}
  \setmathfont[range=\partial]{xits-math.otf}
}{
  \ustc@strifeq{\ustc@mathfont}{xits}{
    \setmathfont[
      Extension    = .otf,
      BoldFont     = *bold,
      StylisticSet = 8,
    ]{xits-math}
    \setmathfont[range={cal,bfcal},StylisticSet=1]{xits-math.otf}
  }{}
}

\newdimen\bp@
\bp@=1bp
\ifustc@bachelor
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
    \belowdisplayskip \abovedisplayskip
  }
  \renewcommand\footnotesize{%
    \@setfontsize\footnotesize{9\bp@}{16.5\bp@}%
    \abovedisplayskip 9\bp@ \@plus2\bp@ \@minus5\bp@
    \abovedisplayshortskip \z@ \@plus3\bp@
    \belowdisplayshortskip 6\bp@ \@plus3\bp@ \@minus3\bp@
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
    \belowdisplayskip \abovedisplayskip
  }
  \renewcommand\footnotesize{%
     \@setfontsize\footnotesize{9\bp@}{15\bp@}%
     \abovedisplayskip 9\bp@ \@plus2\bp@ \@minus5\bp@
     \abovedisplayshortskip \z@ \@plus3\bp@
     \belowdisplayshortskip 6\bp@ \@plus3\bp@ \@minus3\bp@
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
\linespread{1}\selectfont
\newcommand\ustc@setfontsize[2]{%
  \fontsize{#1}{#2}\selectfont}
\ifustc@english
  \renewcommand\figurename{Fig.}
  \newcommand\ustc@notesname{\textbf{Notes}: }
  \newcommand\ustc@acknowledgementsname{Acknowledgements}
  \newcommand\ustc@publicationsname{Publications}
  \newcommand\ustc@notationname{Notation}
\else
  \newcommand\ustc@notesname{\textbf{注}：}
  \newcommand\ustc@acknowledgementsname{致谢}
  \newcommand\ustc@publicationsname{在读期间发表的学术论文与取得的研究成果}
  \newcommand\ustc@notationname{符号说明}
\fi
\geometry{
  paper=a4paper,
  top=2.54cm, bottom=2.54cm,
  left=3.17cm, right=3.17cm,
  headheight=0.75cm, headsep=0.29cm,
  footskip=0.79cm}
\renewcommand{\headrulewidth}{0.4pt}
\ifustc@bachelor
  \fancypagestyle{ustc@headings}{
    \fancyhf{}
    \fancyhead[C]{\ustc@setfontsize{9\bp@}{18\bp@}中国科学技术大学本科毕业论文}
    \fancyfoot[C]{\ustc@setfontsize{9\bp@}{18\bp@}\thepage}}
\else
  \fancypagestyle{ustc@headings}{
    \fancyhf{}
    \fancyhead[C]{\ustc@setfontsize{10.5\bp@}{21\bp@}\leftmark}
    \fancyfoot[C]{\ustc@setfontsize{10.5\bp@}{21\bp@}\thepage}}
\fi
\fancypagestyle{ustc@notation}{\fancyfoot{}}
\pagestyle{ustc@headings}
\newcommand\ustc@patchfailure[1]{%
  \ClassError{ustcthesis}{Failed to patch command \protect#1.\MessageBreak
    Please contact the template author.%
  }{}%
}
\patchcmd\chaptermark{\MakeUppercase}{}{}{\ustc@patchfailure{\chaptermark}}
\patchcmd\chaptermark{#1}{\ustc@spacetitle{#1}}
  {}{\ustc@patchfailure{\chaptermark}}
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
  \hbox{}\thispagestyle{empty}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
\renewcommand\frontmatter{%
  \cleardoublepage
  \@mainmatterfalse
  \ifustc@bachelor
    \pagenumbering{gobble}%
  \else
    \pagenumbering{Roman}%
  \fi}
\renewcommand\mainmatter{%
  \ifustc@bachelor
    \clearpage
  \else
    \cleardoublepage
    \pagenumbering{arabic}%
  \fi
  \@mainmattertrue}
\renewcommand\maketitle{%
  \hypersetup{
    pdftitle={\ustc@title},
    pdfauthor={\ustc@author}
  }
  \pagenumbering{gobble}%
  \pdfbookmark[0]{封面}{titlepage}%
  \ustc@makezhtitle
  \cleardoublepage
  \pdfbookmark[0]{Title page}{entitlepage}%
  \ustc@makeentitle
  \cleardoublepage
}
\ifustc@doctor
  \newcommand\ustc@thesisname{博士学位论文}
  \newcommand\ustc@enthesisname{A dissertation for doctor's degree}
\else
  \ifustc@master
    \newcommand\ustc@thesisname{硕士学位论文}
    \newcommand\ustc@enthesisname{A dissertation for master's degree}
  \else
    \newcommand\ustc@thesisname{学士学位论文}
    \newcommand\ustc@enthesisname{A dissertation for bachelor's degree}
  \fi
\fi
\ifustc@professional
  \ifustc@doctor
    \renewcommand\ustc@thesisname{专业博士学位论文}
  \else
    \renewcommand\ustc@thesisname{专业硕士学位论文}
  \fi
  \ustc@strifeq{\ustc@fontset}{mac}{
    \setCJKfamilyfont{zhli}{Baoli SC}
    \providecommand\lishu{\CJKfamily{zhli}}
  }{
    \providecommand\lishu{\relax}
  }
  \newcommand\ustc@specialityname{专业领域}
\else
  \newcommand\ustc@specialityname{学科专业}
\fi
\def\ustc@define@term#1#2{%
  \expandafter\gdef\csname #1\endcsname##1{%
    \expandafter\gdef\csname ustc@#1\endcsname{##1}%
  }%
  \csname #1\endcsname{#2}%
}
\ustc@define@term{title}{论文题目}
\ustc@define@term{author}{XXX}
\ustc@define@term{major}{XXX}
\ustc@define@term{supervisor}{XXX\quad 教授}
\ustc@define@term{cosupervisor}{}
\ustc@define@term{date}{\zhnumsetup{time=Chinese}\zhtoday}
\ustc@define@term{professionaltype}{}
\ustc@define@term{secretlevel}{}
\ustc@define@term{secretyear}{}
\ustc@define@term{entitle}{Title}
\ustc@define@term{enauthor}{XXX}
\ustc@define@term{enmajor}{XXX}
\ustc@define@term{ensupervisor}{Prof. XXX}
\ustc@define@term{encosupervisor}{}
\ustc@define@term{endate}{\CTEX@todayold}
\ustc@define@term{enprofessionaltype}{}
\ustc@define@term{ensecretlevel}{}
\newcommand\ustc@makezhtitle{%
  \begin{titlepage}%
    \centering
    \parbox[t][0.6cm][t]{\textwidth}{%
      \raggedleft\fangsong\ustc@setfontsize{14\bp@}{14\bp@}%
      \null\ustc@secretlevel\par}\par
    \vskip 0.6cm%
    \includegraphics[height=37\bp@]{figures/ustc_logo_text}\par
    \vskip 0.5cm%
    \ifustc@professional
      {\sffamily\ustc@setfontsize{56\bp@}{56\bp@}\ziju{-0.09}%
        \ustc@thesisname\par}%
      \vskip 0.8cm%
      {\lishu\ustc@setfontsize{26\bp@}{26\bp@}%
        （\ustc@professionaltype）\par}%
      \vskip 0.7cm%
      \includegraphics[height=4.7cm]{figures/ustc_logo_fig}\par
      \vskip 0.6cm%
      \begin{minipage}[t][3.5cm][c]{\textwidth}%
        \centering\sffamily\bfseries\ustc@setfontsize{26\bp@}{50\bp@}%
        \ustc@title\par
      \end{minipage}\par
    \else
      {\sffamily\ustc@setfontsize{56\bp@}{56\bp@}%
        \ustc@thesisname\par}%
      \vskip 1.7cm%
      \includegraphics[height=4.7cm]{figures/ustc_logo_fig}\par
      \vskip 0.6cm%
      \begin{minipage}[t][3.5cm][c]{\textwidth}%
        \centering\sffamily\bfseries\ustc@setfontsize{26\bp@}{50\bp@}%
        \ustc@title\par
      \end{minipage}\par
    \fi
    \vskip 0.6cm%
    {\ustc@setfontsize{16\bp@}{31\bp@}%
      \begin{tabular}{@{}l@{\hspace{\ccwd}}l@{}}%
        \textsf{作者姓名：} & \ustc@author \\
        \textsf{\ustc@specialityname：} & \ustc@major \\
        \textsf{导师姓名：} & \ustc@supervisor\quad\ustc@cosupervisor \\
        \textsf{完成时间：} & \ustc@date
      \end{tabular}\par}%
  \end{titlepage}%
}
\newcommand\ustc@supervisorline{%
  \ifx\ustc@encosupervisor\@empty
    Supervisor: \ustc@ensupervisor
  \else
    Supervisors: \ustc@ensupervisor, \ustc@encosupervisor
  \fi}
\newcommand\ustc@makeentitle{%
  \begin{titlepage}%
    \centering
    \parbox[t][0.4cm][t]{\textwidth}{%
      \raggedleft\ustc@setfontsize{14\bp@}{14\bp@}%
      \null\ustc@ensecretlevel\par}\par
    \vskip 0.5cm%
    {\sffamily\ustc@setfontsize{20\bp@}{30\bp@}%
      University of Science and Technology of China\par}%
    {\sffamily\ustc@setfontsize{26\bp@}{30\bp@}%
      \ustc@enthesisname\par}%
    \ifustc@professional
      {\ustc@setfontsize{16\bp@}{32\bp@}%
        (\ustc@enprofessionaltype)\par}%
      \vskip 2.2cm%
      \includegraphics[height=5.1cm]{figures/ustc_logo_fig}\par
      \vskip 0.2cm%
      \begin{minipage}[t][4.5cm][c]{\textwidth}%
        \centering\sffamily\bfseries\ustc@setfontsize{26\bp@}{30\bp@}%
        \ustc@entitle\par
      \end{minipage}\par
    \else
      \vskip 2.2cm%
      \includegraphics[height=5.1cm]{figures/ustc_logo_fig}\par
      \vskip 0.2cm%
      \begin{minipage}[t][4.5cm][c]{\textwidth}%
        \centering\sffamily\bfseries\ustc@setfontsize{26\bp@}{30\bp@}%
        \ustc@entitle\par
      \end{minipage}\par
    \fi
    \vskip 1.6cm%
    {\ustc@setfontsize{16\bp@}{30\bp@}%
      \begin{tabular}{@{}l@{}}
        Author:        \ustc@enauthor \\
        Speciality:    \ustc@enmajor \\
        \ustc@supervisorline \\
        Finished time: \ustc@endate
      \end{tabular}\par}%
  \end{titlepage}%
}
\newcommand\ustc@originality{%
本人声明所呈交的学位论文，是本人在导师指导下进行研究工作所取得的成果。
除已特别加以标注和致谢的地方外，论文中不包含任何他人已经发表或撰写过
的研究成果。与我一同工作的同志对本研究所做的贡献均已在论文中作了明确的说明。}
\newcommand\ustc@authorization{%
作为申请学位的条件之一，学位论文著作权拥有者授权中国科学技术大学拥有
学位论文的部分使用权，即：学校有权按有关规定向国家有关部门或机构送交
论文的复印件和电子版，允许论文被查阅和借阅，可以将学位论文编入《中国
学位论文全文数据库》等有关数据库进行检索，可以采用影印、缩印或扫描等
复制手段保存、汇编学位论文。本人提交的电子文档的内容和纸质论文的内容
相一致。\par
保密的学位论文在解密后也遵守此规定。}
\newcommand\ustc@underline[2][3.2cm]{\underline{\hb@xt@ #1{\hss#2\hss}}}
\newcommand\ustc@checkbox{%
  \makebox[\z@][l]{$\square$}%
  \raisebox{-0.2ex}{\hspace{0.1em}$\checkmark$}%
}
\ifustc@bachelor
  \newcommand\makestatement{}
\else
  \newcommand\makestatement{%
    \pdfbookmark[0]{原创性声明}{statement}%
    \begin{titlepage}%
      \null
      \vskip 0.3cm%
      {\centering\sffamily\ustc@setfontsize{16\bp@}{32\bp@}%
        中国科学技术大学学位论文原创性声明\par}%
      \vskip 0.7cm%
      \ustc@originality\par
      \vskip 1.3cm%
      作者签名：\ustc@underline{}\hspace{2.7cm}%
      签字日期：\ustc@underline{}\par
      \vskip 1.9cm%
      {\centering\sffamily\ustc@setfontsize{16\bp@}{32\bp@}%
        中国科学技术大学学位论文授权使用声明\par}
      \vskip 0.7cm%
      \ustc@authorization\par
      \vskip 0.6cm%
      \ifx\ustc@secretlevel\@empty
        \ustc@checkbox{} 公开\quad
        $\square$ 保密（\ustc@underline[0.85cm]{}年）\par
      \else
        $\square$ 公开\quad
        \ustc@checkbox{} 保密（\ustc@underline[0.8cm]{\ustc@secretyear}年）\par
      \fi
      \vskip 0.5cm%
      作者签名：\ustc@underline{}\hspace{2.7cm}%
      导师签名：\ustc@underline{}\par
      \vskip 0.5cm%
      签字日期：\ustc@underline{}\hspace{2.7cm}%
      签字日期：\ustc@underline{}\par
    \end{titlepage}
    \cleardoublepage
  }%
\fi
\setcounter{secnumdepth}{5}
\DeclareRobustCommand\ustc@spacetitle[1]{%
  \def\ustc@titlelength{\csname str_count:N\endcsname{#1}}
  \begingroup
  \ifustc@bachelor
    \if@mainmatter\relax\else
      \ifnum\ustc@titlelength=2\ziju{1}\else
        \ifnum\ustc@titlelength=4\ziju{0.5}%
        \fi
      \fi
    \fi
  \else
    \ifnum\ustc@titlelength=2\ziju{2}\else
      \ifnum\ustc@titlelength=3\ziju{1}\else
        \ifnum\ustc@titlelength=4\ziju{0.5}%
        \fi
      \fi
    \fi
  \fi#1\endgroup}
\def\ustc@textcircled#1{%
  \ifnum\value{#1}>9\relax
    \ClassError{ustcthesis}{Cannot display more than 10 footnotes}{}%
  \fi
  \ding{\the\numexpr\value{#1}+191\relax}}
\setcounter{secnumdepth}{5}
\@ifclasslater{ctexbook}{2016/09/21}{
  \ctexset{
    chapter = {
      beforeskip = 24\bp@,
      afterskip  = 18\bp@,
      fixskip    = true,
    },
  }
}{
  \ctexset{
    chapter = {
      beforeskip = -7\bp@, % 24bp - 31bp
      afterskip  = 8\bp@, % 18bp - 10bp
    },
  }
}
\ctexset{
  chapter = {
    format      = \centering\sffamily\bfseries\ustc@setfontsize{16\bp@}{32\bp@},
    nameformat  = {},
    titleformat = \ustc@spacetitle,
    number      = \thechapter,
    aftername   = \hspace{\ccwd},
  },
  section = {
    format     = \sffamily\ustc@setfontsize{14\bp@}{28\bp@},
    aftername  = \hspace{\ccwd},
    beforeskip = 24\bp@,
    afterskip  = 6\bp@,
  },
  subsection = {
    format     = \sffamily\ustc@setfontsize{13\bp@}{26\bp@},
    aftername  = \hspace{\ccwd},
    indent     = 2\ccwd,
    beforeskip = 12\bp@,
    afterskip  = 6\bp@,
  },
  subsubsection = {
    format     = \sffamily\ustc@setfontsize{12\bp@}{24\bp@},
    number     = \arabic{subsubsection},
    aftername  = .\space,
    indent     = 2\ccwd,
    beforeskip = 12\bp@,
    afterskip  = 6\bp@,
  },
  paragraph = {
    format     = \rmfamily\ustc@setfontsize{12\bp@}{24\bp@},
    number     = （\arabic{paragraph}）,
    aftername  = \space,
    indent     = 2\ccwd,
    beforeskip = \z@,
    afterskip  = \z@,
    runin      = false,
  },
  subparagraph = {
    format     = \rmfamily\ustc@setfontsize{12\bp@}{24\bp@},
    number     = \ustc@textcircled{subparagraph},
    aftername  = \space,
    indent     = 2\ccwd,
    beforeskip = \z@,
    afterskip  = \z@,
    runin      = false,
  },
}
\ifustc@bachelor
  \setcounter{secnumdepth}{4}
  \ctexset{
    chapter = {
      format = {
        \centering\sffamily
        \if@mainmatter
          \ustc@setfontsize{16\bp@}{32\bp@}
        \else
          \ustc@setfontsize{18\bp@}{36\bp@}
        \fi
      },
    },
    section = {
      format = \centering\sffamily\ustc@setfontsize{15\bp@}{30\bp@},
    },
    subsection = {
      format    = \sffamily\ustc@setfontsize{14\bp@}{28\bp@},
      indent    = \z@,
    },
    subsubsection = {
      format    = \rmfamily\ustc@setfontsize{12\bp@}{24\bp@},
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
  \ifustc@arabic\else
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
\NewDocumentCommand\ustc@chapter{o m}{%
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
\newenvironment{abstract}{%
  \ifustc@bachelor
    \chapter{中文内容摘要}%
    \ifustc@tocloaded\else
      需要将摘要的位置调整到目录后。\par
      \pagenumbering{Roman}%
    \fi
  \else
    \ustc@chapter{摘要}%
  \fi
}{}
\newenvironment{enabstract}{%
  \ifustc@bachelor
    \chapter[英文内容摘要]{Abstract}%
  \else
    \ustc@chapter[Abstract]{ABSTRACT}%
  \fi}{}
\newcommand\keywords[1]{%
  \par\phantom{empty line}\par\noindent\hangindent=4\ccwd\relax
  \textbf{关键词}：#1}
\newcommand\enkeywords[1]{%
  \par\phantom{empty}\par\noindent\hangindent=5.3em\relax
  \textbf{Key Words}: #1}
\newif\ifustc@tocloaded
\renewcommand\tableofcontents{%
  \ifustc@bachelor
    \cleardoublepage
    \pagenumbering{arabic}%
    \ustc@tocloadedtrue
  \fi
  \ustc@chapter{\contentsname}%
  \@starttoc{toc}}
\renewcommand\listoffigures{%
  \ifustc@bachelor\else
    \cleardoublepage
  \fi
  \ustc@chapter{\listfigurename}%
  \@starttoc{lof}}
\renewcommand\listoftables{%
  \ifustc@bachelor\else
    \cleardoublepage
  \fi
  \ustc@chapter{\listtablename}%
  \@starttoc{lot}}
\newcommand\ustc@leaders{\titlerule*[0.5pc]{$\cdot$}}
\ifustc@bachelor
  \titlecontents{chapter}
    [\z@]
    {\normalsize}
    {\contentspush{\thecontentslabel\unskip\hskip\ccwd\relax}}
    {}{\ustc@leaders\contentspage}
  \titlecontents{section}
    [\ccwd]
    {\normalsize}
    {\contentspush{\thecontentslabel\hskip\ccwd\relax}}
    {}{\ustc@leaders\contentspage}
  \titlecontents{subsection}
    [2\ccwd]
    {\normalsize}
    {\contentspush{\thecontentslabel
      \ifustc@arabic\hspace{\ccwd}\else 、\fi}}
    {}{\ustc@leaders\contentspage}
\else
  \titlecontents{chapter}
    [\z@]
    {\addvspace{6\bp@}\ustc@setfontsize{14\bp@}{20\bp@}}
    {\contentspush{\thecontentslabel\unskip\hskip\ccwd\relax}}
    {}{\ustc@leaders\ustc@setfontsize{12\bp@}{20\bp@}\contentspage}
  \titlecontents{section}
    [\ccwd]
    {\ustc@setfontsize{12\bp@}{20\bp@}}
    {\contentspush{\thecontentslabel\hskip\ccwd\relax}}
    {}{\ustc@leaders\ustc@setfontsize{12\bp@}{20\bp@}\contentspage}
  \titlecontents{subsection}
    [2\ccwd]
    {\ustc@setfontsize{10.5\bp@}{20\bp@}}
    {\contentspush{\thecontentslabel\hskip\ccwd\relax}}
    {}{\ustc@leaders\ustc@setfontsize{12\bp@}{20\bp@}\contentspage}
\fi
\titlecontents{figure}
  [\ccwd]
  {\normalsize}
  {\thecontentslabel\hspace*{0.5em}}
  {}{\ustc@leaders\contentspage}
\titlecontents{table}
  [\ccwd]
  {\normalsize}
  {\thecontentslabel\hspace*{0.5em}}
  {}{\ustc@leaders\contentspage}
\newif\ifustc@addtocspace
\ifustc@bachelor
  \ustc@addtocspacetrue
  \g@addto@macro\frontmatter{\ustc@addtocspacefalse}%
  \g@addto@macro\mainmatter{\ustc@addtocspacetrue}%
  \g@addto@macro\backmatter{\ustc@addtocspacefalse}%
  \g@addto@macro\appendix{\ustc@addtocspacefalse}%
\fi
\renewcommand\chapter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \global\@topnum\z@
  \@afterindenttrue
  \ifustc@bachelor
    \ifustc@addtocspace
      \addtocontents{toc}{\protect\addvspace{12\bp@}}%
    \fi
  \fi
  \secdef\@chapter\@schapter
}
\newenvironment{notation}{%
  \ifustc@bachelor\clearpage\else\cleardoublepage\fi
  \pagestyle{ustc@notation}%
  \ustc@chapter{\ustc@notationname}%
  \setlength{\itemsep}{\z@}%
}{%
  \clearpage\pagestyle{ustc@headings}%
}%
\setlength{\parindent}{2\ccwd}
\setlength{\parskip}{\z@}
\renewcommand{\thefootnote}{\ustc@textcircled{footnote}}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.25\textwidth
  \kern2.6\p@}
\renewcommand\@makefntext[1]{%
  \parindent 2\ccwd\relax
  \noindent
  \hb@xt@2\ccwd{\hss\@makefnmark}#1}
\setlength\partopsep{\z@}
\newcommand\ustc@nolistsep{%
  \parsep \z@
  \topsep \z@
  \itemsep\z@
}
\def\@listi{\leftmargin\leftmargini
            \ustc@nolistsep}
\let\@listI\@listi
\@listi
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \ustc@nolistsep}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \ustc@nolistsep}
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
\ifustc@bachelor\else
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
  \caption*{\raggedright\hangindent=2\ccwd\relax\ustc@notesname#1}}
\def\mathellipsis{\cdots}
\protected\def\le{\leqslant}
\protected\def\ge{\geqslant}
\AtBeginDocument{%
  \renewcommand\leq{\leqslant}%
  \renewcommand\geq{\geqslant}%
}
\removenolimits{%
  \int\iint\iiint\iiiint\oint\oiint\oiiint
  \intclockwise\varointclockwise\ointctrclockwise\sumint
  \intbar\intBar\fint\cirfnint\awint\rppolint
  \scpolint\npolint\pointint\sqint\intlarhk\intx
  \intcap\intcup\upint\lowint
}
\AtBeginDocument{%
  \renewcommand{\Re}{\operatorname{Re}}%
  \renewcommand{\Im}{\operatorname{Im}}%
}
\AtBeginDocument{%
  \renewcommand\nabla{\mbfnabla}%
}
\newcommand\bm{\symbf}
\renewcommand\boldsymbol{\symbf}
\newcommand\square{\mdlgwhtsquare}
\newcommand\bibstyle@super{\bibpunct{[}{]}{,}{s}{,}{\textsuperscript{,}}}
\newcommand\bibstyle@numbers{\bibpunct{[}{]}{,}{n}{,}{,}}
\newcommand\bibstyle@authoryear{\bibpunct{(}{)}{;}{a}{,}{,}}
\def\tmp@numerical{numerical}
\def\tmp@authoryear{authoryear}
\newcommand\ustcbibstyle[1]{%
  \def\ustc@arg{#1}%
  \ifx\ustc@arg\tmp@numerical
    \bibliographystyle{ustcthesis-numerical}%
  \else
    \ifx\ustc@arg\tmp@authoryear
      \bibliographystyle{ustcthesis-authoryear}%
    \else
      \ClassError{ustcthesis}{Unknown argument #1.}%
        {It should be `numerical' or `authoryear'.}%
    \fi
  \fi
}
\ifustc@bachelor
  \ifustc@super
    \citestyle{super}
  \else
    \citestyle{numbers}
  \fi
  \bibliographystyle{ustcthesis-bachelor}
\else
  \ifustc@numerical
    \ifustc@super
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
}{}{\ustc@patchfailure{\NAT@citexnum}}
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
}{}{\ustc@patchfailure{\NAT@citex}}
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
}{}{\ustc@patchfailure{\NAT@citexnum}}
\ifustc@bachelor\else
  \renewcommand\bibfont{\ustc@setfontsize{10.5bp}{20bp}}
\fi
\setlength{\bibsep}{\z@}
\renewcommand\@biblabel[1]{[#1]\hfill}
\setlength{\bibhang}{2\ccwd}
\renewcommand\bibsection{%
  \@mainmatterfalse
  \chapter{\bibname}%
  \@mainmattertrue
}
\newenvironment{acknowledgements}{%
  \ifustc@bachelor
    \ustc@chapter{\ustc@acknowledgementsname}%
    \ifustc@tocloaded
      需要将致谢的位置调整到目录前。\par
    \fi
  \else
    \chapter{\ustc@acknowledgementsname}%
  \fi
}{}
\newenvironment{publications}{\chapter{\ustc@publicationsname}}{}
