\NeedsTeXFormat{LaTeX2e}[2017/04/15]
\ProvidesClass{ustcthesis}
  [2020/01/01 v3.2 USTC thesis template]
\newcommand\ustc@error[1]{%
  \ClassError{ustcthesis}{#1}{}%
}
\newcommand\ustc@warning[1]{%
  \ClassWaring{ustcthesis}{#1}%
}
\RequirePackage{iftex}
\ifXeTeX\else
  \ustc@error{XeLaTeX is required to compile this document}
\fi
\RequirePackage{kvdefinekeys}
\RequirePackage{kvsetkeys}
\RequirePackage{kvoptions}
\newcommand\ustcsetup{%
  \kvsetkeys{ustc}%
}
\newcommand\ustc@define@key[1]{%
  \kvsetkeys{ustc@key}{#1}%
}
\kv@set@family@handler{ustc@key}{%
  \@namedef{ustc@#1@@name}{#1}%
  \def\ustc@@default{}%
  \def\ustc@@choices{}%
  \kv@define@key{ustc@value}{name}{%
    \@namedef{ustc@#1@@name}{##1}%
  }%
  \kv@define@key{ustc@value}{code}{%
    \@namedef{ustc@#1@@code}{##1}%
  }%
  \@namedef{ustc@#1@@check}{}%
  \@namedef{ustc@#1@@code}{}%
  \@namedef{ustc@#1@@hook}{%
    \@nameuse{ustc@#1@@code}%
  }%
  \kv@define@key{ustc@value}{choices}{%
    \def\ustc@@choices{##1}%
    \@namedef{ustc@#1@@reset}{}%
    \@namedef{ustc@#1@@check}{%
      \@ifundefined{%
        ifustc@\@nameuse{ustc@#1@@name}@\@nameuse{ustc@\@nameuse{ustc@#1@@name}}%
      }{%
        \ustc@error{Invalid value "#1 = \@nameuse{ustc@\@nameuse{ustc@#1@@name}}"}%
      }%
      \@nameuse{ustc@#1@@reset}%
      \@nameuse{ustc@\@nameuse{ustc@#1@@name}@\@nameuse{ustc@\@nameuse{ustc@#1@@name}}true}%
    }%
  }%
  \kv@define@key{ustc@value}{default}{%
    \def\ustc@@default{##1}%
  }%
  \kvsetkeys{ustc@value}{#2}%
  \@namedef{ustc@\@nameuse{ustc@#1@@name}}{}%
  \kv@set@family@handler{ustc@choice}{%
    \ifx\ustc@@default\@empty
      \def\ustc@@default{##1}%
    \fi
    \expandafter\newif\csname ifustc@\@nameuse{ustc@#1@@name}@##1\endcsname
    \expandafter\g@addto@macro\csname ustc@#1@@reset\endcsname{%
      \@nameuse{ustc@\@nameuse{ustc@#1@@name}@##1false}%
    }%
  }%
  \kvsetkeys@expandafter{ustc@choice}{\ustc@@choices}%
  \expandafter\let\csname ustc@\@nameuse{ustc@#1@@name}\endcsname\ustc@@default
  \expandafter\ifx\csname ustc@\@nameuse{ustc@#1@@name}\endcsname\@empty\else
    \@nameuse{ustc@#1@@check}%
    \@nameuse{ustc@#1@@hook}%
  \fi
  \kv@define@key{ustc}{#1}{%
    \@namedef{ustc@\@nameuse{ustc@#1@@name}}{##1}%
    \@nameuse{ustc@#1@@check}%
    \@nameuse{ustc@#1@@hook}%
  }%
}
\newcommand\ustc@addto[2]{%
  \expandafter\g@addto@macro\csname ustc@#1@@code\endcsname{#2}%
}
\newif\ifustc@degree@graduate
\newcommand\ustc@set@graduate{%
  \ifustc@degree@bachelor
    \ustc@degree@graduatefalse
  \else
    \ustc@degree@graduatetrue
  \fi
}
\ustc@define@key{
  degree = {
    choices = {
      doctor,
      master,
      bachelor,
    },
    default = doctor,
    code    = {\ustc@set@graduate},
  },
  degree-type = {
    name = degree@type,
    choices = {
      academic,
      professional,
    },
    default = academic,
  },
  language = {
    choices = {
      chinese,
      english,
    },
    default = chinese,
  },
  cite-style = {
    name = cite@style,
    choices = {
      super,
      inline,
      authoryear,
    },
  },
  output = {
    choices = {
      print,
      electronic,
    },
    default = print,
  },
  section-style = {
    name = section@style,
    choices = {
      chinese,
      arabic,
    },
    default = chinese,
  },
  badge-color = {
    name = badge@color,
    choices = {
      blue,
      black,
    },
    default = blue,
  },
}
\ifustc@degree@bachelor
  \ifustc@language@english
    \ustcsetup{section-style = arabic}
  \fi
\fi
\ustc@addto{language}{%
  \ifustc@degree@bachelor
    \ifustc@language@english
      \ustcsetup{section-style = arabic}%
    \fi
  \fi
}
\SetupKeyvalOptions{
  family  = ustc,
  prefix  = ustc@,
  setkeys = \kvsetkeys,
}
\DeclareVoidOption{doctor}{\ustcsetup{degree=doctor}}
\DeclareVoidOption{master}{\ustcsetup{degree=master}}
\DeclareVoidOption{bachelor}{\ustcsetup{degree=bachelor}}
\DeclareVoidOption{chinese}{\ustcsetup{language=chinese}}
\DeclareVoidOption{english}{\ustcsetup{language=english}}
\DeclareVoidOption{academic}{\ustcsetup{degree-type=academic}}
\DeclareVoidOption{professional}{\ustcsetup{degree-type=professional}}
\DeclareVoidOption{print}{\ustcsetup{output=print}}
\DeclareVoidOption{pdf}{\ustcsetup{pdf=electronic}}
\newif\ifustc@legacy@cite@style
\DeclareVoidOption{super}{\ustcsetup{cite-style=super}\ustc@legacy@cite@styletrue}
\DeclareVoidOption{numbers}{\ustcsetup{cite-style=inline}\ustc@legacy@cite@styletrue}
\DeclareVoidOption{authoryear}{\ustcsetup{cite-style=authoryear}\ustc@legacy@cite@styletrue}
\DeclareVoidOption{arabic}{\ustcsetup{section-style=arabic}}
\DeclareVoidOption{colorlogo}{\ustcsetup{badge-color=blue}}
\DeclareVoidOption{bwlogo}{\ustcsetup{badge-color=black}}
\PassOptionsToClass{openany}{ctexbook}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessKeyvalOptions*
\ifustc@language@chinese
  \PassOptionsToClass{scheme=chinese}{ctexbook}
\else
  \PassOptionsToClass{scheme=plain}{ctexbook}
\fi
\ifustc@output@electronic
  \PassOptionsToClass{oneside}{book}
\fi
\PassOptionsToPackage{quiet}{xeCJK}
\LoadClass[UTF8,a4paper,zihao=-4]{ctexbook}[2017/04/01]
\@ifclasslater{ctexbook}{2017/04/01}{}{
  \ustc@error{TeX Live 2017 or later version is required}
}
\RequirePackage{amsmath}
\RequirePackage{fontspec}[2017/03/31]
\RequirePackage{unicode-math}
\RequirePackage[driver=xetex]{geometry}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{color}
\RequirePackage{titletoc}
\RequirePackage{caption}
\RequirePackage[perpage]{footmisc}
\RequirePackage{url}
\RequirePackage{calc}
\RequirePackage{natbib}
\RequirePackage{notoccite}
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
  \xeCJKsetwidth{‘’“”}{1em}
}{
  \xeCJKsetup{EmboldenFactor=2}
  \ustc@strifeq{\ustc@fontset}{windows}{
    \IfFileExists{C:/bootfont.bin}{
      \setCJKmainfont[AutoFakeBold,ItalicFont=KaiTi_GB2312]{SimSun}
      \setCJKfamilyfont{zhkai}[AutoFakeBold]{KaiTi_GB2312}
    }{
      \setCJKmainfont[AutoFakeBold,ItalicFont=KaiTi]{SimSun}
      \setCJKfamilyfont{zhkai}[AutoFakeBold]{KaiTi}
    }
    \setCJKsansfont[AutoFakeBold]{SimHei}
    \setCJKfamilyfont{zhsong}[AutoFakeBold]{SimSun}
    \setCJKfamilyfont{zhhei}[AutoFakeBold]{SimHei}
  }{
    \ustc@strifeq{\ustc@fontset}{adobe}{
      \setCJKmainfont[
        AutoFakeBold = true,
        ItalicFont   = AdobeKaitiStd-Regular,
      ]{AdobeSongStd-Light}
      \setCJKsansfont[AutoFakeBold]{AdobeHeitiStd-Regular}
      \setCJKfamilyfont{zhsong}[AutoFakeBold]{AdobeSongStd-Light}
      \setCJKfamilyfont{zhhei}[AutoFakeBold]{AdobeHeitiStd-Regular}
      \setCJKfamilyfont{zhkai}[AutoFakeBold]{AdobeKaitiStd-Regular}
    }{}
  }
}
\unimathsetup{
  math-style = ISO,
  bold-style = ISO,
  nabla      = upright,
  partial    = upright,
}
\newif\ifustc@xits@new
\ustc@xits@newtrue
\IfFontExistsTF{XITS-Regular.otf}{}{
  \ustc@xits@newfalse
}
\ifustc@xits@new
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
\ustc@strifeq{\ustc@fontset}{mac}{
  \newfontfamily\ustc@circlefont{Songti SC Light}
}{
  \ustc@strifeq{\ustc@fontset}{windows}{
    \newfontfamily\ustc@circlefont{SimSun}
  }{
    \ifustc@xits@new
      \newfontfamily\ustc@circlefont{XITS-Regular.otf}
    \else
      \newfontfamily\ustc@circlefont{xits-regular.otf}
    \fi
  }
}
\newdimen\bp@
\bp@=1bp
\ifustc@degree@graduate
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
\newcommand\ustc@setchinese{%
  \xeCJKResetPunctClass
}
\newcommand\ustc@setenglish{%
  \xeCJKDeclareCharClass{HalfLeft}{"2018, "201C}%
  \xeCJKDeclareCharClass{HalfRight}{%
    "00B7, "2019, "201D, "2013, "2014, "2025, "2026, "2E3A%
  }%
}
\newcommand\ustc@setdefaultlanguage{%
  \ifustc@language@chinese
    \ustc@setchinese
  \else
    \ustc@setenglish
  \fi
}
\ifustc@language@chinese
  \renewcommand\listfigurename{插图清单}
  \renewcommand\listtablename{表格清单}
  \newcommand\ustc@acknowledgements@name{致谢}
  \newcommand\ustc@publication@name{在读期间发表的学术论文与取得的研究成果}
  \newcommand\ustc@notation@name{符号说明}
\else
  \renewcommand\figurename{Fig.}
  \newcommand\ustc@acknowledgements@name{Acknowledgements}
  \newcommand\ustc@publication@name{Publications}
  \newcommand\ustc@notation@name{Notation}
\fi
\geometry{
  paper      = a4paper,
  vmargin    = 2.54cm,
  hmargin    = 3.17cm,
  headheight = 0.75cm,
  headsep    = 0.29cm,
  footskip   = 0.79cm,
}
\pagestyle{fancy}
\let\sectionmark\@gobble
\renewcommand\headrulewidth{0.4\p@}
\newcommand\ustc@patchcmd{\csname ctex_patch_cmd:Nnn\endcsname}
\ifustc@degree@graduate
  \newcommand\ustc@hf@font{\fontsize{10.5\bp@}{12\bp@}\selectfont}
  \newcommand\ustc@header{\leftmark}
  \ustc@patchcmd\chaptermark{\MakeUppercase}{}
  \ustc@patchcmd\chaptermark{#1}{\ustc@spacetitle{#1}}
\else
  \newcommand\ustc@hf@font{\fontsize{9\bp@}{12\bp@}\selectfont}
  \newcommand\ustc@header{中国科学技术大学本科毕业论文}
  \let\chaptermark\@gobble
\fi
\fancypagestyle{plain}{%
  \fancyhf{}%
  \fancyhead[C]{\ustc@hf@font\ustc@header}%
  \fancyfoot[C]{\ustc@hf@font\thepage}%
}
\pagestyle{plain}
\fancypagestyle{headings}{\fancyfoot{}}
\def\ps@none{}
\ctexset{chapter/pagestyle=none}
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
  \hbox{}\thispagestyle{empty}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
\renewcommand\frontmatter{%
  \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{Roman}%
  \ifustc@degree@graduate
    \pagestyle{plain}%
  \else
    \pagestyle{headings}%
  \fi
}
\renewcommand\mainmatter{%
  \ifustc@degree@graduate
    \cleardoublepage
    \pagenumbering{arabic}%
  \else
    \clearpage
  \fi
  \pagestyle{plain}%
  \@mainmattertrue}
\ustc@define@key{
  title = {
    default = {论文题目},
  },
  title* = {
    default = {Title},
    name    = title@en,
  },
  author = {
    default = {作者姓名},
  },
  author* = {
    default = {Author Name},
    name    = author@en,
  },
  speciality = {
    default = {专业},
  },
  speciality* = {
    default = {Speciality},
    name    = speciality@en,
  },
  supervisor = {
    default = {导师姓名},
  },
  supervisor* = {
    default = {Supervisor Name},
    name    = supervisor@en,
  },
  date = {
    default = {\the\year-\two@digits{\month}-\two@digits{\day}},
  },
  professional-type = {
    name = professional@type,
  },
  professional-type* = {
    name = professional@type@en,
  },
  secret-level = {
    name    = secret@level,
  },
  secret-level* = {
    name    = secret@level@en,
  },
  secret-year = {
    name    = secret@year,
  },
  keywords,
  keywords* = {
    name    = keywords@en,
  },
}
\newcommand\ustc@clist@count[1]{%
  \csname clist_count:N\endcsname{#1}%
}
\newcommand\ustc@clist@use[2]{%
  \csname clist_use:Nn\endcsname{#1}{#2}%
}
\newcommand\ustc@supervisor@names{%
  \ustc@clist@use{\ustc@supervisor}{\quad}
}
\newcounter{ustc@count}
\newcommand\ustc@supervisor@en@line{%
  \setcounter{ustc@count}{\ustc@clist@count{\ustc@supervisor@en}}%
  \ifnum\c@ustc@count>1\relax
    Supervisors:%
  \else
    Supervisor:%
  \fi
  \space\ustc@clist@use{\ustc@supervisor@en}{, }%
}
\newcommand\ustc@format@date[2]{%
  \edef\ustc@@date{#2}%
  \def\ustc@@process@date##1-##2-##3\@nil{%
    #1{##1}{##2}{##3}%
  }%
  \expandafter\ustc@@process@date\ustc@@date\@nil
}
\newcommand\ustc@date@format@zh[3]{\zhdigits{#1}年\zhnumber{#2}月\zhnumber{#3}日}
\newcommand\ustc@date@month[1]{%
  \ifcase\number#1\or
    January\or February\or March\or April\or May\or June\or
    July\or August\or September\or October\or November\or December%
  \fi
}
\newcommand\ustc@date@format@en[3]{\ustc@date@month{#2} \number#3, #1}
\newcommand\ustc@date@zh{\ustc@format@date{\ustc@date@format@zh}{\ustc@date}}
\newcommand\ustc@date@en{\ustc@format@date{\ustc@date@format@en}{\ustc@date}}
\def\ustc@define@term#1#2{%
  \expandafter\gdef\csname #1\endcsname##1{%
    \ustcsetup{#2 = {##1}}%
  }%
}
\ustc@define@term{title}{title}
\ustc@define@term{entitle}{title*}
\ustc@define@term{author}{author}
\ustc@define@term{enauthor}{author*}
\ustc@define@term{major}{speciality}
\ustc@define@term{enmajor}{speciality*}
\ustc@define@term{supervisor}{supervisor}
\ustc@define@term{ensupervisor}{supervisor*}
\gdef\cosupervisor#1{%
  \g@addto@macro\ustc@supervisor{, #1}%
}
\gdef\encosupervisor#1{%
  \g@addto@macro\ustc@supervisor@en{, #1}%
}
\gdef\date#1{\renewcommand\ustc@date@zh{#1}}
\gdef\endate#1{\renewcommand\ustc@date@en{#1}}
\ustc@define@term{professionaltype}{professional-type}
\ustc@define@term{enprofessionaltype}{professional-type*}
\ustc@define@term{secretlevel}{secret-level}
\ustc@define@term{ensecretlevel}{secret-level*}
\ustc@define@term{secretyear}{secret-year}
\gdef\keywords#1{\renewcommand\ustc@keywords@text{#1}}
\gdef\enkeywords#1{\renewcommand\ustc@keywords@en@text{#1}}
\ifustc@degree@doctor
  \newcommand\ustc@thesis@name{博士学位论文}
  \newcommand\ustc@thesis@name@en{A dissertation for doctor's degree}
\else
  \ifustc@degree@master
    \newcommand\ustc@thesis@name{硕士学位论文}
    \newcommand\ustc@thesis@name@en{A dissertation for master's degree}
  \else
    \newcommand\ustc@thesis@name{学士学位论文}
    \newcommand\ustc@thesis@name@en{A dissertation for bachelor's degree}
  \fi
\fi
\ifustc@degree@type@academic
  \newcommand\ustc@speciality@name{学科专业}
\else
  \ifustc@degree@doctor
    \renewcommand\ustc@thesis@name{专业博士学位论文}
  \else
    \renewcommand\ustc@thesis@name{专业硕士学位论文}
  \fi
  \ustc@strifeq{\ustc@fontset}{mac}{
    \setCJKfamilyfont{zhli}{Baoli SC}
    \providecommand\lishu{\CJKfamily{zhli}}
  }{
    \ifx\lishu\relax
      \ustc@warning{LiSu font is required}
    \fi
    \providecommand\lishu{\sffamily}
  }
  \newcommand\ustc@speciality@name{专业领域}
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
  \ustc@setchinese
  \begin{titlepage}%
    \ustc@pdfbookmark{封面}%
    \centering
    \parbox[t][0.6cm][t]{\textwidth}{%
      \raggedleft\fangsong\fontsize{14\bp@}{14\bp@}\selectfont
      \null\ustc@secret@level\par}\par
    \vskip 0.5cm%
    \includegraphics[height=1.3cm]{figures/ustc-name.pdf}\par
    \vskip 0.6cm%
    {\sffamily\fontsize{56\bp@}{56\bp@}\selectfont
      \ustc@thesis@name\par}%
    \ifustc@degree@type@academic
      \vskip 2.0cm%
    \else
      \vskip 0.8cm%
      {\lishu\fontsize{26\bp@}{26\bp@}\selectfont
        （\ustc@professional@type）\par}%
      \vskip 1.0cm%
    \fi
    \ifustc@badge@color@blue
      \textcolor{ustcblue}{%
        \includegraphics[height=4.1cm]{figures/ustc-badge.pdf}}%
    \else
      \includegraphics[height=4.1cm]{figures/ustc-badge.pdf}%
    \fi\par
    \vskip 0.9cm%
    \parbox[t][3.5cm][c]{\textwidth}{%
      \centering\sffamily\bfseries\fontsize{26\bp@}{50\bp@}\selectfont
      \ustc@title\par}\par
    \vskip 0.6cm%
    {\fontsize{16\bp@}{31\bp@}\selectfont
      \begin{tabular}{@{}l@{\hspace{\ccwd}}l@{}}%
        \textsf{作者姓名：} & \ustc@author \\
        \textsf{\ustc@speciality@name：} & \ustc@speciality \\
        \textsf{导师姓名：} & \ustc@supervisor@names \\
        \textsf{完成时间：} & \ustc@date@zh
      \end{tabular}\par}%
  \end{titlepage}%
  \ustc@setdefaultlanguage
}
\newcommand\ustc@makeentitle{%
  \ustc@setenglish
  \begin{titlepage}%
    \ustc@pdfbookmark{Title page}%
    \centering
    \parbox[t][0.4cm][t]{\textwidth}{%
      \raggedleft\fontsize{14\bp@}{14\bp@}\selectfont
      \null\ustc@secret@level@en\par}\par
    \vskip 0.5cm%
    {\sffamily\fontsize{20\bp@}{30\bp@}\selectfont
      University of Science and Technology of China\par}%
    {\sffamily\fontsize{26\bp@}{30\bp@}\selectfont
      \ustc@thesis@name@en\par}%
    \ifustc@degree@type@academic\else
      {\fontsize{16\bp@}{32\bp@}\selectfont
        (\ustc@professional@type@en)\par}%
    \fi
    \vskip 2.5cm%
    \ifustc@badge@color@blue
      \textcolor{ustcblue}{%
        \includegraphics[height=4.5cm]{figures/ustc-badge.pdf}}%
    \else
      \includegraphics[height=4.5cm]{figures/ustc-badge.pdf}%
    \fi\par
    \vskip 0.5cm%
    \parbox[t][4.5cm][c]{\textwidth}{%
      \centering\sffamily\bfseries\fontsize{26\bp@}{30\bp@}\selectfont
      \ustc@title@en\par}\par
    \vskip 1.6cm%
    {\fontsize{16\bp@}{30\bp@}\selectfont
      \begin{tabular}{@{}l@{}}%
        Author:        \ustc@author@en \\
        Speciality:    \ustc@speciality@en \\
        \ustc@supervisor@en@line \\
        Finished time: \ustc@date@en
      \end{tabular}\par}%
  \end{titlepage}%
  \ustc@setdefaultlanguage
}
\renewcommand\maketitle{%
  \newgeometry{margin=2.54cm}%
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
  作为申请学位的条件之一，学位论文著作权拥有者授权中国科学技术大学拥有%
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
\newcommand\copyrightpage{%
  \begin{titlepage}%
    \ustc@pdfbookmark{原创性和授权使用声明}%
    \null
    \vskip 0.3cm%
    {\centering\sffamily\fontsize{16\bp@}{32\bp@}\selectfont
      中国科学技术大学学位论文原创性声明\par}%
    \vskip 0.7cm%
    \ustc@originality\par
    \vskip 1.3cm%
    作者签名：\ustc@underline{}\hspace{2.7cm}%
    签字日期：\ustc@underline{}\par
    \vskip 1.9cm%
    {\centering\sffamily\fontsize{16\bp@}{32\bp@}\selectfont
      中国科学技术大学学位论文授权使用声明\par}%
    \vskip 0.7cm%
    \ustc@authorization\par
    \vskip 0.6cm%
    \ifx\ustc@secret@level\@empty
      \ustc@checkbox{} 公开\quad
      $\square$ 保密（\ustc@underline[0.85cm]{}年）\par
    \else
      $\square$ 公开\quad
      \ustc@checkbox{} 保密（\ustc@underline[0.8cm]{\ustc@secret@year}年）\par
    \fi
    \vskip 0.5cm%
    作者签名：\ustc@underline{}\hspace{2.7cm}%
    导师签名：\ustc@underline{}\par
    \vskip 0.5cm%
    签字日期：\ustc@underline{}\hspace{2.7cm}%
    签字日期：\ustc@underline{}\par
  \end{titlepage}%
}
\ifustc@degree@bachelor
  \let\copyrightpage\relax
\fi
\let\makestatement\copyrightpage
\setcounter{secnumdepth}{5}
\newcount\ustc@titlelength
\DeclareRobustCommand\ustc@spacetitle[1]{%
  \ustc@titlelength=\csname str_count:N\endcsname{#1}%
  \begingroup
    \ifustc@degree@graduate
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
    \ustc@error{Cannot display more than 10 footnotes}%
  \fi
}
\ctexset{
  chapter = {
    format      = \centering\sffamily\bfseries\fontsize{16\bp@}{26.67\bp@}\selectfont,
    nameformat  = {},
    titleformat = \ustc@spacetitle,
    number      = \thechapter,
    aftername   = \hspace{\ccwd},
    beforeskip  = 24\bp@,
    afterskip   = 18\bp@,
    fixskip     = true,
  },
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
\ifustc@degree@bachelor
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
  \ifustc@section@style@arabic\else
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
\newcommand\ustc@keywords@text{%
  \ustc@clist@use{\ustc@keywords}{；}%
}
\newcommand\ustc@keywords@en@text{%
  \ustc@clist@use{\ustc@keywords@en}{; }%
}
\newenvironment{abstract}{%
  \ustc@setchinese
  \ifustc@degree@graduate
    \ustc@chapter{摘要}%
  \else
    \chapter{中文内容摘要}%
    \ifustc@tocloaded\else
      本科生需要手动将摘要置于目录后。\par
    \fi
  \fi
}{
  \par\null\par\noindent\hangindent=4\ccwd\relax
  \textbf{关键词}：\ustc@keywords@text\par
  \ustc@setdefaultlanguage
}
\newenvironment{enabstract}{%
  \ustc@setenglish
  \ifustc@degree@graduate
    \ustc@chapter[Abstract]{ABSTRACT}%
  \else
    \chapter[英文内容摘要]{Abstract}%
  \fi
}{
  \par\null\par\noindent\hangindent=5.3em\relax
  \textbf{Key Words}: \ustc@keywords@en@text\par
  \ifustc@degree@graduate
    \cleardoublepage
  \fi
  \ustc@setdefaultlanguage
}
\newif\ifustc@tocloaded
\renewcommand\tableofcontents{%
  \ifustc@degree@bachelor
    \cleardoublepage
    \pagenumbering{arabic}%
    \pagestyle{plain}%
    \ustc@tocloadedtrue
  \fi
  \ustc@chapter{\contentsname}%
  \@starttoc{toc}%
}
\newcommand\ustc@leaders{\titlerule*[9\bp@]{\textperiodcentered}}
\ifustc@degree@graduate
  \titlecontents{chapter}
    [\z@]{\addvspace{6\bp@}\fontsize{14\bp@}{20\bp@}\selectfont}
    {\contentspush{\thecontentslabel\unskip\hspace{\ccwd}}}{}
    {\fontsize{12\bp@}{20\bp@}\selectfont\ustc@leaders\contentspage}
  \titlecontents{section}
    [\ccwd]{\fontsize{12\bp@}{20\bp@}\selectfont}
    {\contentspush{\thecontentslabel\hspace{\ccwd}}}{}
    {\fontsize{12\bp@}{20\bp@}\selectfont\ustc@leaders\contentspage}
  \titlecontents{subsection}
    [2\ccwd]{\fontsize{10.5\bp@}{20\bp@}\selectfont}
    {\contentspush{\thecontentslabel\hspace{\ccwd}}}{}
    {\fontsize{12\bp@}{20\bp@}\selectfont\ustc@leaders\contentspage}
\else
  \titlecontents{chapter}
    [\z@]{\normalsize}
    {\contentspush{\thecontentslabel\unskip\hspace{\ccwd}}}{}
    {\ustc@leaders\contentspage}
  \titlecontents{section}
    [\ccwd]{\normalsize}
    {\contentspush{\thecontentslabel\hspace{\ccwd}}}{}
    {\ustc@leaders\contentspage}
  \titlecontents{subsection}
    [2\ccwd]{\normalsize}
    {\contentspush{\thecontentslabel
      \ifustc@section@style@arabic\hspace{\ccwd}\else 、\fi}}{}
    {\ustc@leaders\contentspage}
\fi
\newif\ifustc@addtocspace
\ifustc@degree@bachelor
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
  \ifustc@degree@bachelor
    \ifustc@addtocspace
      \addtocontents{toc}{\protect\addvspace{12\bp@}}%
    \fi
  \fi
  \secdef\@chapter\@schapter
}
\renewcommand\listoffigures{%
  \ifustc@degree@graduate
    \cleardoublepage
  \fi
  \ustc@chapter{\listfigurename}%
  \@starttoc{lof}%
}
\titlecontents{figure}
  [2.3em]{\normalsize}
  {\contentslabel{2.3em}}{}
  {\ustc@leaders\contentspage}
\renewcommand\listoftables{%
  \ifustc@degree@graduate
    \cleardoublepage
  \fi
  \ustc@chapter{\listtablename}%
  \@starttoc{lot}%
}
\titlecontents{table}
  [2.3em]{\normalsize}
  {\contentslabel{2.3em}}{}
  {\ustc@leaders\contentspage}
\newenvironment{notation}{%
  \ifustc@degree@graduate
    \cleardoublepage
    \pagestyle{headings}%
  \fi
  \ustc@chapter{\ustc@notation@name}%
}{%
  \ifustc@degree@graduate
    \clearpage
    \pagestyle{plain}%
  \fi
}%
\newcommand*\notationlabel[1]{#1\hfil}%
\newenvironment{notationlist}[1]{%
  \list{}{%
    \itemsep 3pt%
    \labelwidth #1\relax%
    \labelsep 1em%
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \advance\leftmargin 3em%
    \rightmargin 3em%
    \let\makelabel\notationlabel
  }%
}{%
  \endlist
}
\sloppy
\raggedbottom
\setlength{\parskip}{\z@}
\let\@afterindentfalse\@afterindenttrue
\@afterindenttrue
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
  \parsep 0\p@ \@plus.2\p@
  \topsep 0\p@ \@plus.2\p@
  \itemsep0\p@ \@plus.2\p@
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
\def\fps@figure{htb}
\def\fps@table{htb}
\setlength{\floatsep}{6\bp@}
\setlength{\textfloatsep}{6\bp@}
\setlength{\intextsep}{6\bp@}
\DeclareCaptionLabelSeparator{zhspace}{\hspace{\ccwd}}
\captionsetup{
  format         = hang,
  font           = small,
  labelsep       = zhspace,
  skip           = 6\bp@,
  figureposition = bottom,
  tableposition  = top,
}
\ifustc@degree@graduate
  \captionsetup{font+=bf}
\fi
\captionsetup[figure]{
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
\ifustc@language@chinese
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
\newcommand\bibstyle@super{%
  \bibpunct{[}{]}{,}{s}{,}{\textsuperscript{,}}%
  \gdef\NAT@sort{\@ne}%
  \gdef\NAT@cmprs{\@ne}%
}
\newcommand\bibstyle@inline{%
  \bibpunct{[}{]}{,}{n}{,}{,}%
  \gdef\NAT@sort{\@ne}%
  \gdef\NAT@cmprs{\@ne}%
}
\newcommand\bibstyle@authoryear{%
  \bibpunct{(}{)}{;}{a}{,}{,}%
  \gdef\NAT@sort{\z@}%
  \gdef\NAT@cmprs{\z@}%
}
\ustc@addto{cite-style}{%
  \citestyle{\ustc@cite@style}%
}
\@namedef{bibstyle@ustcthesis-numerical}{\bibstyle@super}
\@namedef{bibstyle@ustcthesis-authoryear}{\bibstyle@authoryear}
\@namedef{bibstyle@ustcthesis-bachelor}{\bibstyle@super}
\DeclareRobustCommand\inlinecite{\@inlinecite}
\def\@inlinecite#1{\begingroup\let\@cite\NAT@citenum\citep{#1}\endgroup}
\let\bibstyle@numbers\bibstyle@inline
\newif\ifustc@bib@style@written
\def\bibliography#1{%
  \ifustc@bib@style@written\else
    \ifustc@degree@bachelor
      \bibliographystyle{ustcthesis-bachelor}%
    \else
      \bibliographystyle{ustcthesis-numerical}%
    \fi
  \fi
  \if@filesw
    \immediate\write\@auxout{\string\bibdata{\zap@space#1 \@empty}}%
  \fi
  \@input@{\jobname.bbl}}
\def\bibliographystyle#1{%
  \ustc@bib@style@writtentrue
  \ifx\@begindocumenthook\@undefined\else
    \expandafter\AtBeginDocument
  \fi
    {\if@filesw
       \immediate\write\@auxout{\string\bibstyle{#1}}%
     \fi}}
\ifustc@legacy@cite@style
  \ifustc@degree@graduate
    \ifustc@cite@style@authoryear
      \citestyle{authoryear}
      \bibliographystyle{ustcthesis-authoryear}
    \else
      \ifustc@cite@style@super
        \citestyle{super}
      \else
        \citestyle{inline}
      \fi
      \bibliographystyle{ustcthesis-numerical}
    \fi
  \else
    \ifustc@cite@style@super
      \citestyle{super}
    \else
      \citestyle{numbers}
    \fi
    \bibliographystyle{ustcthesis-bachelor}
  \fi
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
\ifustc@degree@graduate
  \renewcommand\bibfont{\fontsize{10.5\bp@}{20\bp@}\selectfont}
\fi
\setlength{\bibsep}{0\p@ \@plus.2\p@}
\setlength{\bibhang}{2\ccwd}
\renewcommand\@biblabel[1]{[#1]\hfill}
\renewcommand\bibsection{%
  \@mainmatterfalse
  \chapter{\bibname}%
}
\newenvironment{acknowledgements}{%
  \ifustc@degree@graduate
    \chapter{\ustc@acknowledgements@name}%
  \else
    \ustc@chapter{\ustc@acknowledgements@name}%
    \ifustc@tocloaded
      本科生需要手动将致谢置于目录前。\par
    \fi
  \fi
}{}
\newenvironment{acknowledgments}{%
  \begin{acknowledgements}%
}{%
  \end{acknowledgements}%
}
\newenvironment{publications}{\chapter{\ustc@publication@name}}{}
\newcommand\ustc@atendpackage{\csname ctex_at_end_package:nn\endcsname}
\ustc@atendpackage{hyperref}{
  \hypersetup{
    bookmarksnumbered  = true,
    bookmarksopen      = true,
    bookmarksopenlevel = 1,
    linktoc            = all,
    unicode            = true,
    psdextra           = true,
  }
  \ifustc@output@electronic
    \hypersetup{
      colorlinks = true,
      allcolors  = blue,
    }
  \else
    \hypersetup{hidelinks}
  \fi
  \AtBeginDocument{%
    \ifustc@language@chinese
      \hypersetup{
        pdftitle  = \ustc@title,
        pdfauthor = \ustc@author,
      }%
    \else
      \hypersetup{
        pdftitle  = \ustc@title@en,
        pdfauthor = \ustc@author@en,
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
  \@ifpackagelater{hyperref}{2019/04/27}{}{%
    \g@addto@macro\psdmapshortnames{\let\mu\textmu}%
  }
  \ifustc@language@chinese
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
  \ifustc@language@chinese
    \newcommand\ustc@assertion@name{断言}
    \newcommand\ustc@assumption@name{假设}
    \newcommand\ustc@axiom@name{公理}
    \newcommand\ustc@corollary@name{推论}
    \newcommand\ustc@definition@name{定义}
    \newcommand\ustc@example@name{例}
    \newcommand\ustc@lemma@name{引理}
    \newcommand\ustc@proof@name{证明}
    \newcommand\ustc@proposition@name{命题}
    \newcommand\ustc@remark@name{注}
    \newcommand\ustc@theorem@name{定理}
  \else
    \newcommand\ustc@assertion@name{Assertion}
    \newcommand\ustc@assumption@name{Assumption}
    \newcommand\ustc@axiom@name{Axiom}
    \newcommand\ustc@corollary@name{Corollary}
    \newcommand\ustc@definition@name{Definition}
    \newcommand\ustc@example@name{Example}
    \newcommand\ustc@lemma@name{Lemma}
    \newcommand\ustc@proof@name{Proof}
    \newcommand\ustc@proposition@name{Proposition}
    \newcommand\ustc@remark@name{Remark}
    \newcommand\ustc@theorem@name{Theorem}
  \fi
  \newtheorem{theorem}             {\ustc@theorem@name}    [chapter]
  \newtheorem{assertion}  [theorem]{\ustc@assertion@name}
  \newtheorem{axiom}      [theorem]{\ustc@axiom@name}
  \newtheorem{corollary}  [theorem]{\ustc@corollary@name}
  \newtheorem{lemma}      [theorem]{\ustc@lemma@name}
  \newtheorem{proposition}[theorem]{\ustc@proposition@name}
  \newtheorem{assumption}          {\ustc@assumption@name} [chapter]
  \newtheorem{definition}          {\ustc@definition@name} [chapter]
  \newtheorem{example}             {\ustc@example@name}    [chapter]
  \newtheorem*{remark}             {\ustc@remark@name}
  \renewenvironment{proof}[1][\ustc@proof@name]{\par
    \pushQED{\qed}%
    \normalfont \topsep6\p@\@plus6\p@\relax
    \trivlist
      \item\relax\hskip2\ccwd
      \textbf{#1}
      \hskip\ccwd\ignorespaces
    }{%
    \popQED\endtrivlist\@endpefalse
  }
}
\PassOptionsToPackage{algochapter}{algorithm2e}
\ustc@atendpackage{algorithm2e}{
  \ifustc@language@chinese
    \SetAlgorithmName{算法}{算法}{算法清单}
  \else
    \SetAlgorithmName{Algorithm}{Algorithm}{List of Algorithms}
  \fi
  \SetAlCapSkip{6\bp@}
  \SetAlCapFnt{\small}
  \SetAlCapNameFnt{\small}
  \ifustc@degree@graduate
    \SetAlCapNameSty{textbf}
  \fi
  \SetAlgoCaptionSeparator{\unskip\hspace*{\ccwd}}
  \renewcommand\listofalgocfs{%
    \ifustc@degree@graduate
      \cleardoublepage
    \fi
    \ustc@chapter{\listalgorithmcfname}%
    \@starttoc{loa}%
  }
  \titlecontents{algocf}
    [2.3em]{\normalsize}
    {\contentslabel{2.3em}}{}
    {\ustc@leaders\contentspage}
  \contentsuse{algocf}{loa}
}
\ustc@atendpackage{nomencl}{
  \let\nomname\ustc@notation@name
  \def\thenomenclature{%
    \ifustc@degree@graduate
      \cleardoublepage
      \pagestyle{headings}%
    \fi
    \ustc@chapter{\ustc@notation@name}%
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
    \ifustc@degree@graduate
      \clearpage
      \pagestyle{plain}%
    \fi
  }
}
\ustc@atendpackage{siunitx}{
  \sisetup{
    group-minimum-digits = 4,
    separate-uncertainty = true,
    inter-unit-product   = \ensuremath{{}\cdot{}},
  }
  \ifustc@language@chinese
    \sisetup{
      list-final-separator = { 和 },
      list-pair-separator  = { 和 },
      range-phrase         = {～},
    }
  \fi
}
