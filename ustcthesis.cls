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
  [2018/10/06 v3.1.01 USTC thesis template]
\newif\ifustc@doctor
\newif\ifustc@master
\newif\ifustc@bachelor
\newif\ifustc@academic
\newif\ifustc@chinese
\newif\ifustc@numerical
\newif\ifustc@super
\newif\ifustc@pdf
\newif\ifustc@colorlogo
\newif\ifustc@arabic
\DeclareOption{doctor}{\ustc@doctortrue\ustc@masterfalse\ustc@bachelorfalse}
\DeclareOption{master}{\ustc@doctorfalse\ustc@mastertrue\ustc@bachelorfalse}
\DeclareOption{bachelor}{\ustc@doctorfalse\ustc@masterfalse\ustc@bachelortrue}
\DeclareOption{academic}{\ustc@academictrue}
\DeclareOption{professional}{\ustc@academicfalse}
\DeclareOption{chinese}{\ustc@chinesetrue}
\DeclareOption{english}{\ustc@chinesefalse\ustc@arabictrue}
\DeclareOption{print}{\ustc@pdffalse}
\DeclareOption{pdf}{\ustc@pdftrue}
\DeclareOption{super}{\ustc@numericaltrue\ustc@supertrue}
\DeclareOption{numbers}{\ustc@numericaltrue\ustc@superfalse}
\DeclareOption{authoryear}{\ustc@numericalfalse}
\DeclareOption{colorlogo}{\ustc@colorlogotrue}
\DeclareOption{bwlogo}{\ustc@colorlogofalse}
\DeclareOption{arabic}{\ustc@arabictrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ExecuteOptions{doctor,academic,chinese,print,colorlogo,super}
\ProcessOptions\relax
\newif\ifustc@graduate
\ifustc@bachelor
  \ustc@graduatefalse
\else
  \ustc@graduatetrue
\fi
\ifustc@chinese
  \PassOptionsToClass{scheme=chinese}{ctexbook}
\else
  \PassOptionsToClass{scheme=plain}{ctexbook}
\fi
\ifustc@pdf
  \PassOptionsToClass{oneside}{book}
\fi
\PassOptionsToPackage{quiet}{xeCJK}
\LoadClass[UTF8,a4paper,openany,zihao=-4]{ctexbook}[2016/05/16]
\@ifclasslater{ctexbook}{2016/05/16}{}{
  \ClassError{ustcthesis}{%
    This template requires TeX Live\MessageBreak 2016 or later version}{}
}
\RequirePackage{amsmath}
\RequirePackage{unicode-math}
\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{color}
\RequirePackage[perpage]{footmisc}
\RequirePackage{caption}
\RequirePackage{calc}
\ifustc@numerical
  \PassOptionsToPackage{sort&compress}{natbib}
\fi
\RequirePackage{url}
\RequirePackage{natbib}
\newcommand\ustc@strifeq{\csname str_if_eq_x:nnTF\endcsname}
\newcommand\ustc@fontset{\csname g__ctex_fontset_tl\endcsname}
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
    Please switch to a high-quality font set
  }
}{
  \setmainfont{Times New Roman}
  \setsansfont{Arial}
  \ustc@strifeq{\ustc@fontset}{mac}{
    \setmonofont[Scale=MatchLowercase]{Menlo}
  }{
    \setmonofont[Scale=MatchLowercase]{Courier New}
  }
}
\ustc@strifeq{\ustc@fontset}{mac}{
  \setCJKmainfont[
       UprightFont = * Light,
          BoldFont = * Bold,
        ItalicFont = Kaiti SC,
    BoldItalicFont = Kaiti SC Bold,
  ]{Songti SC}
  \setCJKsansfont[BoldFont=* Medium]{Heiti SC}
  \setCJKfamilyfont{zhsong}[
       UprightFont = * Light,
          BoldFont = * Bold,
  ]{Songti SC}
  \setCJKfamilyfont{zhhei}[BoldFont=* Medium]{Heiti SC}
  \setCJKfamilyfont{zhkai}[BoldFont=* Bold]{Kaiti SC}
}{
  \xeCJKsetup{EmboldenFactor=2}
  \ustc@strifeq{\ustc@fontset}{windows}{
    \IfFileExists{C:/bootfont.bin}{
      \setCJKmainfont[AutoFakeBold=2,ItalicFont=KaiTi_GB2312]{SimSun}
    }{
      \setCJKmainfont[AutoFakeBold=2,ItalicFont=KaiTi]{SimSun}
      % \setCJKfamilyfont{zhkai}[AutoFakeBold=true]{KaiTi}
    }
    \setCJKsansfont[AutoFakeBold=2]{SimHei}
    \setCJKfamilyfont{zhsong}[AutoFakeBold=2]{SimSun}
    \setCJKfamilyfont{zhhei}[AutoFakeBold=2]{SimHei}
  }{
    \ustc@strifeq{\ustc@fontset}{adobe}{
      \setCJKmainfont[
        AutoFakeBold = 2,
        ItalicFont   = AdobeKaitiStd-Regular,
      ]{AdobeSongStd-Light}
      \setCJKsansfont[AutoFakeBold=2]{AdobeHeitiStd-Regular}
      \setCJKfamilyfont{zhsong}[AutoFakeBold=2]{AdobeSongStd-Light}
      \setCJKfamilyfont{zhhei}[AutoFakeBold=2]{AdobeHeitiStd-Regular}
    }{}
  }
}
\unimathsetup{
  math-style = ISO,
  bold-style = ISO,
  nabla      = upright,
  partial    = upright,
}
\newif\ifustc@stixtwo
\newif\ifustc@xitsnew
\@ifpackagelater{fontspec}{2017/01/20}{
  \IfFontExistsTF{STIX2Math.otf}{
    \ustc@stixtwotrue
  }{}
  \IfFontExistsTF{XITS-Regular.otf}{
    \ustc@xitsnewtrue
  }{}
}{}
\ifustc@stixtwo
  \setmathfont[StylisticSet=8]{STIX2Math.otf}
  \setmathfont[range={scr,bfscr},StylisticSet=1]{STIX2Math.otf}
  \ifustc@xitsnew
    \setmathfont[range={\partial,\lbrace,\rbrace}]{XITSMath-Regular.otf}
  \else
    \setmathfont[range={\partial,\lbrace,\rbrace}]{xits-math.otf}
  \fi
\else
  \ifustc@xitsnew
    \setmathfont[
      Extension    = .otf,
      BoldFont     = XITSMath-Bold,
      StylisticSet = 8,
    ]{XITSMath-Regular}
    \setmathfont[range={cal,bfcal},StylisticSet=1]{XITSMath-Regular.otf}
  \else
    \setmathfont[
      Extension    = .otf,
      BoldFont     = *bold,
      StylisticSet = 8,
    ]{xits-math}
    \setmathfont[range={cal,bfcal},StylisticSet=1]{xits-math.otf}
  \fi
\fi
\ustc@strifeq{\ustc@fontset}{mac}{
  \newfontfamily\ustc@circlefont{Songti SC Light}
}{
  \ustc@strifeq{\ustc@fontset}{windows}{
    \newfontfamily\ustc@circlefont{SimSun}
  }{
    \ifustc@xitsnew
      \newfontfamily\ustc@circlefont{XITS-Regular.otf}
    \else
      \newfontfamily\ustc@circlefont{xits-regular.otf}
    \fi
  }
}
\newdimen\bp@
\bp@=1bp
\ifustc@graduate
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
\else
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
\fi
\linespread{1}\selectfont
\newcommand\ustc@universityname{中国科学技术大学}
\newcommand\ustc@enuniversityname{University of Science and Technology of China}
\ifustc@chinese
  \renewcommand\listfigurename{插图清单}
  \renewcommand\listtablename{表格清单}
  \newcommand\ustc@acknowledgementsname{致谢}
  \newcommand\ustc@publicationsname{在读期间发表的学术论文与取得的研究成果}
  \newcommand\ustc@notationname{符号说明}
\else
  \renewcommand\figurename{Fig.}
  \newcommand\ustc@acknowledgementsname{Acknowledgements}
  \newcommand\ustc@publicationsname{Publications}
  \newcommand\ustc@notationname{Notation}
\fi
\geometry{
  paper      = a4paper,
  vmargin    = 2.54cm,
  hmargin    = 3.17cm,
  headheight = 0.8cm,
  headsep    = 0.24cm,
  footskip   = 0.79cm,
}
\ifustc@graduate
  \newcommand\ustc@header@font{\fontsize{10.5\bp@}{12\bp@}\selectfont}
  \newcommand\ustc@header{\leftmark}
\else
  \newcommand\ustc@header@font{\fontsize{9\bp@}{12\bp@}\selectfont}
  \newcommand\ustc@header{\ustc@universityname{}本科毕业论文}
\fi
\newcommand\ustc@head{%
  \vbox to\headheight{%
    \hfil\ustc@header@font\ustc@header\strut\hfil
    \hrule\@height 0.4\p@\@width\textwidth
    \vfil
  }%
}
\newcommand\ustc@foot{\hfil\ustc@header@font\thepage\hfil}
\def\ps@plain{%
  \def\@oddhead{\ustc@head}%
  \def\@oddfoot{\ustc@foot}%
  \let\@evenhead\@oddhead
  \let\@evenfoot\@oddfoot
  \let\@mkboth\markboth
}
\ifustc@graduate
  \@ifclasslater{ctexbook}{2016/09/21}{
    \def\chaptermark#1{%
      \markboth{%
        \CTEXifname{\CTEXthechapter\CTEX@chapter@aftername}{}%
        \ustc@spacetitle{#1}%
      }{}%
    }
  }{
    \def\chaptermark#1{%
      \markboth{%
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
            \ifodd\CTEX@chapter@numbering
              \CTEXthechapter\CTEX@chapter@aftername
            \fi
          \fi
        \fi
        \ustc@spacetitle{#1}%
      }{}%
    }
  }
\else
  \let\chaptermark\@gobble
\fi
\let\sectionmark\@gobble
\pagestyle{plain}
\def\ps@headings{%
  \def\@oddhead{\ustc@head}%
  \let\@evenhead\@oddhead
  \let\@oddfoot\@empty
  \let\@evenfoot\@empty
  \let\@mkboth\markboth
}
\def\ps@none{}
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
  \hbox{}\thispagestyle{empty}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
\renewcommand\frontmatter{%
  \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{Roman}%
  \ifustc@graduate
    \pagestyle{plain}%
  \else
    \pagestyle{headings}%
  \fi
}
\renewcommand\mainmatter{%
  \ifustc@graduate
    \cleardoublepage
    \pagenumbering{arabic}%
  \else
    \clearpage
  \fi
  \pagestyle{plain}%
  \@mainmattertrue}
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
\ustc@define@term{professionaltype}{专业学位类型}
\ustc@define@term{secretlevel}{}
\ustc@define@term{secretyear}{}
\ustc@define@term{entitle}{Title}
\ustc@define@term{enauthor}{XXX}
\ustc@define@term{enmajor}{XXX}
\ustc@define@term{ensupervisor}{Prof. XXX}
\ustc@define@term{encosupervisor}{}
\ustc@define@term{endate}{\CTEX@todayold}
\ustc@define@term{enprofessionaltype}{Professional degree type}
\ustc@define@term{ensecretlevel}{}
\ustc@define@term{keywords}{}
\ustc@define@term{enkeywords}{}
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
\ifustc@academic
  \newcommand\ustc@specialityname{学科专业}
\else
  \ifustc@doctor
    \renewcommand\ustc@thesisname{专业博士学位论文}
  \else
    \renewcommand\ustc@thesisname{专业硕士学位论文}
  \fi
  \ustc@strifeq{\ustc@fontset}{mac}{
    \setCJKfamilyfont{zhli}{Baoli SC}
    \providecommand\lishu{\CJKfamily{zhli}}
  }{
    \ifx\lishu\relax
      \ClassWarningNoLine{ustcthesis}{%
        The lishu font is required.\MessageBreak
        Please configure it manually
      }
    \fi
    \providecommand\lishu{\sffamily}
  }
  \newcommand\ustc@specialityname{专业领域}
\fi
\definecolor{ustcblue}{cmyk}{1,0.8,0,0}
\newcommand\ustc@pdfbookmark{\@gobble}
\renewenvironment{titlepage}{%
  \cleardoublepage
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \else
    \@restonecolfalse\newpage
  \fi
  \thispagestyle{empty}%
}{%
  \if@restonecol\twocolumn \else \newpage \fi
}
\newcommand\ustc@makezhtitle{%
  \begin{titlepage}%
    \ustc@pdfbookmark{封面}%
    \centering
    \parbox[t][0.6cm][t]{\textwidth}{%
      \raggedleft\fangsong\fontsize{14\bp@}{14\bp@}\selectfont
      \null\ustc@secretlevel\par}\par
    \vskip 0.5cm%
    \includegraphics[height=1.3cm]{figures/ustc_logo_text.pdf}\par
    \vskip 0.6cm%
    {\sffamily\fontsize{56\bp@}{56\bp@}\selectfont
      \ustc@thesisname\par}%
    \ifustc@academic
      \vskip 2.0cm%
    \else
      \vskip 0.8cm%
      {\lishu\fontsize{26\bp@}{26\bp@}\selectfont
        （\ustc@professionaltype）\par}%
      \vskip 1.0cm%
    \fi
    \ifustc@colorlogo
      \textcolor{ustcblue}{%
        \includegraphics[height=4.1cm]{figures/ustc_logo_fig.pdf}}%
    \else
      \includegraphics[height=4.1cm]{figures/ustc_logo_fig.pdf}%
    \fi\par
    \vskip 0.9cm%
    \parbox[t][3.5cm][c]{\textwidth}{%
      \centering\sffamily\bfseries\fontsize{26\bp@}{50\bp@}\selectfont
      \ustc@title\par}\par
    \vskip 0.6cm%
    {\fontsize{16\bp@}{31\bp@}\selectfont
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
    \ustc@pdfbookmark{Title page}%
    \centering
    \parbox[t][0.4cm][t]{\textwidth}{%
      \raggedleft\fontsize{14\bp@}{14\bp@}\selectfont
      \null\ustc@ensecretlevel\par}\par
    \vskip 0.5cm%
    {\sffamily\fontsize{20\bp@}{30\bp@}\selectfont
      \ustc@enuniversityname\par}%
    {\sffamily\fontsize{26\bp@}{30\bp@}\selectfont
      \ustc@enthesisname\par}%
    \ifustc@academic\else
      {\fontsize{16\bp@}{32\bp@}\selectfont
        (\ustc@enprofessionaltype)\par}%
    \fi
    \vskip 2.5cm%
    \ifustc@colorlogo
      \textcolor{ustcblue}{%
        \includegraphics[height=4.5cm]{figures/ustc_logo_fig.pdf}}%
    \else
      \includegraphics[height=4.5cm]{figures/ustc_logo_fig.pdf}%
    \fi\par
    \vskip 0.5cm%
    \begin{minipage}[t][4.5cm][c]{\textwidth}%
      \centering\sffamily\bfseries\fontsize{26\bp@}{30\bp@}\selectfont
      \ustc@entitle\par
    \end{minipage}\par
    \vskip 1.6cm%
    {\fontsize{16\bp@}{30\bp@}\selectfont
      \begin{tabular}{@{}l@{}}
        Author:        \ustc@enauthor \\
        Speciality:    \ustc@enmajor \\
        \ustc@supervisorline \\
        Finished time: \ustc@endate
      \end{tabular}\par}%
  \end{titlepage}%
}
\renewcommand\maketitle{%
  \newgeometry{margin=2.54cm}
  \pagenumbering{Alph}%
  \pagestyle{empty}%
  \ustc@makezhtitle
  \ustc@makeentitle
  \restoregeometry
  \pagestyle{plain}%
}
\newcommand\ustc@originality{%
  本人声明所呈交的学位论文，是本人在导师指导下进行研究工作所取得的成果。%
  除已特别加以标注和致谢的地方外，论文中不包含任何他人已经发表或撰写过的%
  研究成果。%
  与我一同工作的同志对本研究所做的贡献均已在论文中作了明确的说明。}
\newcommand\ustc@authorization{%
  作为申请学位的条件之一，学位论文著作权拥有者授权\ustc@universityname{}拥有%
  学位论文的部分使用权，%
  即：学校有权按有关规定向国家有关部门或机构送交论文的复印件和电子版，%
  允许论文被查阅和借阅，可以将学位论文编入《中国学位论文全文数据库》等%
  有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存、汇编学位论文。%
  本人提交的电子文档的内容和纸质论文的内容相一致。\par
  保密的学位论文在解密后也遵守此规定。}
\newcommand\ustc@underline[2][3.2cm]{\underline{\hb@xt@ #1{\hss#2\hss}}}
\newcommand\ustc@checkbox{%
  \makebox[\z@][l]{$\square$}%
  \raisebox{-0.2ex}{\hspace{0.1em}$\checkmark$}%
}
\newcommand\makestatement{%
  \begin{titlepage}%
    \ustc@pdfbookmark{原创性和授权使用声明}%
    \null
    \vskip 0.3cm%
    {\centering\sffamily\fontsize{16\bp@}{32\bp@}\selectfont
      \ustc@universityname{}学位论文原创性声明\par}%
    \vskip 0.7cm%
    \ustc@originality\par
    \vskip 1.3cm%
    作者签名：\ustc@underline{}\hspace{2.7cm}%
    签字日期：\ustc@underline{}\par
    \vskip 1.9cm%
    {\centering\sffamily\fontsize{16\bp@}{32\bp@}\selectfont
      \ustc@universityname{}学位论文授权使用声明\par}%
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
  \end{titlepage}%
}
\ifustc@bachelor
  \renewcommand\makestatement{}
\fi
\setcounter{secnumdepth}{5}
\newcount\ustc@titlelength
\DeclareRobustCommand\ustc@spacetitle[1]{%
  \ustc@titlelength=\csname str_count:N\endcsname{#1}%
  \begingroup
    \ifustc@graduate
      \ifcase\ustc@titlelength
      \or\or
        \ziju{2}%
      \or
        \ziju{1}%
      \or
        \ziju{0.5}%
      \fi
    \else
      \if@mainmatter\else
        \ifcase\ustc@titlelength
        \or\or
          \ziju{1}%
        \or\or
          \ziju{0.5}%
        \fi
      \fi
    \fi
    #1%
  \endgroup
}
\newcommand\ustc@textcircled[1]{%
  \ifnum\value{#1}<21\relax
    {\ustc@circlefont\symbol{\numexpr\value{#1} + "245F\relax}}%
  \else
    \ClassError{ustcthesis}{Cannot display more than 10 footnotes}{}%
  \fi
}
\ctexset{
  chapter = {
    format      = \centering\sffamily\bfseries\fontsize{16\bp@}{26.67\bp@}\selectfont,
    nameformat  = {},
    titleformat = \ustc@spacetitle,
    number      = \thechapter,
    aftername   = \hspace{\ccwd},
    pagestyle   = none,
  },
}
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
      beforeskip = -7\bp@,  % 24bp - 31bp
      afterskip  =  8\bp@,  % 18bp - 10bp
    },
  }
}
\ctexset{
  section = {
    format     = \sffamily\fontsize{14\bp@}{23.33\bp@}\selectfont,
    aftername  = \hspace{\ccwd},
    beforeskip = 24\bp@,
    afterskip  = 6\bp@,
  },
  subsection = {
    format     = \sffamily\fontsize{13\bp@}{21.67\bp@}\selectfont,
    aftername  = \hspace{\ccwd},
    indent     = 2\ccwd,
    beforeskip = 12\bp@,
    afterskip  = 6\bp@,
  },
  subsubsection = {
    format     = \sffamily\fontsize{12\bp@}{20\bp@}\selectfont,
    number     = \arabic{subsubsection},
    aftername  = .\hspace{0.5\ccwd},
    indent     = 2\ccwd,
    beforeskip = \z@,
    afterskip  = \z@,
  },
  paragraph = {
    format     = \rmfamily\fontsize{12\bp@}{20\bp@}\selectfont,
    number     = （\arabic{paragraph}）,
    aftername  = \hspace{0.5\ccwd},
    indent     = 2\ccwd,
    beforeskip = \z@,
    afterskip  = \z@,
    runin      = false,
  },
  subparagraph = {
    format     = \rmfamily\fontsize{12\bp@}{20\bp@}\selectfont,
    number     = \ustc@textcircled{subparagraph},
    aftername  = \hspace{0.5\ccwd},
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
          \fontsize{16\bp@}{29.33\bp@}\selectfont
        \else
          \fontsize{18\bp@}{33\bp@}\selectfont
        \fi
      },
    },
    section = {
      format = \centering\sffamily\fontsize{15\bp@}{27.5\bp@}\selectfont,
    },
    subsection = {
      format    = \sffamily\fontsize{14\bp@}{25.67\bp@}\selectfont,
      indent    = \z@,
    },
    subsubsection = {
      format    = \rmfamily\fontsize{12\bp@}{22\bp@}\selectfont,
      indent    = \ccwd,
    },
    paragraph = {
      format    = \rmfamily\fontsize{12\bp@}{22\bp@}\selectfont,
      aftername = {},
      indent    = \ccwd,
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
\NewDocumentCommand\ustc@chapter{o m}{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \IfValueTF{#1}{%
    \ustc@pdfbookmark{#1}%
    \chaptermark{#1}%
  }{%
    \ustc@pdfbookmark{#2}%
    \chaptermark{#2}%
  }%
  \chapter*{#2}}
\newenvironment{abstract}{%
  \ifustc@graduate
    \ustc@chapter{摘要}%
  \else
    \chapter{中文内容摘要}%
    \ifustc@tocloaded\else
      摘要应置于目录后。\par
    \fi
  \fi
}{
  \par\null\par\noindent\hangindent=4\ccwd\relax
  \textbf{关键词}：\ustc@keywords
}
\newenvironment{enabstract}{%
  \ifustc@graduate
    \ustc@chapter[Abstract]{ABSTRACT}%
  \else
    \chapter[英文内容摘要]{Abstract}%
  \fi
}{
  \par\null\par\noindent\hangindent=5.3em\relax
  \textbf{Key Words}: \ustc@enkeywords
}
\newif\ifustc@tocloaded
\renewcommand\tableofcontents{%
  \ifustc@bachelor
    \cleardoublepage
    \pagenumbering{arabic}%
    \pagestyle{plain}%
    \ustc@tocloadedtrue
  \fi
  \ustc@chapter{\contentsname}%
  \@starttoc{toc}%
}
\newcommand\ustc@patchcmd{\csname ctex_patch_cmd:Nnn\endcsname}
\@ifclasslater{ctexbook}{2016/10/25}{
  \def\CTEXnumberline#1{%
    \CTEXifname{%
      \protect\numberline{\@nameuse{CTEXthe#1}\@nameuse{CTEX@#1@aftername}}%
    }{}%
  }
  \ctexset{chapter/tocline=\CTEXnumberline{#1}#2}
}{
  \ustc@patchcmd{\@chapter}{%
    \CTEXthechapter\hspace{0.3em}%
  }{%
    \@nameuse{CTEXthechapter}\@nameuse{CTEX@chapter@aftername}%
  }
  \def\@sect#1#2#3#4#5#6[#7]#8{%
    \ifnum #2>\c@secnumdepth
      \let\@svsec\@empty
    \else
      \ifodd \csname CTEX@#1@numbering\endcsname
        \refstepcounter{#1}%
        \protected@edef\@svsec{\@seccntformat{#1}\relax}%
      \else
        \CTEX@makeheadinganchor
        \let\@svsec\@empty
      \fi
    \fi
    \unless \ifodd \CTEX@runin
      \begingroup
        #6{%
          \@hangfrom{\hskip\glueexpr #3\relax\@svsec}%
          \interlinepenalty \@M
          \csname CTEX@#1@titleformat\endcsname{#8}%
          \csname CTEX@#1@aftertitle\endcsname}%
      \endgroup
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \ifodd \csname CTEX@#1@numbering\endcsname
            \protect\numberline{\csname CTEXthe#1\endcsname
              \csname CTEX@#1@aftername\endcsname
            }%
          \fi
        \fi
        #7}%
    \else
      \def\@svsechd{%
      #6{\hskip\glueexpr #3\relax
        \@svsec
        \csname CTEX@#1@titleformat\endcsname{#8}%
        \csname CTEX@#1@aftertitle\endcsname}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \ifodd \csname CTEX@#1@numbering\endcsname
            \protect\numberline{\csname CTEXthe#1\endcsname
              \csname CTEX@#1@aftername\endcsname
            }%
          \fi
        \fi
        #7}}%
    \fi
    \@xsect{#5}}
}
\newcommand\ustc@leaders{%
  \leaders\hbox{$\m@th \mkern \@dotsep mu\hbox{$\cdot$}\mkern \@dotsep mu$}%
}
\def\ustc@dottedtocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \setlength\@tempdima{1em}%
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#3#4}\nobreak
     \ustc@leaders\hfill \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
     \par}%
  \fi}
\def\numberline#1{\settowidth{\@tempdima}{#1}#1}
\ifustc@graduate
  \renewcommand*\l@chapter[2]{%
    \ifnum \c@tocdepth >\m@ne
      \addpenalty{-\@highpenalty}%
      \vskip 6\p@ \@plus\p@
      \setlength\@tempdima{1em}%
      \begingroup
        \parindent \z@ \rightskip \@pnumwidth
        \parfillskip -\@pnumwidth
        \leavevmode
        \advance\leftskip\@tempdima
        \hskip -\leftskip
        {\fontsize{14\bp@}{20\bp@}\selectfont#1}\nobreak
        \ustc@leaders\hfil \nobreak
        \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #2}\par
        \penalty\@highpenalty
      \endgroup
    \fi}
  \renewcommand*\l@section{%
    \ustc@dottedtocline{1}{\ccwd}{\fontsize{12\bp@}{20\bp@}\selectfont}%
  }
  \renewcommand*\l@subsection{%
    \ustc@dottedtocline{2}{2\ccwd}{\fontsize{10.5\bp@}{20\bp@}\selectfont}%
  }
  \renewcommand*\l@subsubsection{%
    \ustc@dottedtocline{3}{3\ccwd}{\fontsize{10.5\bp@}{20\bp@}\selectfont}%
  }
  \renewcommand*\l@paragraph{%
    \ustc@dottedtocline{4}{4\ccwd}{\fontsize{10.5\bp@}{20\bp@}\selectfont}%
  }
  \renewcommand*\l@subparagraph{%
    \ustc@dottedtocline{5}{5\ccwd}{\fontsize{10.5\bp@}{20\bp@}\selectfont}%
  }
\else
  \renewcommand*\l@chapter[2]{%
    \ifnum \c@tocdepth >\m@ne
      \addpenalty{-\@highpenalty}%
      \vskip \z@ \@plus.2\p@
      \setlength\@tempdima{1em}%
      \begingroup
        \parindent \z@ \rightskip \@pnumwidth
        \parfillskip -\@pnumwidth
        \leavevmode
        \advance\leftskip\@tempdima
        \hskip -\leftskip
        #1\nobreak
        \ustc@leaders\hfil \nobreak
        \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #2}\par
        \penalty\@highpenalty
      \endgroup
    \fi}
  \renewcommand*\l@section{%
    \ustc@dottedtocline{1}{\ccwd}{\normalsize}%
  }
  \renewcommand*\l@subsection{%
    \ustc@dottedtocline{2}{2\ccwd}{\normalsize}%
  }
  \renewcommand*\l@subsubsection{%
    \ustc@dottedtocline{3}{3\ccwd}{\normalsize}%
  }
  \renewcommand*\l@paragraph{%
    \ustc@dottedtocline{4}{4\ccwd}{\normalsize}%
  }
  \renewcommand*\l@subparagraph{%
    \ustc@dottedtocline{5}{5\ccwd}{\normalsize}%
  }
\fi
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
  \thispagestyle{\CTEX@chapter@pagestyle}%
  \global\@topnum\z@
  \@afterindenttrue
  \ifustc@bachelor
    \ifustc@addtocspace
      \addtocontents{toc}{\protect\addvspace{12\bp@}}%
    \fi
  \fi
  \secdef\@chapter\@schapter
}
\renewcommand\listoffigures{%
  \ifustc@graduate
    \cleardoublepage
  \fi
  \ustc@chapter{\listfigurename}%
  \@starttoc{lof}%
}
\renewcommand\listoftables{%
  \ifustc@graduate
    \cleardoublepage
  \fi
  \ustc@chapter{\listtablename}%
  \@starttoc{lot}%
}
\renewcommand*\l@figure{\ustc@dottedtocline{1}{\ccwd}{\normalsize}}
\let\l@table\l@figure
\newenvironment{notation}{%
  \ifustc@graduate\cleardoublepage\else\clearpage\fi
  \pagestyle{headings}%
  \ustc@chapter{\ustc@notationname}%
}{%
  \clearpage\pagestyle{plain}%
}%
\setlength{\parskip}{\z@ \@plus .2\p@}
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
\renewcommand\thefootnote{\ustc@textcircled{footnote}}
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
  \parsep \z@ \@plus .2\p@
  \topsep \z@ \@plus .2\p@
  \itemsep\z@ \@plus .2\p@
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
\renewcommand\topfraction{.85}
\renewcommand\bottomfraction{.7}
\renewcommand\textfraction{.15}
\renewcommand\floatpagefraction{.66}
\renewcommand\dbltopfraction{.66}
\renewcommand\dblfloatpagefraction{.66}
\setcounter{topnumber}{9}
\setcounter{bottomnumber}{9}
\setcounter{totalnumber}{20}
\setcounter{dbltopnumber}{9}
\def\fps@figure{htbp}
\def\fps@table{htbp}
\DeclareCaptionLabelSeparator{zhspace}{\hspace{\ccwd}}
\captionsetup{
  format   = hang,
  font     = small,
  labelsep = zhspace,
}
\ifustc@graduate
  \captionsetup{font+=bf}
\fi
\captionsetup[figure]{
  aboveskip = 6\bp@,
  belowskip = {12\bp@-\intextsep},
}
\captionsetup[table]{
  aboveskip = 6\bp@,
  belowskip = 6\bp@,
}
\newcommand\note[1]{%
  \begingroup
  \captionsetup{
    format        = plain,
    font          = small,
    justification = justified,
    margin        = 2\ccwd,
    position      = bottom,
  }%
  \caption*{#1}%
  \endgroup
}
\ifustc@chinese
  \def\mathellipsis{\cdots}
\fi
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
  \renewcommand\Re{\operatorname{Re}}%
  \renewcommand\Im{\operatorname{Im}}%
}
\AtBeginDocument{%
  \renewcommand\nabla{\mbfnabla}%
}
\newcommand\bm{\symbf}
\renewcommand\boldsymbol{\symbf}
\newcommand\square{\mdlgwhtsquare}
\newcommand\upe{\symup{e}}
\newcommand\upi{\symup{i}}
\newcommand\dif{\mathop{}\!\mathrm{d}}
\DeclareMathOperator*{\argmax}{arg\,max}
\DeclareMathOperator*{\argmin}{arg\,min}
\newcommand\bibstyle@super{\bibpunct{[}{]}{,}{s}{,}{\textsuperscript{,}}}
\newcommand\bibstyle@numbers{\bibpunct{[}{]}{,}{n}{,}{,}}
\newcommand\bibstyle@authoryear{\bibpunct{(}{)}{;}{a}{,}{,}}
\ifustc@graduate
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
\else
  \ifustc@super
    \citestyle{super}
  \else
    \citestyle{numbers}
  \fi
  \bibliographystyle{ustcthesis-bachelor}
\fi
\ustc@patchcmd{\NAT@citexnum}{%
  \@ifnum{\NAT@ctype=\z@}{%
    \if*#2*\else\NAT@cmt#2\fi
  }{}%
  \NAT@mbox{\NAT@@close}%
}{%
  \NAT@mbox{\NAT@@close}%
  \@ifnum{\NAT@ctype=\z@}{%
    \if*#2*\else\textsuperscript{#2}\fi
  }{}%
}
\renewcommand\NAT@citesuper[3]{\ifNAT@swa
\if*#2*\else#2\NAT@spacechar\fi
\unskip\kern\p@\textsuperscript{\NAT@@open#1\NAT@@close\if*#3*\else#3\fi}%
   \else #1\fi\endgroup}
\renewcommand\NAT@citenum%
    [3]{\ifNAT@swa\NAT@@open\if*#2*\else#2\NAT@spacechar\fi
        #1\NAT@@close\if*#3*\else\textsuperscript{#3}\fi\else#1\fi\endgroup}
\ustc@patchcmd{\NAT@citex}{%
  \if*#2*\else\NAT@cmt#2\fi
  \if\relax\NAT@date\relax\else\NAT@@close\fi
}{%
  \if\relax\NAT@date\relax\else\NAT@@close\fi
  \if*#2*\else\textsuperscript{#2}\fi
}
\renewcommand\NAT@cite%
    [3]{\ifNAT@swa\NAT@@open\if*#2*\else#2\NAT@spacechar\fi
        #1\NAT@@close\if*#3*\else\textsuperscript{#3}\fi\else#1\fi\endgroup}
\ustc@patchcmd{\NAT@citexnum}{%
  \ifx\NAT@last@yr\relax
    \def@NAT@last@yr{\@citea}%
  \else
    \def@NAT@last@yr{--\NAT@penalty}%
  \fi
}{%
  \def@NAT@last@yr{-\NAT@penalty}%
}
\DeclareRobustCommand\inlinecite{\@inlinecite}
\def\@inlinecite#1{\begingroup\let\@cite\NAT@citenum\citep{#1}\endgroup}
\ifustc@graduate
  \renewcommand\bibfont{\fontsize{10.5\bp@}{20\bp@}\selectfont}
\fi
\setlength{\bibsep}{\z@}
\setlength{\bibhang}{2\ccwd}
\renewcommand\@biblabel[1]{[#1]\hfill}
\renewcommand\bibsection{%
  \@mainmatterfalse
  \chapter{\bibname}%
  \@mainmattertrue
}
\newenvironment{acknowledgements}{%
  \ifustc@graduate
    \chapter{\ustc@acknowledgementsname}%
  \else
    \ustc@chapter{\ustc@acknowledgementsname}%
    \ifustc@tocloaded
      致谢应置于目录前。\par
    \fi
  \fi
}{}
\newenvironment{publications}{\chapter{\ustc@publicationsname}}{}
\newcommand\ustc@atendpackage{\csname ctex_at_end_package:nn\endcsname}
\ustc@atendpackage{hyperref}{
  \hypersetup{
    bookmarksnumbered  = true,
    bookmarksopen      = true,
    bookmarksopenlevel = 1,
    linktoc            = all,
  }
  \ifustc@pdf
    \hypersetup{
      colorlinks = true,
      allcolors  = blue,
    }
  \else
    \hypersetup{hidelinks}
  \fi
  \AtBeginDocument{%
    \ifustc@chinese
      \hypersetup{
        pdftitle  = \ustc@title,
        pdfauthor = \ustc@author,
      }%
    \else
      \hypersetup{
        pdftitle  = \ustc@entitle,
        pdfauthor = \ustc@enauthor,
      }%
    \fi
  }
  \newcounter{ustc@bookmarknumber}
  \renewcommand\ustc@pdfbookmark[1]{%
    \phantomsection
    \stepcounter{ustc@bookmarknumber}%
    \pdfbookmark[0]{#1}{ustcchapter.\theustc@bookmarknumber}%
  }
  \pdfstringdefDisableCommands{
    \let\\\@empty
    \let\hspace\@gobble
  }
  \ifustc@chinese
    \def\equationautorefname~#1\null{公式~(#1)\null}
    \def\footnoteautorefname{脚注}
    \def\itemautorefname~#1\null{第~#1~项\null}
    \def\figureautorefname{图}
    \def\tableautorefname{表}
    \def\partautorefname~#1\null{第~#1~部分\null}
    \def\appendixautorefname{附录}
    \def\chapterautorefname~#1\null{第~#1~章\null}
    \def\sectionautorefname~#1\null{第~#1~节\null}
    \def\subsectionautorefname~#1\null{第~#1~小节\null}
    \def\subsubsectionautorefname~#1\null{第~#1~小小节\null}
    \def\paragraphautorefname~#1\null{第~#1~段\null}
    \def\subparagraphautorefname~#1\null{第~#1~小段\null}
    \def\theoremautorefname{定理}
    \def\HyRef@autopageref#1{\hyperref[{#1}]{第~\pageref*{#1} 页}}
  \fi
}
\ustc@atendpackage{amsthm}{
  \newtheoremstyle{ustcplain}
    {}{}
    {}{2\ccwd}
    {\bfseries}{}
    {\ccwd}{}
  \theoremstyle{ustcplain}
  \ifustc@chinese
    \newcommand\ustc@assertionname{断言}
    \newcommand\ustc@axiomname{公理}
    \newcommand\ustc@corollaryname{推论}
    \newcommand\ustc@definitionname{定义}
    \newcommand\ustc@examplename{例}
    \newcommand\ustc@lemmaname{引理}
    \newcommand\ustc@proofname{证明}
    \newcommand\ustc@propositionname{命题}
    \newcommand\ustc@remarkname{注}
    \newcommand\ustc@theoremname{定理}
  \else
    \newcommand\ustc@assertionname{Assertion}
    \newcommand\ustc@axiomname{Axiom}
    \newcommand\ustc@corollaryname{Corollary}
    \newcommand\ustc@definitionname{Definition}
    \newcommand\ustc@examplename{Example}
    \newcommand\ustc@lemmaname{Lemma}
    \newcommand\ustc@proofname{Proof}
    \newcommand\ustc@propositionname{Proposition}
    \newcommand\ustc@remarkname{Remark}
    \newcommand\ustc@theoremname{Theorem}
  \fi
  \newtheorem{theorem}                {\ustc@theoremname}     [chapter]
  \newtheorem{assertion}  [theorem]   {\ustc@assertionname}
  \newtheorem{axiom}      [theorem]   {\ustc@axiomname}
  \newtheorem{corollary}  [theorem]   {\ustc@corollaryname}
  \newtheorem{lemma}      [theorem]   {\ustc@lemmaname}
  \newtheorem{proposition}[theorem]   {\ustc@propositionname}
  \newtheorem{definition}             {\ustc@definitionname}  [chapter]
  \newtheorem{example}                {\ustc@examplename}     [chapter]
  \newtheorem*{remark}                {\ustc@remarkname}
  \renewenvironment{proof}[1][\proofname]{\par
    \pushQED{\qed}%
    \normalfont \topsep6\p@\@plus6\p@\relax
    \trivlist
      \item\relax\hskip2\ccwd
      \textbf{#1}
      \hskip\ccwd\ignorespaces
    }{%
    \popQED\endtrivlist\@endpefalse
  }
  \renewcommand\proofname\ustc@proofname
}
\ustc@atendpackage{algorithm2e}{
  \ifustc@chinese
    \renewcommand\listalgorithmcfname{算法索引}
    \renewcommand\algorithmcfname{算法}
  \else
    \renewcommand\listalgorithmcfname{List of Algorithms}
    \renewcommand\algorithmcfname{Algorithm}
  \fi
  \let\ustc@save@listofalgorithms=\listofalgorithms
  \renewcommand\listofalgorithms{%
    \cleardoublepage
    \ustc@save@listofalgorithms}
}
\ustc@atendpackage{nomencl}{
  \let\nomname\ustc@notationname
  \def\thenomenclature{%
    \ifustc@graduate\cleardoublepage\else\clearpage\fi
    \pagestyle{headings}%
    \ustc@chapter{\ustc@notationname}%
    \nompreamble
    \list{}{%
      \labelwidth\nom@tempdim
      \leftmargin\labelwidth
      \advance\leftmargin\labelsep
      \itemsep\nomitemsep
      \let\makelabel\nomlabel}}
  \def\endthenomenclature{%
    \endlist
    \nompostamble
    \clearpage\pagestyle{plain}%
  }
}
\ustc@atendpackage{siunitx}{
  \sisetup{
    group-minimum-digits = 4,
    separate-uncertainty = true,
    inter-unit-product   = \ensuremath{{}\cdot{}},
  }
  \ifustc@chinese
    \sisetup{
      list-final-separator = { 和 },
      list-pair-separator  = { 和 },
      range-phrase         = {～},
    }
  \fi
}
