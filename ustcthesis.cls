%
%   University of Science and Technology of China
%   Thesis Template for bachelor, master and doctor
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ustcthesis}
    [2015/06/28 Thesis Template for University of Science and Technology of China]

\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=USTC, prefix=USTC@opt@, setkeys=\kvsetkeys}
\DeclareBoolOption[false]{doctor}
\DeclareBoolOption[false]{master}
\DeclareBoolOption[false]{bachelor}
\DeclareBoolOption[true]{twoside}   % 默认双页打印
\DeclareComplementaryOption{oneside}{twoside}

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessKeyvalOptions*\relax

\ifUSTC@opt@twoside
    \PassOptionsToClass{twoside}{ctexbook}
\else
    \PassOptionsToClass{oneside}{ctexbook}
\fi

\PassOptionsToPackage{no-math}{fontspec}

\LoadClass[a4paper, UTF8, zihao=-4]{ctexbook}[2015/06/19]
% 英文字体
\setmainfont{Times New Roman}
\setsansfont{Arial}
\setmonofont{Courier New}

\RequirePackage[
    left=3.17cm, right=3.17cm,
    top=2.54cm, bottom=2.54cm,
    headsep=0.74cm,
    headheight=0.5cm,
    footskip=0.79cm,
%   showframe=true,
]{geometry}

% 超链接与书签
\RequirePackage[
    CJKbookmarks=true,
    colorlinks,
    linkcolor=blue,
    citecolor=blue,
    bookmarksnumbered=true,
    bookmarksopen=true,
]{hyperref}
\AtBeginDocument{
    \hypersetup{
        pdftitle={\ustc@title},
        pdfauthor={\ustc@author}
    }
}

% useful definitions
\RequirePackage{xparse}
\def\ustc@define@term#1{
    \expandafter\gdef\csname #1\endcsname##1{
        \expandafter\gdef\csname ustc@#1\endcsname{##1}
    }
    \csname #1\endcsname{}
}
\newcommand\ustc@underline[2][6em]{
    \hskip1pt\underline{\hb@xt@ #1{\hss#2\hss}}\hskip3pt
}
% 定义了直接调用磅数设置字体大小的命令，用法为
% 1. \setfontsize{15bp} 设置字号15磅，默认单倍行距
% 2. \setfontsize{15bp}[30bp] 设置字号15磅，行距30磅
\DeclareDocumentCommand \setfontsize { m o } {
    \IfValueTF {#2}
        { \fontsize{#1}{#2} }
        { \fontsize{#1}{1.2 \dimexpr#1} }
    \linespread{1}\selectfont\relax}
\newcommand\zhspace[1][1]{\hspace{#1\ccwd}}
\newenvironment{cnabstract}{\chapter[摘要]{摘\quad 要}}{\cleardoublepage}
\newenvironment{enabstract}{
    \ctexset { chapter/format += \sffamily\bfseries\setfontsize{16bp} }
    \chapter[Abstract]{ABSTRACT}}
    {\cleardoublepage}
\newcommand\keywords[1]{\par\phantom{关键词}\par\noindent\hangindent=4\ccwd\relax\textbf{关键词：}#1}
\newcommand\enkeywords[1]{\par\phantom{keywords}\par\noindent\hangindent=5.3em\relax\textbf{Key Words:} #1}
\ustc@define@term{title}
\ustc@define@term{secrettext}
\ustc@define@term{author}
\ustc@define@term{depart}
\ustc@define@term{major}
\ustc@define@term{advisor}
\ustc@define@term{coadvisor}
\ustc@define@term{studentid}
\ustc@define@term{submitdate}
\ustc@define@term{entitle}
\ustc@define@term{ensecrettext}
\ustc@define@term{enauthor}
\ustc@define@term{enmajor}
\ustc@define@term{enadvisor}
\ustc@define@term{encoadvisor}
\ustc@define@term{ensubmitdate}

% 仅供测试使用
%\RequirePackage{pagegrid}
%\pagegridsetup{enable, tl, step=1cm, double}

% 扉页
\input{ustcthesis-statement.def}
\renewcommand\maketitle{
    \newgeometry{
        top=3.8cm, bottom=3.8cm,
        left=3.2cm, right=3.2cm,
        headheight=0cm, headsep=0.8cm,
        footskip=0.8cm
    }
    \pagestyle{empty}
    \pdfbookmark[-1]{\ustc@title}{title}
    \make@cntitle \cleardoublepage
    \make@entitle \cleardoublepage
    \restoregeometry
    \ifUSTC@opt@bachelor\relax\else
        \make@statement \cleardoublepage
    \fi
}

\RequirePackage{setspace}
% 标题设置
\ctexset{
    % chapter
    chapter/format += \bfseries\linespread{1}\selectfont\zihao{3},
    chapter/nameformat = {},   % 由于nameformat和titleformat的bug，这两行必须
    chapter/titleformat = {},
    chapter/number = \arabic{chapter},
    chapter/beforeskip = 24bp,
    chapter/afterskip = 18bp,
    % section
    section/format += \bfseries\raggedright\linespread{1}\selectfont\zihao{4},
    section/beforeskip = 24bp,
    section/afterskip = 6bp,
    % subsection
    subsection/format+= \bfseries\raggedright\linespread{1}\selectfont
                        \fontsize{13bp}{\baselineskip}\selectfont,
    subsection/beforeskip = 12bp,
    subsection/afterskip = 6bp,
    % subsubsection
    subsubsection/format+= \bfseries\raggedright\linespread{1}\selectfont\zihao{-4},
    subsubsection/beforeskip = 12bp,
    subsubsection/afterskip = 6bp,
}
\setcounter{secnumdepth}{3}  % subsubsection numbering
% 汉化
\ctexset{
    contentsname = {目\hspace{\ccwd}录},
}

% 段落设置
\setlength{\parskip}{0bp}           % 段前段后间距0磅
\setlength{\baselineskip}{20bp}     % 行间距20磅

% 图表标题
\RequirePackage{caption}
\DeclareCaptionLabelSeparator{zhspace}{\hspace{\ccwd}}
\captionsetup{
    format = hang,
    labelfont = {bf, small},
    labelsep = zhspace,
    textfont = small}
\captionsetup[figure]{position = bottom, aboveskip = 6bp, belowskip = 12bp}
\captionsetup[table]{position = top, aboveskip = 6bp, belowskip = 6bp}

% 图标的附注
% 直接用\caption{}会导致图标的序号有误，使用bicaption会导致表注无法置于表后，而且对齐方式不对
\newcommand\note[1]{
    \captionsetup{position = bottom}
    \caption*{\hangindent=2\ccwd\relax\textbf{注}：#1}}

% 数学公式
% LaTeX 默认 10pt 时有 \DeclareMathSizes{\@xpt}{\@xpt}{7}{5}
% 这里按照相同的比例设置 10.5bp
\DeclareMathSizes{10.5bp}{10.5bp}{7.35bp}{5.25bp}

% 目录
\RequirePackage{tocbibind}
\renewcommand{\tableofcontents}{\tocfile{目录}{toc}}
\RequirePackage{titletoc}
\titlecontents{chapter}[0em]
    {\vspace{6bp}\zihao{4}}{\thecontentslabel\hspace*{0.5em}}
    {}{\titlerule*[0.5pc]{$\cdot$}\contentspage}
\titlecontents{section}[\ccwd]
    {\vspace{6bp}\zihao{-4}}{\thecontentslabel\hspace*{0.5em}}
    {}{\titlerule*[0.5pc]{$\cdot$}\contentspage}
\titlecontents{subsection}[2\ccwd]
    {\vspace{6bp}\zihao{5}}{\thecontentslabel\hspace*{0.5em}}
    {}{\titlerule*[0.5pc]{$\cdot$}\contentspage}
\titlecontents{figure}[\ccwd]
    {\zihao{-4}}{\thecontentslabel\hspace*{0.5em}}
    {}{\titlerule*[0.5pc]{$\cdot$}\contentspage}
\titlecontents{table}[\ccwd]
    {\zihao{-4}}{\thecontentslabel\hspace*{0.5em}}
    {}{\titlerule*[0.5pc]{$\cdot$}\contentspage}

% 页眉页脚
\RequirePackage{titleps}
\ifUSTC@opt@bachelor
    \input{ustcthesis-bachelor.def}
\else
    \input{ustcthesis-doctor.def}
\fi

% 符号说明
\newenvironment{notation}{
    \ctexset{chapter/format += \rmfamily\setfontsize{12bp}}
    \chapter{符号说明}
    \setfontsize{10.5bp}[16bp]
    \setlength{\itemsep}{0bp}}{}

% 参考文献
\usepackage[super,sort&compress]{natbib}
\setcitestyle{square}
\bibliographystyle{ustcthesis}
\renewcommand\bibfont{\setfontsize{10.5bp}[20bp]}
\setlength{\bibsep}{0bp}
\setlength{\bibhang}{1em}

% 中文封面
% 封面为了排版``距离顶边xx厘米''，使用了tabular嵌套parbox的方法。使用vpace会有额外空隙，叠parbox也不行。
% 这里没有严格按照《规范》的格式范例的尺寸，其中``学位论文''向上调整了0.7cm，
% 论文标题和作者姓名部分分别在parbox内部进行了垂直居中处理。两个eps图片为手工测量所得。
\newcommand\make@cntitle{
    \begin{titlepage}
    \begin{center}
    \renewcommand{\arraystretch}{0}
    \begin{tabular}{@{}c@{}}
        \\[0.2cm]
        \parbox[t][1.2cm][t]{\textwidth}{\raggedleft\fangsong\setfontsize{14bp}\ustc@secrettext} \\
        \parbox[t][2.7cm][t]{\textwidth}{\centering\includegraphics[width=11cm]{figures/ustc_logo_text.eps}} \\
        \parbox[t][3cm][t]{\textwidth}{\centering\bfseries\setfontsize{56bp}
            \ifUSTC@opt@doctor 博士学位论文 \fi
            \ifUSTC@opt@master 硕士学位论文 \fi
            \ifUSTC@opt@bachelor 学士学位论文 \fi} \\
        \includegraphics[height=4.9cm]{figures/ustc_logo_fig.eps} \\
        \parbox[t][4.7cm][c]{\textwidth}{\centering\bfseries\setfontsize{26bp}\ustc@title} \\
        \parbox[t][4.2cm][c]{\textwidth}{\setfontsize{16bp}
            \hspace*{2.8cm}{\bfseries 作者姓名：}\hfill \ustc@author \hfill\mbox{} \\
            \hspace*{2.8cm}{\bfseries 学科专业：}\hfill \ustc@major \hfill\mbox{} \\
            \hspace*{2.8cm}{\bfseries 导师姓名：}\hfill \ustc@advisor \hfill\mbox{} \\
            \hspace*{2.8cm}{\bfseries 完成时间：}\hfill \ustc@submitdate \hfill\mbox{}}
    \end{tabular}
    \end{center}
    \end{titlepage}
}

% 英文封面
% Supervisor 一栏放不下两个英文名称
\newcommand\make@entitle{
    \begin{titlepage}
    \begin{center}
    \renewcommand{\arraystretch}{0}
    \begin{tabular}{@{}c@{}}
        \\[0.2cm]
        \parbox[t][1cm][t]{\textwidth}{\raggedleft\setfontsize{14bp}\ustc@ensecrettext} \\
        \parbox[t][1cm][t]{\textwidth}{\centering\sffamily\setfontsize{20bp}[30bp]
            University of Science and Technology of China} \\
        \parbox[t][2.2cm][t]{\textwidth}{\centering\bfseries\setfontsize{26bp}[30bp]
            \ifUSTC@opt@doctor A dissertation for doctor's degree \fi
            \ifUSTC@opt@master A dissertation for master's degree \fi
            \ifUSTC@opt@bachelor A dissertation for bachelor's degree \fi} \\
        \includegraphics[height=4.9cm]{figures/ustc_logo_fig.eps} \\
        \\[2.9cm]
        \parbox[t][4.7cm][t]{\textwidth}{\centering\bfseries\setfontsize{26bp}[30bp]\ustc@entitle} \\
        \parbox[t][4cm][c]{\textwidth}{\setfontsize{16bp}[30bp]
            \hspace*{2.8cm} Author: \hspace{1.6cm}\hfill \ustc@enauthor \hfill\mbox{} \\
            \hspace*{2.8cm} Speciality: \hspace{0.8cm}\hfill \ustc@enmajor \hfill\mbox{} \\
            \hspace*{2.8cm} Supervisor: \hspace{0.8cm}\hfill \ustc@enadvisor \hfill\mbox{} \\
            \hspace*{2.8cm} Finished Time: \hfill \ustc@ensubmitdate \hfill\mbox{}}
    \end{tabular}
    \end{center}
    \end{titlepage}
}

% 书脊
% 书脊的论文题目、系别、作者姓名默认为\ustc@title, \ustc@depart, \ustc@author，
% 竖排的内部实现是，先用 \addCJKfontfeatures{Vertical=RotatedGlyphs} 旋转每个字，
% 再用 \rotatebox{-90}{} 旋转整个盒子，
% 由于中文字形的旋转后的深度会变，所以使用 \raisebox 进行调整。
% 所以留下 \spinetitle 等接口进行设置，如果标题里含有英文，要用\entext{}包括起来
% \RequirePackage{rotating}
% \ustc@define@term{spinetitle}
% \ustc@define@term{spinedepart}
% \ustc@define@term{spineauthor}
%
% \spinetitle{\ustc@title}
% \spinedepart{\ustc@depart}
% \spineauthor{\ustc@author}
%
% \newcommand\entext[1]{\raisebox{-0.75ex}{~#1{}~}}
%
% \newcommand\make@spine{
%     \begin{titlepage}
%     \begin{center}
%         书脊(此页仅用于制作书脊,不用单独打印放入论文)\par
%         \renewcommand\\{\relax}
%         \sffamily\bfseries\setfontsize{12bp}[14bp]\ziju{0.166667}
%         \addCJKfontfeatures{Vertical=RotatedGlyphs}
%         \rotatebox{-90}{\fbox{\parbox{20cm}{
%             \hspace*{3cm plus 1cm minus 2cm}
%             \raisebox{0.75ex}{\ustc@spinetitle} \hfill\quad\hfill
%             \raisebox{0.75ex}{\ustc@spinedepart} \hfill\quad\hfill
%             \raisebox{0.75ex}{\ustc@spineauthor} \hfill\quad\hfill
%             \raisebox{0.75ex}{中国科学技术大学}
%             \hspace{3cm plus 1cm minus 2cm}
%             \vskip 5.8pt\relax}}}
%     \end{center}
%     \end{titlepage}
% }
%
% \spinetitle{\entext{USTC}本硕博毕业论文示例文档} % 书脊的英文文字要用 \entext{} 括起来

\endinput
