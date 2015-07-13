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


\LoadClass[a4paper, UTF8, zihao=-4]{ctexbook}[2015/06/19]
% 英文字体
\setmainfont{Times New Roman}
\setmonofont[BoldFont={Courier New Bold}]{Courier New}
\setsansfont[BoldFont={Arial:style=Bold}]{Arial}

\RequirePackage[
    left=3.17cm, right=3.17cm,
    top=2.54cm, bottom=2.54cm,% top margin 2.54cm
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
\def\ustc@define@term#1{
    \expandafter\gdef\csname #1\endcsname##1{
        \expandafter\gdef\csname ustc@#1\endcsname{##1}
    }
    \csname #1\endcsname{}
}
\newcommand\ustc@underline[2][6em]{
    \hskip1pt\underline{\hb@xt@ #1{\hss#2\hss}}\hskip3pt
}
\newcommand\USTCLarge{\fontsize{20}{\baselineskip}\selectfont} % 英文扉页第一行
\newcommand\USTCLARGE{\fontsize{26}{\baselineskip}\selectfont} % 英文扉页第二行
\newcommand\USTCHUGE{\fontsize{56}{\baselineskip}\selectfont}  % 中文扉页第二行
\newenvironment{cnabstract}{\chapter{摘\quad 要}}{}
\newenvironment{enabstract}{\chapter{Abstract}}{}
\newcommand\keywords[1]{\vspace{3.5ex}\noindent{\textbf{关键词：} #1}}
\newcommand\enkeywords[1]{\vspace{3.5ex}\noindent{\textbf{Key Words：} #1}}
\ustc@define@term{title}
\ustc@define@term{author}
\ustc@define@term{depart}
\ustc@define@term{major}
\ustc@define@term{advisor}
\ustc@define@term{coadvisor}
\ustc@define@term{studentid}
\ustc@define@term{submitdate}
\ustc@define@term{entitle}
\ustc@define@term{enauthor}
\ustc@define@term{enmajor}
\ustc@define@term{enadvisor}
\ustc@define@term{encoadvisor}
\ustc@define@term{ensubmitdate}

% 仅供测试使用
%\RequirePackage{pagegrid}
%\pagegridsetup{enable, tl, step=1cm, double}

% 封面
\input{ustcthesis-statement.def}
\renewcommand\maketitle{
    \pagestyle{empty}
    \make@cntitle
    \cleardoublepage
    \make@entitle
    \cleardoublepage
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
    chapter/beforeskip = 24pt,
    chapter/afterskip = 18pt,
    % section
    section/format += \bfseries\raggedright\linespread{1}\selectfont\zihao{4},
    section/beforeskip = 24 pt,
    section/afterskip = 6 pt,
    % subsection
    subsection/format+= \bfseries\raggedright\linespread{1}\selectfont
                        \fontsize{13pt}{\baselineskip}\selectfont,
    subsection/beforeskip = 12 pt,
    subsection/afterskip = 6 pt,
    % subsubsection
    subsubsection/format+= \bfseries\raggedright\linespread{1}\selectfont\zihao{-4},
    subsubsection/beforeskip = 12 pt,
    subsubsection/afterskip = 6 pt,
}
\setcounter{secnumdepth}{3}  % subsubsection numbering
% 汉化
\ctexset{
    contentsname = {目\quad 录},
}

% 段落设置
\setlength{\parskip}{0pt}           % 段前段后间距0磅
\setlength{\baselineskip}{20pt}     % 行间距20磅

% 图表标题
\RequirePackage[format=hang, labelsep=quad,
    labelfont={small,bf}, textfont=small]{caption}
\captionsetup[figure]{position = bottom, aboveskip = 6pt, belowskip = 12pt}
\captionsetup[table]{position = top, aboveskip = 6pt, belowskip = 6pt}

% 目录
\RequirePackage{titletoc}
\setcounter{tocdepth}{3}
\titlecontents{chapter}[0em]
    {\vspace{6bp}\zihao{4}}{\thecontentslabel\hspace*{0.5em}}
    {}{\titlerule*[0.5pc]{$\cdot$}\contentspage}
\titlecontents{section}[\ccwd]
    {\vspace{1bp}\zihao{-4}}{\thecontentslabel\hspace*{0.5em}}
    {}{\titlerule*[0.5pc]{$\cdot$}\contentspage}
\titlecontents{subsection}[2\ccwd]
    {\vspace{1bp}\zihao{5}}{\thecontentslabel\hspace*{0.5em}}
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

\newcommand\make@cntitle{
    \pdfbookmark[-1]{\ustc@title}{title}
    \begin{center}
    \vspace*{2.4cm}%??????????????
    \includegraphics[width=10cm]{ustc_logo_text.eps}
    \vskip 1.4cm
    \ifUSTC@opt@doctor\textbf{\USTCHUGE{博士学位论文}} \fi
    \ifUSTC@opt@master\textbf{\USTCHUGE{硕士学位论文}} \fi
    \ifUSTC@opt@bachelor\textbf{\USTCHUGE{学士学位论文}} \fi
    \vskip 1.4cm
    \includegraphics[width=4.7cm]{ustc_logo_fig.eps}
    \vskip 1.5cm

    \begin{minipage}[t][4cm][t]{14cm}
    \centering
    \doublespacing\zihao{1}\textbf{\ustc@title}
    \end{minipage}

    \begin{minipage}[t][4cm][t]{12cm}
    \centering
    \doublespacing\zihao{3}
    \begin{tabular}{p{4.0cm}p{7.0cm}}
    \textbf{作者姓名：}  &   \ustc@author    \\
    \textbf{学科专业：}  &   \ustc@major     \\
    \textbf{导师姓名：}  &   \ustc@advisor   \\
    \textbf{完成时间：}  &   \ustc@submitdate \\
    \end{tabular}
    \end{minipage}
    \end{center}
}
\newcommand\make@entitle{
    \begin{center}
    \vspace*{1.7cm}
    \USTCLarge{\textsf{University of Science and Technology of China}}
    \vskip 0.3cm
    \ifUSTC@opt@doctor\textsf{\USTCLARGE{A dissertation for doctor's degree}} \fi
    \ifUSTC@opt@master\textsf{\USTCLARGE{A dissertation for master's degree}} \fi
    \ifUSTC@opt@bachelor\textsf{\USTCLARGE{A dissertation for bachelor's degree}} \fi
    \vskip 1.4cm
    \includegraphics[width=4.7cm]{ustc_logo_fig.eps}
    \vskip 1.4cm

    \begin{minipage}[c][4cm][c]{14cm}
    \centering\USTCLARGE\textsf{\ustc@entitle}
    \end{minipage}

    \vskip 2cm
    \begin{minipage}[t][4cm][t]{14cm}
    \centering\doublespacing\zihao{3}
    \begin{tabular}{p{4cm}p{7cm}}
    Author:         &   \ustc@enauthor     \\
    Speciality:     &   \ustc@enmajor      \\
    Supervisor:     &   \ustc@enadvisor    \\
    Finished Time:  &   \ustc@ensubmitdate \\
    \end{tabular}
    \end{minipage}
    \end{center}
}

\endinput
