%
% Copyright (C) 2015-2025 by USTC TeX Users Group <https://github.com/ustctug>
%
% This file may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3c
% of this license or (at your option) any later version.
% The latest version of this license is in
%    https://www.latex-project.org/lppl.txt
% and version 1.3c or later is part of all distributions of LaTeX
% version 2008 or later.
%

\NeedsTeXFormat{LaTeX2e}[2017/04/15]
\providecommand\IfFormatAtLeastTF{\@ifl@t@r\fmtversion}
\IfFormatAtLeastTF{2020/02/02}{}
  {\RequirePackage{expl3}}

\newcommand\ustcthesisversion{4.0.0-beta.8}
\ProvidesExplClass{ustcthesis}{2025-04-16}{\ustcthesisversion}{USTC thesis template}

\ExplSyntaxOff

% 报错和警告
\newcommand\ustc@error[1]{%
  \ClassError{ustcthesis}{#1}{}%
}
\newcommand\ustc@warning[1]{%
  \ClassWarning{ustcthesis}{#1}%
}

\newcommand\ustc@deprecated[3]{%
  \ustc@warning{The #1 is deprecated since #2. Use #3 instead.}%
}

\ExplSyntaxOn

% 检查 \LaTeXe{} kernel 版本
\msg_new:nnn { ustcthesis } { latex-kernel-too-old }
  { You~ need~ a~ newer~ LaTeX~ to~ use~ this~ template. }

\IfFormatAtLeastTF { 2017/04/15 }
  {}
  { \msg_fatal:nn { ustcthesis } { latex-kernel-too-old } }

% 检查编译引擎，要求使用 XeLaTeX 或 LuaLaTeX。
\msg_new:nnn { ustcthesis } { unsupported-engine }
  {
    The~ ustcthesis~ class~ requires~ either~ XeTeX~ or~ LuaTeX.\\
    '#1'~ is~ not~ supported.
  }

\sys_if_engine_xetex:F
  {
    \sys_if_engine_luatex:F
      {
        \msg_fatal:nnV { ustcthesis } { unsupported-engine } \c_sys_engine_str
      }
  }

\ExplSyntaxOff

% \subsection{处理选项}

\RequirePackage{kvdefinekeys}
\RequirePackage{kvsetkeys}
\RequirePackage{kvoptions}

% 提供一个 \cs{ustcsetup} 命令支持 \emph{key-value} 的方式来设置。
\let\ustc@setup@hook\@empty
\newcommand\ustcsetup[1]{%
  \let\ustc@setup@hook\@empty
  \kvsetkeys{ustc}{#1}%
  \ustc@setup@hook
}

% 同时用 \emph{key-value} 的方式来定义这些接口：
% \begin{latex}
%   \ustc@define@key{
%     <key> = {
%       name = <name>,
%       choices = {
%         <choice1>,
%         <choice2>,
%       },
%       default = <default>,
%       code = <code>,
%     },
%   }
% \end{latex}

% 其中 |choices| 设置允许使用的值，默认为第一个（或者 \meta{default}）；
% \meta{code} 是相应的内容被设置时执行的代码。

\newcommand\ustc@define@key[1]{%
  \kvsetkeys{ustc@key}{#1}%
}
\kv@set@family@handler{ustc@key}{%
%
% \cs{ustcsetup} 会将 \meta{value} 存到 \cs{ustc@\meta{key}}，
% 但是宏的名字包含 “-” 这样的特殊字符时不方便直接调用，比如 |key = math-style|，
% 这时可以用 |name| 设置 \meta{key} 的别称，比如 |key = math@style|，
% 这样就可以通过 \cs{ustc@math@style} 来引用。
% |default| 是定义该 \meta{key} 时默认的值，缺省为空。
%
  \@namedef{ustc@#1@@name}{#1}%
  \def\ustc@@default{}%
  \def\ustc@@choices{}%
  \kv@define@key{ustc@value}{name}{%
    \@namedef{ustc@#1@@name}{##1}%
  }%
  %
  % 由于在定义接口时，\cs{ustc@\meta{key}@@code} 不一定有定义，
  % 而且在文档类/宏包中还有可能对该 |key| 的 |code| 进行添加。
  % 所以 \cs{ustc@\meta{key}@@code} 会检查如果在定义文档类/宏包时则推迟执行，否则立即执行。
  %
  \@namedef{ustc@#1@@check}{}%
  \@namedef{ustc@#1@@code}{}%
  %
  % 保存下 |choices = {}| 定义的内容，在定义 \cs{ustc@\meta{name}} 后再执行。
  %
  \kv@define@key{ustc@value}{choices}{%
    \def\ustc@@choices{##1}%
    \@namedef{ustc@#1@@reset}{}%
    %
    % \cs{ustc@\meta{key}@check} 检查 |value| 是否有效，
    % 并设置 \cs{ifustc@\meta{name}@\meta{value}}。
    %
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
  %
  % 第一个 \meta{choice} 设为 \meta{default}，
  % 并且对每个 \meta{choice} 定义 \cs{ifustc@\meta{name}@\meta{choice}}。
  %
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
  %
  % 将 \meta{default} 赋值到 \cs{ustc@\meta{name}}，如果非空则执行相应的代码。
  %
  \expandafter\let\csname ustc@\@nameuse{ustc@#1@@name}\endcsname\ustc@@default
  \expandafter\ifx\csname ustc@\@nameuse{ustc@#1@@name}\endcsname\@empty\else
    \@nameuse{ustc@#1@@check}%
  \fi
  %
  % 定义 \cs{ustcsetup} 接口。
  %
  \kv@define@key{ustc}{#1}{%
    \@namedef{ustc@\@nameuse{ustc@#1@@name}}{##1}%
    \@nameuse{ustc@#1@@check}%
    \@nameuse{ustc@#1@@code}%
  }%
}

% 定义接口向 |key| 添加 |code|：

\newcommand\ustc@option@hook[2]{%
  \expandafter\g@addto@macro\csname ustc@#1@@code\endcsname{#2}%
}

\ustc@define@key{
  degree = {
    choices = {
      doctor,
      master,
      bachelor,
    },
    default = doctor,
  },
  degree-type = {
    name = degree@type,
    choices = {
      academic,
      professional,
      engineering,
    },
    default = academic,
  },
  main-language = {
    name = main@language,
    choices = {
      chinese,
      english,
    },
    default = chinese,
  },
  language = {
    choices = {
      chinese,
      english,
    },
    default = chinese,
  },
  system = {
    choices = {
      auto,
      mac,
      unix,
      windows,
    },
    default = auto,
  },
  fontset = {
    choices = {
      auto,
      windows,
      mac,
      ubuntu,
      fandol,
      none,
    },
    default = auto,
  },
  font = {
    choices = {
      auto,
      times,
      termes,
      stix,
      xits,
      newcm,
      lm,
      newtx,
      none,
    },
    default = auto,
  },
  cjk-font = {
    name = cjk@font,
    choices = {
      auto,
      windows,
      mac,
      fandol,
      none,
    },
    default = auto,
  },
  math-font = {
    name = math@font,
    choices = {
      auto,
      stix,
      xits,
      newcm,
      cm,
      lm,
      newtx,
      none,
    },
    default = auto,
  },
  math-style = {
    name = math@style,
    choices = {
      GB,
      ISO,
      TeX,
    },
  },
  uppercase-greek = {
    name = uppercase@greek,
    choices = {
      italic,
      upright,
    },
  },
  less-than-or-equal = {
    name = leq,
    choices = {
      slanted,
      horizontal,
    },
  },
  integral = {
    choices = {
      upright,
      slanted,
    },
  },
  integral-limits = {
    name = integral@limits,
    choices = {
      true,
      false,
    },
  },
  partial = {
    choices = {
      upright,
      italic,
    },
  },
  math-ellipsis = {
    name = math@ellipsis,
    choices = {
      centered,
      lower,
      AMS,
    },
  },
  real-part = {
    name = real@part,
    choices = {
      roman,
      fraktur,
    },
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
  reviewer = {
    choices = {
      true,
      false,
    },
    default = false,
  },
  eqn-paren-style = {
    name = eqn@paren@style,
    choices = {
      full,
      half,
    }
  },
}

% 将 \ustc@cite@style 置空方便后续进行判断。
\def\ustc@cite@style{}

\newif\ifustc@degree@graduate
\newcommand\ustc@set@graduate{%
  \ifustc@degree@bachelor
    \ustc@degree@graduatefalse
  \else
    \ustc@degree@graduatetrue
  \fi
}
\ustc@set@graduate
\ustc@option@hook{degree}{%
  \ustc@set@graduate
}

% 使用 \pkg{kvoptions} 提供的 key-value 接口，
\SetupKeyvalOptions{
  family  = ustc,
  prefix  = ustc@,
  setkeys = \kvsetkeys,
}

% 设置默认 \option{openany}。
\DeclareBoolOption[false]{openright}
\DeclareComplementaryOption{openany}{openright}

% 兼容旧版本的文档类选项。
% Reserved for compatibility until 2020-07-01.
\DeclareVoidOption{doctor}{\ustcsetup{degree=doctor}}
\DeclareVoidOption{master}{\ustcsetup{degree=master}}
\DeclareVoidOption{bachelor}{\ustcsetup{degree=bachelor}}
\DeclareVoidOption{chinese}{\ustcsetup{language=chinese}}
\DeclareVoidOption{english}{\ustcsetup{language=english}}
\DeclareVoidOption{academic}{\ustcsetup{degree-type=academic}}
\DeclareVoidOption{professional}{\ustcsetup{degree-type=professional}}
\DeclareVoidOption{engineering}{\ustcsetup{degree-type=engineering}}
\DeclareVoidOption{print}{\ustcsetup{output=print}}
\DeclareVoidOption{pdf}{\ustcsetup{output=electronic}}
\newif\ifustc@legacy@cite@style
\DeclareVoidOption{super}{\ustcsetup{cite-style=super}\ustc@legacy@cite@styletrue}
\DeclareVoidOption{numbers}{\ustcsetup{cite-style=inline}\ustc@legacy@cite@styletrue}
\DeclareVoidOption{authoryear}{\ustcsetup{cite-style=authoryear}\ustc@legacy@cite@styletrue}
\DeclareVoidOption{arabic}{\ustcsetup{section-style=arabic}}
\DeclareVoidOption{colorlogo}{\ustcsetup{badge-color=blue}}
\DeclareVoidOption{bwlogo}{\ustcsetup{badge-color=black}}

% 载入 \cls{ctexbook}。
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessKeyvalOptions*


% \subsection{加载文档类和宏包}

\ifustc@openright
  \PassOptionsToClass{openright}{book}
\else
  \PassOptionsToClass{openany}{book}
\fi

\ifustc@output@electronic
  \PassOptionsToClass{oneside}{book}
\fi
\PassOptionsToPackage{no-math}{fontspec}

% 载入 \cls{ctexbook} 文档类，注意要求为 2.4.9 或更高的版本。
\LoadClass[UTF8,a4paper,scheme=plain,zihao=-4,fontset=none]{ctexbook}[2017/04/01]

% 建议在模板开始处载入全部宏包，不要轻易改变加载顺序。
% \pkg{hyperref} 一般在最后加载。
\RequirePackage{etoolbox}
\RequirePackage{amsmath}
\RequirePackage{fontspec}[2017/03/31]
\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{color}
\RequirePackage{titletoc}
\RequirePackage{caption}
\RequirePackage{enumitem}
\RequirePackage[perpage]{footmisc}
\RequirePackage{url}
\RequirePackage{notoccite}
\RequirePackage{multirow}

% 如果用户在导言区未调用 \pkg{biblatex}，则自动调用 \pkg{natbib}。
\AtEndPreamble{
  \@ifpackageloaded{biblatex}{}{
    \RequirePackage{natbib}
  }
}

\ExplSyntaxOn

% 对冲突的宏包报错。
\RequirePackage{filehook}
\cs_new:Npn \__ustc_package_conflict:nn #1#2
  {
    \hook_gput_code:nnn { package / #1 / before } { . }
      {
        \hook_gput_code:nnn { package / #2 / before } { . }
          { \msg_error:nnnn { ustcthesis } { package-conflict } {#1} {#2} }
      }
  }

\msg_new:nnn { ustcthesis } { package-conflict }
  { The~ '#2'~ package~ is~ incompatible~ with~ '#1'. }

\__ustc_package_conflict:nn { biblatex } { bibunits }
\__ustc_package_conflict:nn { biblatex } { chapterbib }
\__ustc_package_conflict:nn { biblatex } { cite }
\__ustc_package_conflict:nn { biblatex } { multibib }
\__ustc_package_conflict:nn { biblatex } { natbib }

\__ustc_package_conflict:nn { bibunits } { biblatex }
\__ustc_package_conflict:nn { bibunits } { chapterbib }
\__ustc_package_conflict:nn { bibunits } { multibib }

\__ustc_package_conflict:nn { unicode-math } { amscd }
\__ustc_package_conflict:nn { unicode-math } { amsfonts }
\__ustc_package_conflict:nn { unicode-math } { amssymb }
\__ustc_package_conflict:nn { unicode-math } { bbm }
\__ustc_package_conflict:nn { unicode-math } { bm }
\__ustc_package_conflict:nn { unicode-math } { eucal }
\__ustc_package_conflict:nn { unicode-math } { eufrak }
\__ustc_package_conflict:nn { unicode-math } { mathrsfs }
\__ustc_package_conflict:nn { unicode-math } { newtxmath }
\__ustc_package_conflict:nn { unicode-math } { upgreek }

\__ustc_package_conflict:nn { natbib } { biblatex }
\__ustc_package_conflict:nn { natbib } { cite }

\__ustc_package_conflict:nn { newtxmath } { amsfonts }
\__ustc_package_conflict:nn { newtxmath } { amssymb }
\__ustc_package_conflict:nn { newtxmath } { unicode-math }
\__ustc_package_conflict:nn { newtxmath } { upgreek }


% \pkg{amsthm} 需要在 \pkg{newtx} 前载入，参考 \pkg{newtx} 的文档。
\hook_gput_code:nnn { package / amsthm / before } { . }
  {
    \@ifpackageloaded { newtxmath }
      { \msg_error:nn { ustcthesis } { amsthm-after-newtxmath } }
      {}
  }

\msg_new:nnn { ustcthesis } { amsthm-after-newtxmath }
  { The~ 'amsthm'~ package~ should~ be~ loaded~ before~ setting~ 'newtxmath'. }


% \subsection{处理语言}

% 定义 \cs{ustc@main@language}，当在导言区修改 \option{language} 时，
% 保存为论文的主要语言；
% \cs{ustc@reset@main@language} 则用于正文中恢复为主要语言。
%    \begin{macrocode}
\tl_new:N \l__ustc_main_language_code_tl
\tl_new:N \l__ustc_language_code_tl

\ustc@option@hook { main-language } { \tl_use:N \l__ustc_main_language_code_tl }
\ustc@option@hook { language } { \tl_use:N \l__ustc_language_code_tl }

\exp_args:Ne \ustcsetup { main-language = \ustc@language }

\prg_new_conditional:Nnn \__ustc_if_preamble: { T , F , TF }
  {
    \if_meaning:w \@begindocumenthook \@undefined
      \prg_return_false:
    \else
      \prg_return_true:
    \fi
  }

\tl_put_right:Nn \l__ustc_language_code_tl
  {
    \__ustc_if_preamble:T
      { \exp_args:Ne \ustcsetup { main-language = \ustc@language } }
  }
\cs_new:Npn \ustc@reset@main@language
  { \exp_args:Ne \ustcsetup { language = \ustc@main@language } }

% 带圈数字和星号使用中文字体。
\sys_if_engine_xetex:TF
  {
    \xeCJKDeclareCharClass { CJK } { "2460 -> "2473 }
    \xeCJKDeclareCharClass { CJK } { "2605 }
  }
  {
    \sys_if_engine_luatex:T
      {
        % ctex 将带圈数字 U+2460–U+24FF 归入字符范围 3（ALchar），这里改回范围 6（JAchar）
        \ltjdefcharrange { 3 }
          { "2000-"243F, "2500-"27BF, "2900-"29FF, "2B00-"2BFF}
        \ltjdefcharrange { 6 }
          {
            "2460-"24FF, "2E80-"2EFF, "3000-"30FF, "3190-"319F, "31F0-"4DBF,
            "4E00-"9FFF, "F900-"FAFF, "FE10-"FE1F, "FE30-"FE6F, "FF00-"FFEF,
            "1B000-"1B16F, "1F100-"1F2FF, "20000-"3FFFF, "E0100-"E01EF
          }
      }
  }

% 由于 Unicode 的一些标点符号是中西文混用的：
% U+00B7、U+2013、U+2014、U+2018、U+2019、
% U+201C、U+201D、U+2025、U+2026、U+2E3A，
% 所以要根据语言设置正确的字体。
% https://github.com/CTeX-org/ctex-kit/issues/389
\cs_new:Npn \__ustc_set_punctuations:
  {
    \ifustc@language@chinese
      \sys_if_engine_xetex:TF
        {
          \xeCJKDeclareCharClass { FullLeft } { "2018, "201C }
          \xeCJKDeclareCharClass { FullRight }
            { "00B7, "2019, "201D, "2013, "2014, "2025, "2026, "2E3A }
        }
        {
          \sys_if_engine_luatex:T
          { \ltjsetparameter { jacharrange = { +9 } } }
        }
    \else
      \sys_if_engine_xetex:TF
        {
          \xeCJKDeclareCharClass { HalfLeft } { "2018, "201C }
          \xeCJKDeclareCharClass { HalfRight }
            { "00B7, "2019, "201D, "2013, "2014, "2025, "2026, "2E3A }
        }
        {
          \sys_if_engine_luatex:T
            { \ltjsetparameter { jacharrange = { -9 } } }
        }
    \fi
  }
\__ustc_set_punctuations:
\tl_put_right:Nn \l__ustc_language_code_tl { \__ustc_set_punctuations: }

% 根据语言设置各章节的名称，只有在导言区设置 \option{language} 时会修改，
% 而在正文局部切换语言时则不变。

% 由于《撰写手册》中的“speciality”一词使用的是英式拼法，
% 所以“acknowledgements”也保持一致。

\tl_new:N \ustc@notation@name

\cs_new:Npn \__ustc_set_chapter_names:
  {
    \ifustc@main@language@chinese
      \ctexset { chapter / name = { 第 , 章 } }
      \tl_set:Nn \contentsname{目录}
      \tl_set:Nn \listfigurename { 插图清单 }
      \tl_set:Nn \listtablename { 附表清单 }
      \tl_set:Nn \ustc@list@figure@table@name { 插图和附表清单 }
      \tl_set:Nn \ustc@notation@name { 符号说明 }
      \tl_set:Nn \bibname { 参考文献 }
      \tl_set:Nn \appendixname { 附录 }
      \tl_set:Nn \ustc@acknowledgements@name { 致谢 }
      \tl_set:Nn \ustc@achievements@name { 在读期间取得的科研成果 }
    \else
      \ctexset { chapter / name = \chaptername \space }
      \tl_set:Nn \contentsname { Contents }
      \tl_set:Nn \listfigurename { List~ of~ Figures }
      \tl_set:Nn \listtablename { List~ of~ Tables }
      \tl_set:Nn \ustc@list@figure@table@name { List~ of~ Figures~ and~ Tables }
      \tl_set:Nn \ustc@notation@name { Notation }
      \tl_set:Nn \bibname { Bibliography }
      \tl_set:Nn \appendixname { Appendix }
      \tl_set:Nn \ustc@acknowledgements@name { Acknowledgements }
      \tl_set:Nn \ustc@achievements@name { Research~ Achievements }
    \fi
  }
\__ustc_set_chapter_names:
\tl_put_right:Nn \l__ustc_main_language_code_tl { \__ustc_set_chapter_names: }

% 这部分名称在正文中局部地修改语言时会发生变化。
\cs_new:Npn \__ustc_set_names:
  {
    \ifustc@language@chinese
      \tl_set:Nn \figurename { 图 }
      \tl_set:Nn \tablename { 表 }
    \else
      \tl_set:Nn \figurename { Figure }
      \tl_set:Nn \tablename { Table }
    \fi
  }
\__ustc_set_names:
\tl_put_right:Nn \l__ustc_language_code_tl { \__ustc_set_names: }

% \subsection{字体}

% 字号

% 正文字号12bp，研究生行距20bp，本科生行距22bp；
% 其他命令的行距按照相同的的比例设置，如表~\ref{tab:fontsize}。
% \begin{table}[htb]
%   \centering
%   \caption{标准字体命令与字号、行距的对应}
%   \label{tab:fontsize}
%   \begin{tabular}{lllll}
%     \toprule
%     字体命令          & 字号 & bp   & 研究生行距 & 本科生行距 \\
%     \midrule
%     \cs{tiny}         & 小六 & 6.5  & 10.83      & 11.92      \\
%     \cs{scriptsize}   & 六号 & 7.5  & 12.5       & 13.75      \\
%     \cs{footnotesize} & 小五 & 9    & 15         & 16.5       \\
%     \cs{small}        & 五号 & 10.5 & 17.5       & 19.25      \\
%     \cs{normalsize}   & 小四 & 12   & 20         & 22         \\
%     \cs{large}        & 小三 & 15   & 25         & 27.5       \\
%     \cs{Large}        & 小二 & 18   & 30         & 33         \\
%     \cs{LARGE}        & 二号 & 22   & 36.67      & 40.33      \\
%     \cs{huge}         & 小一 & 24   & 40         & 44         \\
%     \cs{Huge}         & 一号 & 26   & 43.33      & 47.67      \\
%     \bottomrule
%   \end{tabular}
% \end{table}
%
% 表达式的行距根据需要采用，段前6磅、段后6磅。
%
% 注意重定义 \normalsize 应在 \pkg{unicode-math} 的 \cs{setmathfont} 前。
\cs_set:Npn \__ustc_set_font_size:
  {
    \ifustc@degree@graduate
      \cs_set:Npn \normalsize
        {
          \@setfontsize \normalsize { 12 bp } { 20 bp }
          \skip_set:Nn \abovedisplayskip { 6 bp plus 3 bp minus 3 bp }
          \skip_set:Nn \abovedisplayshortskip { 6 bp plus 3 bp minus 3 bp }
          \skip_set_eq:NN \belowdisplayshortskip \abovedisplayshortskip
          \skip_set_eq:NN \belowdisplayskip \abovedisplayskip
          \cs_set_eq:NN \@listi \@listI
        }
      %
      % 注意第~\ref{sec:list} 节去掉了列表的间距，所以不再修改 \cs{@listi}。
    \else
      \cs_set:Npn \normalsize
        {
          \@setfontsize \normalsize { 12 bp } { 22 bp }
          \skip_set:Nn \abovedisplayskip { 6 bp plus 3 bp minus 3 bp }
          \skip_set:Nn \abovedisplayshortskip { 6 bp plus 3 bp minus 3 bp }
          \skip_set_eq:NN \belowdisplayshortskip \abovedisplayshortskip
          \skip_set_eq:NN \belowdisplayskip \abovedisplayskip
          \cs_set_eq:NN \@listi \@listI
        }
    \fi
    \normalsize
    \cs_if_exist:NT \MakeRobust
      { \MakeRobust \normalsize }
  }
\__ustc_set_font_size:

\tl_new:N \l__ustc_degree_code_tl
\ustc@option@hook { degree } { \tl_use:N \l__ustc_degree_code_tl}
\tl_put_right:Nn \l__ustc_degree_code_tl { \__ustc_set_font_size: }

% 设置行距的倍数为 1。
\linespread { 1 } \selectfont


% 检测系统
\bool_new:N \l__ustc_platform_mac_bool
\prg_new_conditional:Nnn \__ustc_if_platform_mac: { T , F , TF }
  {
    \bool_if:NTF \l__ustc_platform_mac_bool
      { \prg_return_true: }
      { \prg_return_false: }
  }

\bool_set_false:N \l__ustc_platform_mac_bool
\sys_if_platform_unix:T
  {
    \file_if_exist:nT { /System/Library/Fonts/Menlo.ttc }
      { \bool_set_true:N \l__ustc_platform_mac_bool }
  }

% 处理 \opt{fontset}
\ifustc@fontset@auto
  \sys_if_platform_windows:TF
    { \ustcsetup { fontset = windows } }
    {
      \fontspec_font_if_exist:nTF { SimSun }
        { \ustcsetup { fontset = windows} }
        {
          \__ustc_if_platform_mac:TF
            { \ustcsetup { fontset = mac } }
            {
              \fontspec_font_if_exist:nTF { Noto~ Serif~ CJK~ SC }
                { \ustcsetup { fontset = ubuntu } }
                { \ustcsetup { fontset = fandol } }
            }
        }
    }
\fi

% 《撰写手册》要求西文字体使用 Times New Roman 和 Arial，
% 但是在 Linux 下没有这两个字体，所以使用它们的克隆版 TeX Gyre Termes 和
% TeX Gyre Heros。
\cs_new:Npn \__ustc_set_font_auto:
  {
    \ifustc@fontset@windows
      \ustcsetup { font = times }
    \else
      \ifustc@fontset@mac
        \ustcsetup { font = times }
      \else
        \ustcsetup { font = termes }
      \fi
    \fi
  }

% Times New Roman + Arial
\cs_new:Npn \__ustc_set_font_times:
  {
    \setmainfont { Times~ New~ Roman }
    \setsansfont { Arial }
    \setmonofont { Courier~ New } [ Scale = MatchLowercase ]
  }

% TeX Gyre Termes
\cs_new:Npn \__ustc_set_font_termes:
  {
    \setmainfont { texgyretermes }
      [
        Extension      = .otf ,
        UprightFont    = *-regular ,
        BoldFont       = *-bold ,
        ItalicFont     = *-italic ,
        BoldItalicFont = *-bolditalic ,
      ]
    \__ustc_set_texgyre_sans_mono:
  }

\cs_new:Npn \__ustc_set_texgyre_sans_mono:
  {
    \setsansfont { texgyreheros }
      [
        Extension      = .otf ,
        UprightFont    = *-regular ,
        BoldFont       = *-bold ,
        ItalicFont     = *-italic ,
        BoldItalicFont = *-bolditalic ,
      ]
    \setmonofont { texgyrecursor }
      [
        Extension      = .otf ,
        UprightFont    = *-regular ,
        BoldFont       = *-bold ,
        ItalicFont     = *-italic ,
        BoldItalicFont = *-bolditalic ,
        Scale          = MatchLowercase ,
        Ligatures      = CommonOff ,
      ]
  }

% STIX Two 字体。
% STIX 文件名在 v2.10 2020-12-19 从
% \file{STIX2Text-Regular.otf}、\file{STIX2Math.otf} 分别改为
% \file{STIXTwoText-Regular.otf}、\file{STIXTwoMath-Regular.otf}。
\tl_new:N \l__ustc_stix_font_family_tl
\tl_new:N \l__ustc_font_name_stix_math_tl
\tl_new:N \l__ustc_stix_math_font_name_tl
\cs_new:Npn \__ustc_set_stix_names:
  {
    \tl_if_empty:NT \l__ustc_stix_font_family_tl
      {
        \IfFontExistsTF { STIXTwoText-Regular.otf }
          {
            \tl_set:Nn \l__ustc_stix_font_family_tl { STIXTwoText }
            \tl_set:Nn \l__ustc_font_name_stix_math_tl { STIXTwoMath-Regular }
          }
          {
            \tl_set:Nn \l__ustc_stix_font_family_tl { STIX2Text }
            \tl_set:Nn \l__ustc_font_name_stix_math_tl { STIX2Math }
          }
      }
  }

\cs_new:Npn \__ustc_set_font_stix:
  {
    \__ustc_set_stix_names:
    \exp_args:NV \setmainfont \l__ustc_stix_font_family_tl
      [
        Extension      = .otf ,
        UprightFont    = *-Regular ,
        BoldFont       = *-Bold ,
        ItalicFont     = *-Italic ,
        BoldItalicFont = *-BoldItalic ,
      ]
    \__ustc_set_texgyre_sans_mono:
  }

% XITS 字体。
% XITS 的文件名在 v1.109 2018-09-30
% 从 \file{xits-regular.otf}、\file{xits-math.otf} 分别改为
% \file{XITS-Regular.otf}、\file{XITSMath-Regular.otf}。
\tl_new:N \l__ustc_xits_font_family_tl
\tl_new:N \l__ustc_font_style_xits_rm_tl
\tl_new:N \l__ustc_font_style_xits_bf_tl
\tl_new:N \l__ustc_font_style_xits_it_tl
\tl_new:N \l__ustc_font_style_xits_bf_it_tl
\tl_new:N \l__ustc_font_name_xits_math_tl
\cs_new:Npn \__ustc_set_xits_names:
  {
    \tl_if_empty:NT \l__ustc_xits_font_family_tl
      {
        \fontspec_font_if_exist:nTF {XITSMath-Regular.otf}
          {
            \tl_set:Nn \l__ustc_xits_font_family_tl { XITS }
            \tl_set:Nn \l__ustc_font_style_xits_rm_tl { Regular }
            \tl_set:Nn \l__ustc_font_style_xits_bf_tl { Bold }
            \tl_set:Nn \l__ustc_font_style_xits_it_tl { Italic }
            \tl_set:Nn \l__ustc_font_style_xits_bf_it_tl { BoldItalic }
            \tl_set:Nn \l__ustc_font_name_xits_math_tl { XITSMath-Regular }
          }
          {
            \tl_set:Nn \l__ustc_xits_font_family_tl { xits }
            \tl_set:Nn \l__ustc_font_style_xits_rm_tl { regular }
            \tl_set:Nn \l__ustc_font_style_xits_bf_tl { bold }
            \tl_set:Nn \l__ustc_font_style_xits_it_tl { italic }
            \tl_set:Nn \l__ustc_font_style_xits_bf_it_tl { bolditalic }
            \tl_set:Nn \l__ustc_font_name_xits_math_tl { xits-math }
          }
      }
  }

\cs_set:Npn \__ustc_set_font_xits:
  {
    \__ustc_set_xits_names:
    \exp_args:NV \setmainfont \l__ustc_xits_font_family_tl
      [
        Extension      = .otf ,
        UprightFont    = *- \l__ustc_font_style_xits_rm_tl ,
        BoldFont       = *- \l__ustc_font_style_xits_bf_tl ,
        ItalicFont     = *- \l__ustc_font_style_xits_it_tl ,
        BoldItalicFont = *- \l__ustc_font_style_xits_bf_it_tl ,
      ]
    \__ustc_set_texgyre_sans_mono:
  }

% New Computer Modern
\cs_new:Npn \ustc_set_font_newcm:
  {
    \setmainfont { NewCM10 }
      [
        Extension      = .otf ,
        UprightFont    = *-Book ,
        BoldFont       = *-Bold ,
        ItalicFont     = *-BookItalic ,
        BoldItalicFont = *-BoldItalic ,
      ]
    \setsansfont{ NewCMSans10 }
      [
        Extension      = .otf ,
        UprightFont    = *-Book ,
        BoldFont       = *-Bold ,
        ItalicFont     = *-BookOblique ,
        BoldItalicFont = *-BoldOblique ,
      ]
    \setmonofont { NewCMMono10 }
      [
        Extension      = .otf ,
        UprightFont    = *-Book ,
        ItalicFont     = *-BookItalic ,
        BoldFont       = *-Bold ,
        BoldItalicFont = *-BoldOblique ,
      ]
  }

% Latin Modern
\cs_new:Npn \ustc_set_font_lm:
  {
    \setmainfont { lmroman10 }
      [
        Extension      = .otf ,
        UprightFont    = *-regular ,
        BoldFont       = *-bold ,
        ItalicFont     = *-italic ,
        BoldItalicFont = *-bolditalic ,
      ]
    \setsansfont { lmsans10 }
      [
        Extension      = .otf ,
        UprightFont    = *-regular ,
        BoldFont       = *-bold ,
        ItalicFont     = *-oblique ,
        BoldItalicFont = *-boldoblique ,
      ]
    \setmonofont { lmmonolt10 }
      [
        Extension      = .otf ,
        UprightFont    = *-regular ,
        BoldFont       = *-bold ,
        ItalicFont     = *-oblique ,
        BoldItalicFont = *-boldoblique ,
      ]
  }

\cs_new:Npn \__ustc_set_font_newtx:
  { \RequirePackage { newtxtext } }

\cs_new:Npn \__ustc_set_font:
  { \use:c { __ustc_set_font_ \ustc@font : } }
\ustc@option@hook { font } { \__ustc_set_font: }
\__ustc_set_font:

% 中文字体
\ifustc@cjk@font@auto
  \ifustc@fontset@mac
    \ustcsetup { cjk-font = mac }
  \else
    \ifustc@fontset@windows
      \ustcsetup { cjk-font = windows }
    \else
      \ifustc@fontset@ubuntu
        \ustcsetup { cjk-font = noto }
      \else
        \ustcsetup { cjk-font = fandol }
      \fi
    \fi
  \fi
\fi

% Windows 的中易字体。
\cs_new:Npn \__ustc_set_cjk_font_windows:
  {
    \setCJKmainfont { SimSun }
      [
        AutoFakeBold = 3 ,
        ItalicFont   = KaiTi ,
      ]
    \setCJKsansfont { SimHei } [ AutoFakeBold = 3 ]
    \setCJKmonofont { FangSong }
    \setCJKfamilyfont { zhsong } { SimSun } [ AutoFakeBold = 3 ]
    \setCJKfamilyfont { zhhei } { SimHei } [ AutoFakeBold = 3 ]
    \setCJKfamilyfont { zhkai } { KaiTi }
    \setCJKfamilyfont { zhfs } { FangSong }
  }

% macOS 的华文字体。
\cs_new:Npn \__ustc_set_cjk_font_mac:
  {
    \defaultCJKfontfeatures { }
    \setCJKmainfont { Songti~ SC }
      [
        UprightFont    = *~ Light ,
        BoldFont       = *~ Bold ,
        ItalicFont     = Kaiti~ SC~ Regular ,
        BoldItalicFont = Kaiti~ SC~ Bold ,
      ]
    \setCJKsansfont { Heiti~ SC }
      [
        UprightFont    = *~ Light ,
        BoldFont       = *~ Medium ,
      ]
    \setCJKmonofont { STFangsong }
    \setCJKfamilyfont { zhsong } { Songti~ SC }
      [
        UprightFont    = *~ Light ,
        BoldFont       = *~ Bold ,
      ]
    \setCJKfamilyfont { zhhei } { Heiti~ SC }
      [
        UprightFont    = *~ Light ,
        BoldFont       = *~ Medium ,
      ]
    \setCJKfamilyfont { zhfs } { STFangsong }
    \setCJKfamilyfont { zhkai } { Kaiti~ SC }
      [
        UprightFont    = *~ Regular ,
        BoldFont       = *~ Bold ,
      ]
    \setCJKfamilyfont { zhli } { Baoli~ SC }
    \setCJKfamilyfont { zhyuan } { Yuanyi~ SC }
      [
        UprightFont    = *~ Light ,
        BoldFont       = *~ Bold ,
      ]
  }

% Fandol 字体。
\cs_new:Npn \__ustc_set_cjk_font_fandol:
  {
    \defaultCJKfontfeatures { }
    \setCJKmainfont { FandolSong }
      [
        Extension   = .otf ,
        UprightFont = *-Regular ,
        BoldFont    = *-Bold ,
        ItalicFont  = FandolKai-Regular ,
        ItalicFeatures = { Extension = .otf } ,
      ]
    \setCJKsansfont { FandolHei }
      [
        Extension   = .otf ,
        UprightFont = *-Regular ,
        BoldFont    = *-Bold ,
      ]
    \setCJKmonofont { FandolFang }
      [
        Extension   = .otf ,
        UprightFont = *-Regular ,
      ]
    \setCJKfamilyfont { zhsong } { FandolSong }
      [
        Extension   = .otf ,
        UprightFont = *-Regular ,
        BoldFont    = *-Bold ,
      ]
    \setCJKfamilyfont { zhhei } { FandolHei }
      [
        Extension   = .otf ,
        UprightFont = *-Regular ,
        BoldFont    = *-Bold ,
      ]
    \setCJKfamilyfont { zhfs } { FandolFang }
      [
        Extension   = .otf ,
        UprightFont = *-Regular ,
      ]
    \setCJKfamilyfont { zhkai } { FandolKai }
      [
        Extension   = .otf ,
        UprightFont = *-Regular ,
      ]
  }

\ifustc@cjk@font@none \else
  \providecommand \songti { \CJKfamily { zhsong } }
  \providecommand \heiti { \CJKfamily { zhhei } }
  \providecommand \fangsong { \CJKfamily { zhfs } }
  \providecommand \kaishu { \CJKfamily { zhkai } }
\fi

\cs_new:Npn \__ustc_set_cjk_font:
  {
    \use:c { __ustc_set_cjk_font_ \ustc@cjk@font : }
  }
\ustc@option@hook { cjk-font } { \__ustc_set_cjk_font: }
\__ustc_set_cjk_font:

\ExplSyntaxOff

% 数学字体

% 设置数学符号风格。
\newcommand\ustc@set@math@style{%
  \ifustc@math@style@TeX
    \ustcsetup{
      uppercase-greek    = upright,
      less-than-or-equal = horizontal,
      integral           = slanted,
      integral-limits    = false,
      partial            = italic,
      math-ellipsis      = AMS,
      real-part          = fraktur,
    }%
  \else
    \ustcsetup{
      uppercase-greek = italic,
      integral        = upright,
      partial         = upright,
      real-part       = roman,
    }%
    \ifustc@math@style@ISO
      \ustcsetup{
        less-than-or-equal = horizontal,
        integral-limits    = true,
        math-ellipsis      = lower,
      }%
    \else
      \ifustc@math@style@GB
        \ustcsetup{
          less-than-or-equal = slanted,
          integral-limits    = false,
          math-ellipsis      = centered,
        }%
      \fi
    \fi
  \fi
}

\ifustc@main@language@chinese
  \ustcsetup{math-style = GB}%
\else
  \ustcsetup{math-style = TeX}%
\fi

\ustc@set@math@style
\ustc@option@hook{math-style}{\ustc@set@math@style}
\ustc@option@hook{main-language}{%
  \ifustc@main@language@chinese
    \ustcsetup{math-style = GB}%
  \else
    \ustcsetup{math-style = TeX}%
  \fi
}

% 针对 \pkg{unicode-math} 逐项配置数学符号。

\newcommand\ustc@set@unimath@leq{%
  \ifustc@leq@horizontal
    \ifx\@begindocumenthook\@undefined
      \let\le\ustc@save@leq
      \let\ge\ustc@save@geq
      \let\leq\ustc@save@leq
      \let\geq\ustc@save@geq
    \else
      \AtBeginDocument{%
        \let\le\ustc@save@leq
        \let\ge\ustc@save@geq
        \let\leq\ustc@save@leq
        \let\geq\ustc@save@geq
      }%
    \fi
  \else
    \ifustc@leq@slanted
      \ifx\@begindocumenthook\@undefined
        \let\le\leqslant
        \let\ge\geqslant
        \let\leq\leqslant
        \let\geq\geqslant
      \else
        \AtBeginDocument{%
          \let\le\leqslant
          \let\ge\geqslant
          \let\leq\leqslant
          \let\geq\geqslant
        }%
      \fi
    \fi
  \fi
}
\newcommand\ustc@set@unimath@integral@limits{%
  \ifustc@integral@limits@true
    \removenolimits{%
      \int\iint\iiint\iiiint\oint\oiint\oiiint
      \intclockwise\varointclockwise\ointctrclockwise\sumint
      \intbar\intBar\fint\cirfnint\awint\rppolint
      \scpolint\npolint\pointint\sqint\intlarhk\intx
      \intcap\intcup\upint\lowint
    }%
  \else
    \addnolimits{%
      \int\iint\iiint\iiiint\oint\oiint\oiiint
      \intclockwise\varointclockwise\ointctrclockwise\sumint
      \intbar\intBar\fint\cirfnint\awint\rppolint
      \scpolint\npolint\pointint\sqint\intlarhk\intx
      \intcap\intcup\upint\lowint
    }%
  \fi
}
\newcommand\ustc@set@unimath@ellipsis{%
  \ifustc@math@ellipsis@centered
    \DeclareRobustCommand\mathellipsis{\mathinner{\unicodecdots}}%
  \else
    \DeclareRobustCommand\mathellipsis{\mathinner{\unicodeellipsis}}%
  \fi
}
\newcommand\ustc@set@unimath@real@part{%
  \ifustc@real@part@roman
    \AtBeginDocument{%
      \def\Re{\operatorname{Re}}%
      \def\Im{\operatorname{Im}}%
    }%
  \else
    \AtBeginDocument{%
      \let\Re\ustc@save@Re
      \let\Im\ustc@save@Im
    }%
  \fi
}

\newcommand\ustc@set@unimath@style{%
  \ifustc@uppercase@greek@upright
    \unimathsetup{math-style = TeX}%
  \else
    \ifustc@uppercase@greek@italic
      \unimathsetup{math-style = ISO}%
    \fi
  \fi
  \ifustc@math@style@TeX
    \unimathsetup{bold-style = TeX}%
  \else
    \unimathsetup{bold-style = ISO}%
  \fi
  \ustc@set@unimath@leq
  \ustc@set@unimath@integral@limits
  \ifustc@partial@upright
    \unimathsetup{partial = upright}%
  \else
    \ifustc@partial@italic
      \unimathsetup{partial = italic}%
    \fi
  \fi
  \ustc@set@unimath@ellipsis
  \ustc@set@unimath@real@part
}

\newcommand\ustc@qed{\rule{1ex}{1ex}}
\newcommand\ustc@load@unimath{%
  \@ifpackageloaded{unicode-math}{}{%
    \RequirePackage{unicode-math}%
    \AtBeginDocument{%
      \let\ustc@save@leq\leq
      \let\ustc@save@geq\geq
      \let\ustc@save@Re\Re
      \let\ustc@save@Im\Im
    }%
    %
    % 兼容旧的粗体命令：\pkg{bm} 的 \cs{bm} 和 \pkg{amsmath} 的 \cs{boldsymbol}。
    \DeclareRobustCommand\bm[1]{{\symbfit{##1}}}%
    \DeclareRobustCommand\boldsymbol[1]{{\symbfit{##1}}}%
    %
    % 兼容 \pkg{amsfonts} 和 \pkg{amssymb} 中的一些命令。
    \newcommand\square{\mdlgwhtsquare}%
    \newcommand\blacksquare{\mdlgblksquare}%
    \AtBeginDocument{%
      \renewcommand\checkmark{\ensuremath{✓}}%
    }%
    %
    % 兼容 \pkg{amsthm} 的 \cs{qedsymbol}。
    \renewcommand\ustc@qed{\ensuremath{\QED}}%
  }%
}

\ExplSyntaxOn

% STIX Two Math
\cs_new:Npn \__ustc_set_math_font_stix:
  {
    \ustc@load@unimath
    \ustc@set@unimath@style
    \ustc@set@stix@names
    \exp_args:NV \setmathfont \l__ustc_font_name_stix_math_tl
      [
        Extension    = .otf ,
        Scale        = MatchLowercase ,
        StylisticSet = \ustc@xits@integral@stylistic@set ,
      ]
    \exp_args:NV \setmathfont \l__ustc_font_name_stix_math_tl
      [
        Extension    = .otf ,
        Scale        = MatchLowercase ,
        StylisticSet = 1 ,
        range        = { scr , bfscr } ,
      ]
  }

% XITS Math
\tl_new:N \l__ustc_xits_integral_stylistic_set_tl
\tl_set:Nn \l__ustc_xits_integral_stylistic_set_tl
  {
    \ifustc@integral@upright
      8
    \fi
  }

\cs_new:Npn \__ustc_set_math_font_xits:
  {
    \ustc@load@unimath
    \ustc@set@unimath@style
    \__ustc_set_xits_names:
    \exp_args:NV \setmathfont \l__ustc_font_name_xits_math_tl
      [
        Extension    = .otf ,
        Scale        = MatchLowercase ,
        StylisticSet = \l__ustc_xits_integral_stylistic_set_tl ,
      ]
    % 使用 STIX Two Math 的 `\mathcal` 字形
    \__ustc_set_stix_names:
    \exp_args:NV \setmathfont \l__ustc_font_name_stix_math_tl
      [
        Extension    = .otf ,
        Scale        = MatchLowercase ,
        range        = { cal, bfcal } ,
      ]
  }

% New Computer Modern Math
\tl_new:N \l__ustc_newcm_integral_stylistic_set_tl
\tl_set:Nn \l__ustc_newcm_integral_stylistic_set_tl
  {
    \ifustc@integral@upright
      2
    \fi
  }
\cs_new:Npn \__ustc_set_math_font_newcm:
  {
    \ustc@load@unimath
    \ustc@set@unimath@style
    \setmathfont { NewCMMath-Book }
      [
        Extension    = .otf ,
        StylisticSet = \l__ustc_newcm_integral_stylistic_set_tl ,
      ]
    \setmathfont { NewCMMath-Book }
      [
        Extension    = .otf ,
        StylisticSet = 1 ,
        range        = {scr,bfscr} ,
      ]%
    \setmathrm { NewCM10 }
      [
        Extension      = .otf ,
        UprightFont    = *-Book ,
        BoldFont       = *-Bold ,
        ItalicFont     = *-BookItalic ,
        BoldItalicFont = *-BoldItalic ,
      ]
    \setmathsf { NewCMSans10 }
      [
        Extension      = .otf ,
        UprightFont    = *-Book ,
        BoldFont       = *-Bold ,
        ItalicFont     = *-BookOblique ,
        BoldItalicFont = *-BoldOblique ,
      ]%
    \setmathtt { NewCMMono10 }
      [
        Extension      = .otf ,
        UprightFont    = *-Book ,
        ItalicFont     = *-BookItalic ,
        BoldFont       = *-Bold ,
        BoldItalicFont = *-BoldOblique ,
      ]%
  }

% Latin Modern Math
\cs_new:Npn \__ustc_set_math_font_lm:
  {
    \ustc@load@unimath
    \ustc@set@unimath@style
    \setmathfont { latinmodern-math } [ Extension = .otf ]
    \setmathrm { lmroman10 }
      [
        Extension      = .otf ,
        UprightFont    = *-regular ,
        BoldFont       = *-bold ,
        ItalicFont     = *-italic ,
        BoldItalicFont = *-bolditalic ,
      ]
    \setmathsf { lmsans10 }
      [
        Extension      = .otf ,
        UprightFont    = *-regular ,
        BoldFont       = *-bold ,
        ItalicFont     = *-oblique ,
        BoldItalicFont = *-boldoblique ,
      ]
    \setmathtt { lmmonolt10 }
      [
        Extension      = .otf ,
        UprightFont    = *-regular ,
        BoldFont       = *-bold ,
        ItalicFont     = *-oblique ,
        BoldItalicFont = *-boldoblique ,
      ]
  }

% NewTX Math
% 注意 NewTX Math 是 Type 1 字体，如果正文西文使用了 OpenType 字体时需要小心处理。
\cs_new:Npn \__ustc_set_math_font_newtx:
  {
    \ifustc@font@newtx\else
      \let\ustc@save@encodingdefault\encodingdefault
      \let\ustc@save@rmdefault\rmdefault
      \let\ustc@save@sfdefault\sfdefault
      \let\ustc@save@ttdefault\ttdefault
      \RequirePackage[T1]{fontenc}%
      \renewcommand{\rmdefault}{ntxtlf}%
      \renewcommand{\sfdefault}{qhv}%
      \renewcommand{\ttdefault}{ntxtt}%
    \fi
    \ifustc@uppercase@greek@italic
      \PassOptionsToPackage{slantedGreek}{newtxmath}%
    \fi
    \ifustc@integral@upright
      \PassOptionsToPackage{upint}{newtxmath}%
    \fi
    \RequirePackage{newtxmath}
    \let\ustc@save@leq\leq
    \let\ustc@save@geq\geq
    \ifustc@leq@slanted
      \let\le\leqslant
      \let\ge\geqslant
      \let\leq\leqslant
      \let\geq\geqslant
    \fi
    \ifustc@integral@limits@true
      \let\ilimits@\displaylimits
    \fi
    \let\ustc@save@partial\partial
    \ifustc@partial@upright
      \let\partial\uppartial
    \fi
    \ifustc@math@ellipsis@centered
      \DeclareRobustCommand\mathellipsis{\mathinner{\cdotp\cdotp\cdotp}}%
    \else
      \DeclareRobustCommand\mathellipsis{\mathinner{\ldotp\ldotp\ldotp}}%
    \fi
    \let\ustc@save@Re\Re
    \let\ustc@save@Im\Im
    \ifustc@real@part@roman
      \def\Re{\operatorname{Re}}%
      \def\Im{\operatorname{Im}}%
    \fi
    \RequirePackage{bm}%
    \ifustc@font@newtx\else
      \let\encodingdefault\ustc@save@encodingdefault
      \let\rmdefault\ustc@save@rmdefault
      \let\sfdefault\ustc@save@sfdefault
      \let\ttdefault\ustc@save@ttdefault
    \fi
    \DeclareRobustCommand\symup[1]{{\mathrm{##1}}}%
    \DeclareRobustCommand\symbf[1]{{\bm{##1}}}%
    \DeclareRobustCommand\symbfsf[1]{{\bm{##1}}}%
    \let\increment\upDelta%
    \renewcommand\ustc@qed{\openbox}%
  }

% Computer Modern
% 使用 LaTeX 默认的 cm 字体
\cs_new:Npn \__ustc_set_math_font_cm:
  {
    \RequirePackage{amssymb}
    \let\ustc@save@leq\leq
    \let\ustc@save@geq\geq
    \ifustc@leq@slanted
      \let\le\leqslant
      \let\ge\geqslant
      \let\leq\leqslant
      \let\geq\geqslant
    \fi
    \ifustc@integral@limits@true
      \let\ilimits@\displaylimits
    \fi
    \ifustc@math@ellipsis@centered
      \DeclareRobustCommand\mathellipsis{\mathinner{\cdotp\cdotp\cdotp}}%
    \else
      \DeclareRobustCommand\mathellipsis{\mathinner{\ldotp\ldotp\ldotp}}%
    \fi
    \let\ustc@save@Re\Re
    \let\ustc@save@Im\Im
    \ifustc@real@part@roman
      \def\Re{\operatorname{Re}}%
      \def\Im{\operatorname{Im}}%
    \fi
    \RequirePackage{bm}%
    \DeclareRobustCommand\symup[1]{{\mathrm{##1}}}%
    \DeclareRobustCommand\symbf[1]{{\bm{##1}}}%
    \DeclareRobustCommand\symbfsf[1]{{\bm{##1}}}%
    \let\increment\Delta
    \renewcommand\ustc@qed{\openbox}%
    \let\uppi\pi
  }

% 不设置数学字体，仅提供兼容支持。
\cs_new:Npn \__ustc_set_math_font_none:
  {
    \RequirePackage{amssymb}
    \RequirePackage{bm}%
    \DeclareRobustCommand\symup[1]{{\mathrm{##1}}}%
    \DeclareRobustCommand\symbf[1]{{\bm{##1}}}%
    \DeclareRobustCommand\symbfsf[1]{{\bm{##1}}}%
    \let\increment\Delta
    \renewcommand\ustc@qed{\openbox}%
    \let\uppi\pi
  }

\cs_new:Npn \__ustc_set_math_font:
  { \use:c { __ustc_set_math_font_ \ustc@math@font : } }
\ustc@option@hook { math-font }
  { \tl_gput_right:Nn \ustc@setup@hook { \__ustc_set_math_font: } }
\cs_new:Npn \__ustc_set_math_font_auto:
  {
    \ifustc@math@font@auto
      \ustcsetup { math-font = xits }
    \fi
  }
\hook_gput_code:nnn { package / siunitx / before } { . }
  { \__ustc_set_math_font_auto: }
\hook_gput_code:nnn { begindocument / before } { . }
  {
    \__ustc_set_math_font_auto:
    \cs_if_exist:NF \square
      { \RequirePackage { amssymb } }
  }



% \subsection{纸张和页面}
% 使用 \pkg{geometry} 宏包设置纸张和页面。

% 纸张：A4；

% 纸张大小：标准A4（21.0cm×29.7cm）尺寸。
% 页边距：上、下、左、右、装订线的页边距分别为：2.54cm，2.54cm，3.17cm，3.17cm，0cm。装订线位置：左。左右对称页边距。
% 页眉距边界2.0cm
% 页脚距边界1.75cm
% Word 模板中，页眉线是跟版心上边缘重合的，所以 headsep 设为 1pt，防止页眉线与版心内容重叠（#413）。
\geometry
  {
    paper      = a4paper ,
    vmargin    = 2.54 cm ,
    hmargin    = 3.17 cm ,
    headheight = 0.54 cm ,
    headsep    = 1 pt ,
    footskip   = 0.79 cm ,
  }

% 使用 \pkg{fancy} 需要先调用 |\pagestyle{fancy}| 再修改 \cs{chaptermark} 和
% \cs{sectionmark}。
\pagestyle { fancy }
\cs_set_eq:NN \sectionmark \use_none:n
\cs_set:Npn \headrulewidth { 0.75 bp }

% 重定义默认的 |plain| page style，会显示页眉和页脚。
\fancypagestyle { plain }
  {
    \fancyhf { }
    %
    % 页眉与该部分的章标题相同，宋体 10.5 磅（五号）居中。
    % 页码：宋体 10.5 磅、页面下脚居中。
    \ifustc@degree@graduate
      \cs_set:Npn \__ustc_hf_font: { \fontsize { 10.5 bp } { 12 bp } \selectfont }
      \fancyhead [ C ] { \__ustc_hf_font: \leftmark }
      \fancyfoot [ C ] { \__ustc_hf_font: \thepage }
      \cs_set_eq:NN \@mkboth \markboth
      \cs_set:Npn \chaptermark ##1
        { \markboth { \CTEXifname { \CTEXthechapter \quad } { } ##1 } { } }
      \cs_set_eq:NN \sectionmark \use_none:n
    \else
      %
      % 本科生要求除封面、扉页外，每面上部加页眉，
      % 用小 5 号字（9 bp）标注“中国科学技术大学本科毕业论文”，居中；
      % 从目录页开始在每面底部居中用小五宋体（9 bp）连续编页码。
      \cs_set:Npn \__ustc_hf_font: { \fontsize { 9 bp } { 12 bp } \selectfont }
      \fancyhead [ C ] { \__ustc_hf_font: 中国科学技术大学本科毕业论文 }
      \fancyfoot [ C ] { \__ustc_hf_font: \thepage }
      \cs_set_eq:NN \@mkboth \use_none:nn
      \cs_set_eq:NN \chaptermark \use_none:n
      \cs_set_eq:NN \sectionmark \use_none:n
    \fi
  }
\pagestyle { plain }

% |headings| 只有页眉，没有页脚，用于本科生的 front matter。
\fancypagestyle { headings } { \fancyfoot { } }

% 设置特殊的 page style 不改变任何内容，用于每章首页。
\cs_set:Npn \ps@chapter { }
\ctexset { chapter / pagestyle = chapter }

% 空白页不需加页眉（包括页眉线），但需有连续编的页码。
\fancypagestyle { blank }
  {
    \fancyhf { }
    \cs_set:Npn \headrulewidth { 0 pt }
    \fancyfoot [ C ] { \__ustc_hf_font: \thepage }
  }

% 封面部分单面打印，空白页不编页码。
% 正文部分应从另页右页开始，此空白页不需加页眉（包括页眉线），但需有连续编的页码。
% 需要判断是否 `\maketitle` 或 `\copyrightpage` 中的 `\cleardoublepage`。
\newif\ifustc@title@page

\cs_set_nopar:Npn \cleardoublepage
  {
    \clearpage
    \if@twoside
      \int_if_odd:nF { \c@page }
        {
          \hbox:n { }
          % 封面的空白页不显示页码
          \ifustc@degree@graduate
            \ifustc@title@page
              \thispagestyle { empty }
            \else
              \thispagestyle { blank }
            \fi
          \else
            \thispagestyle { empty }
          \fi
          \newpage
          \if@twocolumn
            \hbox:n { }
            \newpage
          \fi
        }
    \fi
  }

% 本科生要求目录中正文每章前多空一行，而目录、附录等章则不需要空行，
% 所以不能简单判断 \cs{if@mainmatter}，需要重新定义 \cs{mainmatter} 等命令。
\bool_new:N \l__ustc_add_toc_space_bool
\ifustc@degree@bachelor
  \bool_set_true:N \l__ustc_add_toc_space_bool
\fi

% 研究生从“摘要”开始页码用 罗马数字，
% 而本科生摘要页只有页眉，从目录页才开始编页码。
\cs_set:Npn \frontmatter
  {
    \cleardoublepage
    \@mainmatterfalse
    \ifustc@degree@graduate
      \pagenumbering { Roman }
      \pagestyle { plain }
    \else
      \pagestyle { headings }
      \bool_set_false:N \l__ustc_add_toc_space_bool
    \fi
  }

% 研究生正文部分应从另页右页开始，页码用阿拉伯数字
\cs_set:Npn \mainmatter
  {
    \ifustc@degree@graduate
      \cleardoublepage
      \pagenumbering { arabic }
    \else
      \clearpage
      \bool_set_true:N \l__ustc_add_toc_space_bool
    \fi
    \pagestyle { plain }
    \@mainmattertrue
  }

\cs_new_eq:NN \__ustc_save_appendix: \appendix
\cs_set_protected:Npn \appendix
  {
    \__ustc_save_appendix:
    \@mainmattertrue
    \bool_set_false:N \l__ustc_add_toc_space_bool
  }

\cs_set:Npn \backmatter
  {
    \if@openright
      \cleardoublepage
    \else
      \clearpage
    \fi
    \@mainmatterfalse
    \ifustc@degree@bachelor
      \bool_set_false:N \l__ustc_add_toc_space_bool
    \fi
  }

\ExplSyntaxOff


% \subsection{封面}

% 定义用户接口：
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
    default = {导师},
  },
  supervisor* = {
    default = {Supervisor Name},
    name    = supervisor@en,
  },
  practice-supervisor = {
    default = {},
    name    = practice@supervisor,
  },
  practice-supervisor* = {
    default = {},
    name    = practice@supervisor@en,
  },
  advisor = {
    name    = practice@supervisor,
  },
  advisor* = {
    name    = practice@supervisor@en,
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
  department,
  student-id = {
    name = student@id,
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

% 导师一栏可能有多个姓名，所以用 \opt{supervisor} 进行收集，
% 然后使用本命令来输出要求的格式，
% 类似于 \LaTeX3 的 \cs{clist\_use:Nn}。
\newcommand\ustc@clist@count[1]{%
  \csname clist_count:N\endcsname{#1}%
}
\newcommand\ustc@clist@use[2]{%
  \csname clist_use:Nn\endcsname{#1}{#2}%
}
\newcommand\ustc@supervisor@names{%
  \ustc@clist@use{\ustc@supervisor}{\quad}
}
\newcommand\ustc@practice@supervisor@names{%
  \ustc@clist@use{\ustc@practice@supervisor}{\quad}
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
\newcommand\ustc@practice@supervisor@en@line{%
  \setcounter{ustc@count}{\ustc@clist@count{\ustc@practice@supervisor@en}}%
  \ifnum\c@ustc@count>1\relax
    Practice supervisors:%
  \else
    Practice supervisor:%
  \fi
  \space\ustc@clist@use{\ustc@practice@supervisor@en}{, }%
}

% 输出日期的给定格式：\cs{ustc@format@date}\marg{format}\marg{date}，
% 其中格式 \meta{format} 接受三个参数分别对应年、月、日，
% \meta{date} 是 ISO 格式的日期（yyyy-mm-dd）。
\newcommand\ustc@format@date[2]{%
  \edef\ustc@@date{#2}%
  \def\ustc@@process@date##1-##2-##3\@nil{%
    #1{##1}{##2}{##3}%
  }%
  \expandafter\ustc@@process@date\ustc@@date\@nil
}
\newcommand\ustc@date@format@zh@small[3]{\number#1 年 \number#2 月 \number#3 日}
\newcommand\ustc@date@format@zh@big[3]{\zhdigits{#1}年\zhnumber{#2}月\zhnumber{#3}日}
\newcommand\ustc@date@month[1]{%
  \ifcase\number#1\or
    January\or February\or March\or April\or May\or June\or
    July\or August\or September\or October\or November\or December%
  \fi
}
\newcommand\ustc@date@format@zh@short[3]{\number#1 年 \number#2 月}
\newcommand\ustc@date@format@en[3]{\ustc@date@month{#2} \number#3, #1}
\newcommand\ustc@date@zh@small{\ustc@format@date{\ustc@date@format@zh@small}{\ustc@date}}
\newcommand\ustc@date@zh@big{\ustc@format@date{\ustc@date@format@zh@big}{\ustc@date}}
\newcommand\ustc@date@zh@short{\ustc@format@date{\ustc@date@format@zh@short}{\ustc@date}}
\newcommand\ustc@date@en{\ustc@format@date{\ustc@date@format@en}{\ustc@date}}

% 版本 v3.2 开始使用 \cs{ustcsetup} 设置接口，
% 兼容旧版本的命令式设置。
% Reserved for compatibility until 2020-07-01.
\def\ustc@define@term#1#2{%
  \expandafter\gdef\csname #1\endcsname##1{%
    \ustc@deprecated{'\expandafter\protect\csname #1\endcsname' command}{2020-07-01}{'\protect\ustcsetup'}%
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
\gdef\date#1{\renewcommand\ustc@date@zh@big{#1}}
\gdef\endate#1{\renewcommand\ustc@date@en{#1}}
\ustc@define@term{professionaltype}{professional-type}
\ustc@define@term{enprofessionaltype}{professional-type*}
\ustc@define@term{secretlevel}{secret-level}
\ustc@define@term{ensecretlevel}{secret-level*}
\ustc@define@term{secretyear}{secret-year}
\gdef\keywords#1{\renewcommand\ustc@keywords@text{#1}}
\gdef\enkeywords#1{\renewcommand\ustc@keywords@en@text{#1}}

% 定义一些常量。
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
\else
  \ifustc@degree@doctor
    \ifustc@degree@type@professional
      \renewcommand\ustc@thesis@name{专业博士学位论文}
    \else
      \ifustc@degree@type@engineering
        \renewcommand\ustc@thesis@name{工程博士学位论文}
      \fi
    \fi
  \else
    \ifustc@degree@master
      \ifustc@degree@type@professional
        \renewcommand\ustc@thesis@name{专业硕士学位论文}
      \else
        \ifustc@degree@type@engineering
          \renewcommand\ustc@thesis@name{工程硕士学位论文}
        \fi
      \fi
    \fi
  \fi
  \IfFontExistsTF{LiSu}{
    \setCJKfamilyfont{zhli}{LiSu}
    \providecommand\lishu{\CJKfamily{zhli}}
  }{
    \ifustc@cjk@font@mac
      \providecommand\lishu{\CJKfamily{zhli}}
    \else
      \providecommand\lishu{%
        \ustc@warning{Font LiSu is not available}%
        \sffamily
      }
    \fi
  }
\fi

% 定义校徽颜色
%
% 推迟定义颜色以避免调用 \pkg{xcolor} 时的警告
\AtBeginDocument{
  \definecolor{ustcblue}{cmyk}{1,0.8,0,0}
}

% 添加 PDF 书签，在 \pkg{hyperref} 载入后才有效。
\newcommand\ustc@pdfbookmark{\@gobble}

% 重定义 \env{titlepage} 环境，不修改页码。
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

% 中文封面：
% 密级仿宋 14 磅；
% 论文类型黑体 56 磅；
% 论文题目黑体 26 磅加粗居中，单倍行距；
% 作者姓名宋体 16 磅，1.5 倍行距；
\newcommand\ustc@title@page@graduate@zh{%
  \ustcsetup{language=chinese}%
  \begin{titlepage}%
    \ustc@pdfbookmark{封面}%
    \centering
    \parbox[t][0bp][t]{\textwidth}{%
      \raggedleft\fangsong\fontsize{14bp}{14bp}\selectfont
      \null\ustc@secret@level
    }\par
    \vspace{11bp}%
    \includegraphics[height=1.3cm]{figures/ustc-name-stxingkai.pdf}\par
    \vspace{-7bp}%
    \begingroup
      \sffamily\fontsize{54bp}{70.2bp}\selectfont
      \renewcommand\CJKglue{\hspace{-5.2bp}}%
      \ustc@thesis@name\par
    \endgroup
    \parbox[t][0bp][t]{\textwidth}{%
      \fontsize{26bp}{33.8bp}\selectfont
      \ifx\ustc@professional@type\@empty
        \null
      \else
        \lishu （\ustc@professional@type ）%
      \fi
    }\par
    \vspace{37bp}%
    \begingroup
      \ifustc@badge@color@blue
        \color{ustcblue}%
      \fi
      % \hspace{3bp}%
      \includegraphics[height=123bp]{figures/ustc-badge.pdf}\par
    \endgroup
    \vspace{2.8bp}%
    \parbox[t][101.3bp][c]{\textwidth}{%
      \centering\sffamily\bfseries\fontsize{26bp}{33.8bp}\selectfont
      \ustc@title
    }\par
    \vspace{37bp}%
    \parbox[t]{\textwidth}{%
      \hspace{45bp}%
      \parbox[t]{368bp}{%
        % 1.5 行 = 16bp * 1.3 * 1.5
        \fontsize{16bp}{31.2bp}\selectfont
        \textsf{作者姓名：}\quad\ustc@author \par
        \ifustc@degree@type@engineering
          % 工程硕士的封面是“类别领域”，而工程博士的是“学科专业”
          \ifustc@degree@master
            \textsf{类别领域：}\quad\ustc@speciality\par
          \else
            \textsf{学科专业：}\quad\ustc@speciality\par
          \fi
        \else
          \textsf{学科专业：}\quad\ustc@speciality\par
        \fi
        \ifx\ustc@practice@supervisor\@empty
          \textsf{导\hspace{2em}师：}\quad\ustc@supervisor@names \par
        \else
          \textsf{校内导师：}\quad\ustc@supervisor@names \par
          \textsf{实践导师：}\quad\ustc@practice@supervisor@names \par
        \fi
        \textsf{完成时间：}\quad\ustc@date@zh@big\par
      }%
    }%
  \end{titlepage}%
  \ustc@reset@main@language
}

% 英文封面
\newcommand\ustc@title@page@graduate@en{%
  \ustcsetup{language=english}%
  \begin{titlepage}%
    \ustc@pdfbookmark{Title page}%
    \centering
    \parbox[t][0bp][t]{\textwidth}{%
      \raggedleft\fangsong\fontsize{14bp}{14bp}\selectfont
      \null\ustc@secret@level@en
    }\par
    \vspace{5bp}%
    \begingroup
      \fontsize{20bp}{30bp}\selectfont
      University of Science and Technology of China\par
    \endgroup
    \vspace{30bp}%
    \begingroup
      \fontsize{26bp}{30bp}\selectfont
      \ustc@thesis@name@en\par
    \endgroup
    \vspace{68bp}%
    \begingroup
      \ifustc@badge@color@blue
        \color{ustcblue}%
      \fi
      % \hspace{3bp}%
      \includegraphics[height=123bp]{figures/ustc-badge.pdf}\par
    \endgroup
    \vspace{10bp}%
    \parbox[t][90bp][c]{\textwidth}{%
      \centering\sffamily\bfseries\fontsize{26bp}{30bp}\selectfont
      \ustc@title@en
    }\par
    \vspace{48bp}%
    \parbox[t]{\textwidth}{%
      \hspace{61.5bp}%
      \parbox[t]{352bp}{%
        \fontsize{16bp}{30bp}\selectfont
        Author:        \ustc@author@en\par
        Speciality:    \ustc@speciality@en\par
        \ustc@supervisor@en@line\par
        \ifx\ustc@practice@supervisor@en\@empty\else
          \ustc@practice@supervisor@en@line\par
        \fi
        Completion date: \ustc@date@en\par
      }%
    }\par
  \end{titlepage}%
  \ustc@reset@main@language
}

\newbox\ustc@title@box

% 本科生的外封
\newcommand\ustc@cover{%
  \begin{titlepage}%
    \ustc@pdfbookmark{Cover}%
    \centering
    \vspace*{0.8cm}%
    \includegraphics{figures/ustc-title-page-heading.pdf}%
    \vskip 4.3cm%
    \begingroup
      \bfseries\fontsize{15bp}{16bp}\selectfont
      \setlength\tabcolsep{0bp}%
      \setlength\arrayrulewidth{1.5pt}%
      \begin{tabular}{lp{140bp}lp{140bp}}%
        题\quad 目 &
          \multicolumn{3}{c}{%
            \multirow[t]{2}{325bp}{%
              \savebox\ustc@title@box{%
                \parbox[t]{325bp}{%
                  \centering\fontsize{15bp}{40bp}\selectfont
                  \ustc@title
                }%
              }%
              \dp\ustc@title@box=0pt\relax
              \usebox\ustc@title@box
            }%
          } \\
        \cline{2-4}%
        \noalign{\vskip 24bp}%
        & & & \\
        \cline{2-4}%
        \noalign{\vskip 24bp}%
        英\quad 文 &
          \multicolumn{3}{c}{%
            \multirow[t]{3}{325bp}{%
              \savebox\ustc@title@box{%
                \parbox[t]{325bp}{%
                  \centering\fontsize{15bp}{40bp}\selectfont
                  \ustc@title@en
                }%
              }%
              \dp\ustc@title@box=0pt\relax
              \usebox\ustc@title@box
            }%
          } \\
        \cline{2-4}%
        \noalign{\vskip 24bp}%
        题\quad 目 & & & \\
        \cline{2-4}%
        \noalign{\vskip 24bp}%
        & & & \\
        \cline{2-4}%
        \noalign{\vskip 24bp}%
        院\quad 系 & \multicolumn{3}{c}{\ustc@department} \\
        \cline{2-4}%
        \noalign{\vskip 24bp}%
        姓\quad 名 & \multicolumn{1}{c}{\ustc@author} &
        学\quad 号 & \multicolumn{1}{c}{\ustc@student@id} \\
        \cline{2-2}%
        \cline{4-4}%
        \noalign{\vskip 24bp}%
        导\quad 师 & \multicolumn{3}{c}{\ustc@supervisor@names} \\
        \cline{2-4}%
        \noalign{\vskip 24bp}%
        日\quad 期 & \multicolumn{3}{c}{\ustc@date@zh@small} \\
        \cline{2-4}%
      \end{tabular}%
    \endgroup
  \end{titlepage}%
}

% 本科生的扉页（内封）
\newcommand\ustc@title@page@bachelor{%
  \begin{titlepage}%
    \ustc@pdfbookmark{Title page}%
    \centering
    % \vspace*{68bp}%
    \vspace*{29.5bp}%
    \includegraphics{figures/ustc-name-stxingkai.pdf}\par
    \vspace{0.8bp}%
    \begingroup
      \sffamily\fontsize{56bp}{72.8bp}\selectfont
      \renewcommand\CJKglue{\hspace{6.2bp}}%
      本科毕业论文\par
    \endgroup
    \vspace{52bp}%
    \ifustc@badge@color@blue
      \textcolor{ustcblue}{%
        \includegraphics[height=126bp]{figures/ustc-badge.pdf}}%
    \else
      \includegraphics[height=4.1cm]{figures/ustc-badge.pdf}%
    \fi\par
    \vspace{43bp}%
    \parbox[t][115bp][t]{\textwidth}{%
      \centering\sffamily\bfseries\fontsize{26bp}{46.8bp}\selectfont
      \ustc@title\par
    }\par
    \begingroup
      \hspace{10bp}%
      \heiti\fontsize{16bp}{31.7bp}\selectfont
      \setlength\tabcolsep{0bp}%
      \setlength\arrayrulewidth{0.5pt}%
      \setlength\ustc@title@page@item@width{238bp}%
      \begin{tabular}{p{90bp}c}%
        作者姓名： & \makebox[238bp]{\ustc@author} \\
        \cline{2-2}%
        学\quad\quad 号： & \makebox[238bp]{\ustc@student@id} \\
        \cline{2-2}%
        专\quad\quad 业： & \makebox[238bp]{\ustc@speciality} \\
        \cline{2-2}%
        导\hspace{2em}师： & \makebox[238bp]{\ustc@supervisor@names} \\
        \cline{2-2}%
        完成时间： & \makebox[238bp]{\ustc@date@zh@small} \\
        \cline{2-2}%
      \end{tabular}\par
    \endgroup
  \end{titlepage}%
}
\newlength\ustc@title@page@item@width

% 重新定义 \cs{maketitle}，调用 \cs{ustc@makezhtitle}, \cs{ustc@makeentitle}
% 分别生成中、英文封面。
\renewcommand\maketitle{%
  \pagenumbering{Alph}%
  \pagestyle{empty}%
  \ustc@title@pagetrue
  \ifustc@degree@graduate
    \ustc@title@page@graduate@zh
    \ustc@title@page@graduate@en
  \else
    \ustc@title@page@bachelor
  \fi
  \cleardoublepage
  \restoregeometry
  \pagestyle{plain}%
  \ustc@title@pagefalse
}


% \subsection{原创性声明}

\ExplSyntaxOn

% 定义原创性声明
\tl_const:Nn \c__ustc_originality_tl
  {
    本人声明所呈交的学位论文，是本人在导师指导下进行研究工作所取得的成果。
    除已特别加以标注和致谢的地方外，论文中不包含任何他人已经发表或撰写过的
    研究成果。
    与我一同工作的同志对本研究所做的贡献均已在论文中作了明确的说明。
  }
\tl_const:Nn \c__ustc_authorization_tl
  {
    作为申请学位的条件之一，学位论文著作权拥有者授权中国科学技术大学拥有
    学位论文的部分使用权，
    即：学校有权按有关规定向国家有关部门或机构送交论文的复印件和电子版，
    允许论文被查阅和借阅，可以将学位论文编入《中国学位论文全文数据库》等
    有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存、汇编学位论文。
    本人提交的电子文档的内容和纸质论文的内容相一致。\par
    控阅的学位论文在解除后也遵守此规定。
  }

% 生成空的下划线
\NewDocumentCommand \__ustc_underline:nn { O { 8 em } m }
  { \underline { \hbox_to_wd:nn {#1} { \hss #2 \hss } } }

\cs_new:Npn \__ustc_checkbox:
  {
    % \hbox_overlap_right:n { $ \square $ }
    \makebox [ 0 bp ][ l ]{ $ \square $ }
    \raisebox { -0.2 ex } { \skip_horizontal:n { 0.1 em } $ \checkmark $ }
  }

\NewDocumentCommand \copyrightpage { }
  {
    \ifustc@degree@graduate
      {
        \cleardoublepage
        \thispagestyle { empty }
        \ustc@pdfbookmark { 原创性和授权使用声明 }
        \vspace* { 21 bp }
        \group_begin:
          \centering \sffamily \fontsize { 16 bp } { 32 bp } \selectfont
          中国科学技术大学学位论文原创性声明 \par
        \group_end:
        \vspace { 13 bp }
        \group_begin:
          \xeCJKsetup { CJKglue = \skip_horizontal:n { 0bp plus .1pt minus .1pt } }
          \tl_use:N \c__ustc_originality_tl \par
        \group_end:
        \vspace { 37 bp }
        \noindent
        作者签名： \__ustc_underline:nn { } \skip_horizontal:n { 8 em }
        签字日期： \__ustc_underline:nn { } \par
        \vspace { 69 bp }
        \group_begin:
          \centering \sffamily \fontsize { 16 bp } { 32 bp } \selectfont
          中国科学技术大学学位论文授权使用声明 \par
        \group_end:
        \vspace { 13 bp }
        \group_begin:
          \xeCJKsetup { CJKglue = \skip_horizontal:n { 0bp plus .1pt minus .1pt } }
          \tl_use:N \c__ustc_authorization_tl \par
        \group_end:
        \vspace { 12 bp }
        \tl_if_empty:NTF \ustc@secret@level
          {
            \__ustc_checkbox: 公开 \quad
            $ \square $ 控阅（ \__ustc_underline:nn [ .85 cm ] { } 年） \par
          }
          {
            $ \square $ 公开 \quad
            \__ustc_checkbox: \space 控阅（
            \__ustc_underline:nn [ 2em ] { \ustc@secret@year }
            年） \par
          }
        \vspace { 29 bp }
        \noindent
        作者签名： \__ustc_underline:nn [ 7.5 em ] { } \skip_horizontal:n { 8.5em }
        导师签名： \__ustc_underline:nn [ 7.5 em ] { } \par
        \vspace { 1 em }
        \noindent
        签字日期： \__ustc_underline:nn [ 7.5 em ] { } \skip_horizontal:n { 8.5 em }
        签字日期： \__ustc_underline:nn [ 7.5 em ] { } \par
        \ifustc@reviewer@true
          \vspace { 1.5 cm }
          \skip_horizontal:n { -1 em }
          评审专家签名：\__ustc_underline:nn { } \skip_horizontal:n { 4.5 em }
          评审专家签名：\__ustc_underline:nn { } \par
        \fi
        \ustc@title@pagetrue
        \cleardoublepage
        \ustc@title@pagefalse
      }
    \fi
  }

% Reserved for compatibility until 2020-07-01.
\NewDocumentCommand \makestatement { }
  {
    \ustc@deprecated { '\token_to_str:N \makestatement'~ command }
      { 2020-07-01 } { '\token_to_str:N \copyrightpage' }
    \copyrightpage
  }


% \subsection{章节标题}

% 研究生要求一般不建议使用三级节标题，不得使用三级以下节标题。
% 本科生允许至四级节标题。
\setcounter { secnumdepth } { 3 }

% 本科生章题为两字时中间空一字，三字时空半字，四字及以上不空。
\cs_new_protected:Npn \__ustc_spaced_title:n #1
  {
    \int_set:Nn \l_tmpa_int { \exp_args:Ne \str_count:n {#1} }
    \group_begin:
      \if@mainmatter\else
        \int_case:nn { \l_tmpa_int }
          {
            { 2 } { \ziju { 1 } }
            { 4 } { \ziju { 0.5 } }
          }
      \fi
      #1
    \group_end:
  }

% 用 \pkg{ctex} 的接口设置全部章节标题格式。

% 各章标题，例如：“第1章  引言”。
% 章序号采用阿拉伯数字，章序号与标题之间空一个汉字符，采用黑体三号字，居中书写，单倍行距，段前24磅，段后18磅。
% 摘要、目录和列于目录中与章平级的其它部分的标题（如参考文献、附录、致谢等）也用这同一种格式。
% 由于 LaTeX 的排版方式与 Word 不同，为了效果与 Word 模板一致，
% 将段前、段后分别修正为 7 bp 和 19 bp。
\ctexset
  {
    chapter =
      {
        format      = \centering \heiti \fontsize { 16 bp } { 20.8 bp } \selectfont ,
        nameformat  = { } ,
        titleformat = { } ,
        number      = \thechapter ,
        aftername   = \quad ,
        beforeskip  = 7 bp ,
        afterskip   = 19 bp ,
      } ,
  }

% 一级节标题，例如：“2.1  实验方法”。
% 节编号用阿拉伯数字表示，前边数字为上级章节的序号，后一数字为本节的顺序号。
% 数字间用半角小数点“.”连接。
% 节标题序号与标题名之间空一个汉字符（下同）。
% 采用黑体四号（14 pt）字居左书写，固定行距20磅，段前24磅，段后6磅。
\ctexset
  {
    section =
      {
        format     = \heiti \fontsize { 14 bp } { 20 bp } \selectfont ,
        aftername  = \quad ,
        beforeskip = 24 bp ,
        afterskip  = 6 bp ,
      } ,
    %
    % 二级节标题，例如：“2.1.1  实验装置”。
    % 采用黑体13 pt字居左书写，固定行距20磅，段前12磅，段后6磅。
    subsection =
      {
        format     = \heiti \fontsize { 13 bp } { 20 bp } \selectfont ,
        aftername  = \quad ,
        beforeskip = 12 bp ,
        afterskip  = 6 bp ,
      } ,
    %
    % 三级节标题，例如：“2.1.1.1  实验结果”。
    % 采用黑体小四号（12 pt）字居左书写，固定行距20磅，段前12磅，段后6磅。
    subsubsection =
      {
        format     = \heiti \fontsize { 12 bp } { 20 bp } \selectfont ,
        aftername  = \quad ,
        beforeskip = 12 bp ,
        afterskip  = 6 bp ,
      } ,
    %
    % 研究生要求不得使用三级以下节标题
  }

\ifustc@degree@bachelor
  \ifustc@main@language@english
    \ustcsetup { section-style = arabic }
  \fi
\fi
\ustc@option@hook{main-language}{%
  \ifustc@degree@bachelor
    \ifustc@main@language@english
      \ustcsetup { section-style = arabic }
    \fi
  \fi
}

% 在研究生格式的基础上再设置本科生的章节标题格式。
\ifustc@degree@bachelor
  \setcounter { secnumdepth } { 4 }
  \ctexset
    {
      %
      % 论文的致谢、目录、摘要和参考文献等标题用小二号（18 bp）黑体字，居中，
      % 这通过 \cs{if@mainmatter} 区分。
      % 正文中的标题分章、节、段三级；章、节标题居中，段标题居左，
      % 分别用三号（16 bp）黑体、小三（15 bp）黑体、四号（14 bp）黑体。
      chapter =
        {
          format =
            {
              \space
              \centering \sffamily
              \if@mainmatter
                \fontsize { 16 bp } { 29.33 bp } \selectfont
              \else
                \fontsize { 18 bp } { 33 bp } \selectfont
              \fi
            } ,
          titleformat = \__ustc_spaced_title:n ,
        } ,
      section =
        {
          format = \centering \sffamily \fontsize { 15 bp } { 27.5 bp } \selectfont,
        } ,
      subsection =
        {
          format    = \sffamily \fontsize { 14 bp } { 25.67 bp } \selectfont ,
          indent    = 0 bp ,
        } ,
      subsubsection =
        {
          format    = \rmfamily \fontsize { 12 bp } { 22 bp } \selectfont ,
          number    = \arabic { subsubsection } ,
          aftername = . \enskip ,
          indent    = 1 em ,
        } ,
      paragraph =
        {
          format     = \rmfamily \fontsize { 12 bp } { 22 bp } \selectfont ,
          number     = （ \arabic { paragraph } ） ,
          aftername  = { } ,
          indent     = 1 em ,
          beforeskip = 0 bp ,
          afterskip  = 0 bp ,
          runin      = false ,
        } ,
    }
  %
  % 本科生的阿拉伯数字式标题的格式与研究生几乎一致，只有中文数字式需要修改。
  \ifustc@section@style@arabic\else
    \ctexset
      {
        chapter =
          {
            number = \chinese { chapter } ,
          } ,
        section =
          {
            name   = { 第 , 节 } ,
            number = \chinese { section } ,
          } ,
        subsection =
          {
            number    = \chinese { subsection } ,
            aftername = 、 ,
          } ,
      }
  \fi
\fi

% 处理本科生在目录中添加空行。
\cs_set:Npn \chapter
  {
    \if@openright
      \cleardoublepage
    \else
      \clearpage
    \fi
    \thispagestyle { \CTEX@chapter@pagestyle }
    \int_gzero:N \@topnum
    \@afterindenttrue
    \ifustc@degree@bachelor
      \bool_if:NT \l__ustc_add_toc_space_bool
        { \addtocontents { toc } { \protect \addvspace { 12 bp } } }
    \fi
    \secdef \@chapter \@schapter
  }

% 默认的 \cs{chapter*} 生成的章标题没有编号、不更改页眉，
% 也不添加进目录或 PDF 书签。
% 然而像摘要、目录、符号说明这样的章节，它们不需要编号、不加入目录，
% 但是需要修改页眉，并且加入 PDF 标签。
% 所以我们新定义 \cs{ustc@chapter} 用于处理这些章节。%
\NewDocumentCommand \ustc@chapter { o m }
  {
    \if@openright
      \cleardoublepage
    \else
      \clearpage
    \fi
    \IfValueTF {#1}
      {
        \ustc@pdfbookmark {#1}
        \chaptermark {#1}
      }
      {
        \ustc@pdfbookmark {#2}
        \chaptermark {#2}
      }
    \chapter * {#2}
  }


% \subsection{创新性说明}

\NewDocumentEnvironment { innovations } { +b }
  {
    \ifustc@degree@doctor
      \ifustc@degree@type@academic
        \ustc@chapter { 创新性说明 }
      \else
        \ustc@chapter { 创新性及应用性说明 }
      \fi
      #1 \par
    \fi
  }
  { }


% \subsection{摘要}

% 中文摘要环境。
\newcommand\ustc@keywords@text{%
  \ustc@clist@use{\ustc@keywords}{；}%
}
\newcommand\ustc@keywords@en@text{%
  \ifustc@degree@graduate
    \ustc@clist@use{\ustc@keywords@en}{, }%
  \else
    \ustc@clist@use{\ustc@keywords@en}{; }%
  \fi
}
\NewDocumentEnvironment { abstract } { }
  {
    \ustcsetup { language = chinese }
    \ustc@chapter { 摘要 }
  }
  {
    \par \null \par
    \dim_set:Nn \hangindent { 4 em }
    \noindent
    \textbf { 关键词 } ：
    \clist_set:NV \l_tmpa_clist \ustc@keywords
    \clist_use:Nn \l_tmpa_clist { ； } \par
    \ustc@reset@main@language
  }

% 英文摘要环境
\NewDocumentEnvironment { abstract* } { }
  {
    \ustcsetup { language = english }
    \ifustc@degree@graduate
      \ctexset
        {
          chapter =
            {
              format = \centering \bfseries \fontsize { 16 bp } { 18.4 bp } \selectfont ,
              beforeskip = 9 bp ,
              afterskip = 17 bp ,
            }
        }%
      \ustc@chapter { ABSTRACT }
      \ctexset { autoindent = 2 em }
    \else
      \group_begin:
        % 本科生的英文摘要使用小二号衬线体
        \ctexset { chapter / format = \centering \fontsize { 18 bp } { 33 bp } \selectfont }
        \ustc@chapter { ABSTRACT }
      \group_end:
    \fi
  }
  {
    \par \null \par
    \dim_set:Nn \hangindent { 6.5 em }
    \noindent
    \ifustc@degree@graduate
      \textbf { KEY~ WORDS }
    \else
      \textbf { Key~ Words }
    \fi
    : \space
    \clist_set:NV \l_tmpa_clist \ustc@keywords@en
    \ifustc@degree@graduate
      \clist_use:Nn \l_tmpa_clist { , \space \space }
    \else
      \clist_use:Nn \l_tmpa_clist { ; \space \space }
    \fi
    \par
    \ustc@reset@main@language
  }

% Reserved for compatibility until 2020-07-01.
\NewDocumentEnvironment { enabstract } { }
  {
    \ustc@deprecated { 'enabsctract' environment } { 2020-07-01 } { 'abstract*' }
    \begin { abstract* }
  }
  { \end { abstract* } }


% \subsection{目录}

% 研究生规定目录另面起；
% 本科生规定从目录开始编页码，所以必须另页起。
\cs_set:Npn \tableofcontents
  {
    \ifustc@degree@bachelor
      \cleardoublepage
      \pagenumbering { arabic }
      \pagestyle { plain }
    \fi
    \ustc@chapter { \contentsname }
    \@starttoc { toc }
  }

% 下面用 \pkg{titletoc} 宏包设置目录内容的格式。
% 先定义目录线：
\cs_new:Npn \__ustc_leaders:
  {
    \skip_horizontal:n { 2 bp }
    \titlerule* [ 4 bp ] { . }
    \skip_horizontal:n { 2 bp }
  }

\contentsmargin { 0 bp }

% 目录中的章标题行采用黑体小四号字，固定行距 20 磅，段前 6 磅，段后 0 磅；
% 其他内容采用宋体小四号字，行距 20 磅，段前、段后均为 0 磅。
% 章标题行居左书写，一级节标题行缩进 1 个汉字符，二级节标题行缩进 2 个汉字符。
% 带有序号的各级标题，其序号与题名之间均空一字符，行末右顶格。
\ifustc@degree@graduate
  \titlecontents { chapter }
    [ 0 bp ] { \addvspace { 6 bp } \heiti }
    { \contentspush { \thecontentslabel \quad } } { }
    { \bfseries \__ustc_leaders: \thecontentspage }
  \titlecontents { section }
    [ 1 em ] { }
    { \contentspush { \thecontentslabel \quad } } { }
    { \__ustc_leaders: \thecontentspage }
  \titlecontents { subsection }
    [ 2 em ] { }
    { \contentspush { \thecontentslabel \quad } } { }
    { \__ustc_leaders: \thecontentspage }
\else
  % 本科生的目录使用小四宋体（同正文字体），其他同研究生的格式相近。
  \titlecontents { chapter }
    [ 0 bp ] { }
    { \contentspush { \thecontentslabel \quad } } { }
    { \__ustc_leaders: \thecontentspage }
  \titlecontents { section }
    [ 1 em ] { }
    { \contentspush { \thecontentslabel \quad } } { }
    { \__ustc_leaders: \thecontentspage }
  \titlecontents { subsection }
    [ 2 em ] { }
    {
      \contentspush
        { \thecontentslabel \ifustc@section@style@arabic \quad \else 、 \fi }
    } { }
    { \__ustc_leaders: \thecontentspage }
\fi

% 插图和附表清单
\titlecontents { figure }
  [ 0 bp ] { }
  { \contentspush { \figurename \nobreakspace \thecontentslabel \quad } } { }
  { \__ustc_leaders: \thecontentspage }

\titlecontents { table }
  [ 0 bp ] { }
  { \contentspush { \tablename \nobreakspace \thecontentslabel \quad } } { }
  { \__ustc_leaders: \thecontentspage }

\cs_set:Npn \listoffigures
  {
    \ustc@chapter { \listfigurename }
    \@starttoc { lof }
  }

\cs_set:Npn \listoftables
  {
    \ustc@chapter { \listtablename }
    \@starttoc { lot }
  }

\cs_new:Npn \listoffiguresandtables
  {
    \ustc@chapter { \ustc@list@figure@table@name }
    \@starttoc { lof }
    \@starttoc { lot }
  }


% \subsection{符号说明}

% 研究生规定符号说明另页起，标题字体字号等同论文正文，
\NewDocumentEnvironment { notation } { }
  { \ustc@chapter { \ustc@notation@name } }
  { }

\cs_set_nopar:Npn \notationlabel #1 { #1 \hfil }
\NewDocumentEnvironment { notationlist } { m }
  {
    \list { }
      {
        \dim_set:Nn \itemsep { 3 bp }
        \dim_set:Nn \labelwidth {#1}
        \dim_set:Nn \labelsep { 1 em }
        \dim_set_eq:NN \leftmargin \labelwidth
        \dim_add:Nn \leftmargin { \labelsep }
        \dim_add:Nn \leftmargin { 3em }
        \dim_set:Nn \rightmargin { 3em }
        \cs_set_eq:NN \makelabel \notationlabel
      }
  }
  { \endlist }


% \subsection{正文}

% \cs{sloppy} 可以减少“overfull boxes”。
\sloppy

% 禁止扩大段间距（<https://github.com/ustctug/ustcthesis/issues/209>）。
\raggedbottom

% 段间距 0 磅。
\skip_set:Nn \parskip { 0 bp }

% 首段缩进。
\ctexset { autoindent = 2 }

% 标题后首段缩进（参考 `indentfirst`）。
\cs_set_eq:NN \@afterindentfalse \@afterindenttrue
\@afterindenttrue

% URL 的字体设为保持原样。
\urlstyle { same }

% 使用 \pkg{xurl} 宏包的方法，增加 URL 可断行的位置。
\cs_set_nopar:Npn \UrlBreaks
  {
    \do \. \do \@ \do \\ \do \/ \do \! \do \_ \do \| \do \; \do \> \do \]
    \do \) \do \, \do \? \do \& \do \' \do + \do \= \do \# \do :
    \do \a \do \b \do \c \do \d \do \e \do \f \do \g \do \h \do \i \do \j
    \do \k \do \l \do \m \do \n \do \o \do \p \do \q \do \r \do \s \do \t
    \do \u \do \v \do \w \do \x \do \y \do \z
    \do \A \do \B \do \C \do \D \do \E \do \F \do \G \do \H \do \I \do \J
    \do \K \do \L \do \M \do \N \do \O \do \P \do \Q \do \R \do \S \do \T
    \do \U \do \V \do \W \do \X \do \Y \do \Z
    \do 0 \do 1 \do 2 \do 3 \do 4 \do 5 \do 6 \do 7 \do 8 \do 9
  }
\muskip_set:Nn \Urlmuskip { 0 mu plus 0.1 mu }

% 脚注用带圈的数字：
\cs_set_nopar:Npn \thefootnote
  { \__ustc_circled:n { \c@footnote } }

% 脚注需要使用带圈的数字
\cs_new:Npn \__ustc_circled:n #1
  {
    \int_compare:nNnTF { #1 } < { 21 }
      { \char_generate:nn { #1 + "245F } { 12 } }
      { \msg_error:nn { ustcthesis } { exceeding-max-footnote-number } }
  }

\msg_new:nnn { ustcthesis } { exceeding-max-footnote-number }
  { Cannot~ display~ more~ than~ 20~ footnotes. }

% LaTeX 默认脚注按章计数，即每章的开始才重置脚注计数器；我们修改为按页计数。
% 简单的|\@addtoreset{footnote}{page}|并不可靠，
% \footnote{\url{https://texfaq.org/FAQ-footnpp.html}}
% 所以我们使用 \pkg{footmisc} 宏包。

% 脚注线长为版心宽度的四分之一：
\cs_set:Npn \footnoterule
  {
    \kern -3 \p@
    \hrule \@width .25 \textwidth
    \kern 2.6 \p@
  }

% 注文缩进两字：
\cs_set:Npn \@makefntext #1
  {
    \dim_set:Nn \parindent { 2 em }
    \noindent
    \hbox_to_wd:nn { 2 em } { \hss \@makefnmark } #1
  }


% \subsection{列表}
% \label{sec:list}

% 调整列表中各项之间过大的间距。
\skip_set:Nn \partopsep { 0bp }
\cs_new_nopar:Npn \__ustc_no_list_sep:
  {
    \skip_set:Nn \parsep { 0 \p@ \@plus .2 \p@ }
    \skip_set:Nn \topsep { 0 \p@ \@plus .2 \p@ }
    \skip_set:Nn \itemsep { 0 \p@ \@plus .2 \p@ }
  }
\cs_set_nopar:Npn \@listi
  {
    \leftmargin\leftmargini
    \__ustc_no_list_sep:
  }
\cs_set_eq:NN \@listI \@listi
\@listi
\cs_set:Npn \@listii
  {
    \skip_set_eq:NN \leftmargin \leftmarginii
    \skip_set:Nn \labelwidth { \leftmarginii - \labelsep }
    \__ustc_no_list_sep:
  }
\cs_set:Npn \@listiii
  {
    \skip_set_eq:NN \leftmargin \leftmarginiii
    \skip_set:Nn \labelwidth { \leftmarginiii - \labelsep }
    \__ustc_no_list_sep:
  }

\ExplSyntaxOff


% \subsection{浮动体}

% 图题采用宋体，加粗，字号 11pt，居中书写，单倍行距，段前6磅，段后0磅，
% 图序与图名之间空一个汉字符，

% 表题置于表的上方，采用宋体，加粗，字号11pt，居中书写，单倍行距，段前6磅，段后0磅。
% 表序与表名之间空一个汉字符。

% 本科生：图全文要分别统一编号或按章编号，标题用小四宋体:

% 使用 \pkg{caption} 宏包设置图、表的格式：
\DeclareCaptionFont{ustc}{\ustc@caption@font}
\newcommand\ustc@caption@font{%
  \ifustc@degree@bachelor
    \fontsize{12bp}{14.4bp}\selectfont
  \else
    \ifustc@language@chinese
      \fontsize{11bp}{14.3bp}\selectfont
    \else
      \fontsize{11bp}{12.65bp}\selectfont
    \fi
  \fi
}

\captionsetup{
  justification  = centerlast,
  font           = ustc,
  labelsep       = quad,
  skip           = 6bp,
  figureposition = bottom,
  tableposition  = top,
}
\ifustc@degree@graduate
  \captionsetup{font+=bf}
\fi

% 若有英文图题，另起一行置于中文图题下方。
\AtBeginOfPackageFile*{bicaption}{
  \let\captionmainlanguage\ustc@main@language
}
\AtEndOfPackageFile*{bicaption}{
  \captionsetup[bi-first]{lang = chinese}
  \captionsetup[bi-second]{
    lang = english,
    list = off,
  }
  \renewcommand\selectcaptionlanguage[2]{%
    \ustcsetup{language = #2}%
  }
}

% 表单元格中的文字采用 11pt 宋体字，单倍行距，段前3磅，段后3磅。
% 对于中文，`\arraystretch` 需要设为 1 + (3pt + 3pt) / (11pt * 1.3) ~= 1.42。
% 对于英文，`\arraystretch` 需要设为 1 + (3pt + 3pt) / (11pt * 1.15) ~= 1.47。
%
% 本科生：表格内容用小四宋体或五号宋体选定某种样式后，全文应统一。
\newcommand\ustc@table@font{%
  \ifustc@degree@bachelor
    \ifustc@language@chinese
      \fontsize{10.5bp}{13.65bp}\selectfont
      \renewcommand\arraystretch{1.44}%
    \else
      \fontsize{10.5bp}{12.075bp}\selectfont
      \renewcommand\arraystretch{1.5}%
    \fi
  \else
    \ifustc@language@chinese
      \fontsize{11bp}{14.3bp}\selectfont
      \renewcommand\arraystretch{1.42}%
    \else
      \fontsize{11bp}{12.65bp}\selectfont
      \renewcommand\arraystretch{1.47}%
    \fi
  \fi
}

\patchcmd\@floatboxreset{%
  \normalsize
}{%
  \ustc@table@font
}{}{\ustc@patch@error{\@floatboxreset}}

% 对 \pkg{longtable} 跨页表格进行相同的设置。
\AtEndOfPackageFile*{longtable}{
  \AtBeginEnvironment{longtable}{%
    \ifdim\f@size pt > 11bp\relax
      \ustc@table@font
    \fi
  }
}

% 图注、表注使用 `\figurenote` 或 `\tablenote` 命令，与 `apa7.cls` 一致。
% 图注采用宋体 11pt，单倍行距，段前6磅，段后0磅。
% 多个图注则须顺序编号，注序左缩进2字，与注文之间空一字符，续行悬挂缩进左对齐，两端对齐。
\let\ustc@figure@note@font\ustc@caption@font

\newcommand\figurenote[1]{%
  \begingroup
    \captionsetup{
      font = ustc,
      margin = {2em, 0pt},
      oneside,
    }%
    \caption*{#1}
  \endgroup
}
\let\tablenote\figurenote

% 兼容旧版的 `\note` 命令。
\newcommand\note[1]{%
  \ustc@deprecated{'\protect\note' command}{2025-01-05}{'\protect\figurenote'}%
  \figurenote{#1}%
}

% 设置 \pkg{threeparttable} 表注的默认字号。
\AtEndOfPackageFile*{threeparttable}{
  \AtBeginEnvironment{tablenotes}{%
    \ustc@figure@note@font
  }
}

% 不宜将多个插图连续排版，插图与文字论述段落应穿插排版。

% 修改默认的浮动体描述符为 |h|。
\def\fps@figure{h}
\def\fps@table{h}

% \LaTeX{} 对放置浮动体的要求比较强，这里按照 UK TeX FAQ 的建议
% \footnote{\url{https://texfaq.org/FAQ-floats}} 对其适当放宽。
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

% 插图前后与文字段落之间须留有10磅空行。
% 插图如果不得不与其它插图或表格连续排版，则它们之间须留有20磅空行。
\setlength{\floatsep}{20bp}
\setlength{\textfloatsep}{10bp}
\setlength{\intextsep}{10bp}

% 由于 LaTeX2e kernel 的问题，图表等浮动体与文字前后的距离不一致，需要进行 patch。
% 参考 \href{https://github.com/tuna/thuthesis/issues/614}{tuna/thuthesis/issues\#614}、
% \url{https://www.zhihu.com/question/46618031} 和
% \url{https://tex.stackexchange.com/a/40363/82731}。
%    \begin{macrocode}
\patchcmd{\@addtocurcol}%
  {\vskip \intextsep}%
  {\edef\save@first@penalty{\the\lastpenalty}\unpenalty
   \ifnum \lastpenalty = \@M  % hopefully the OR penalty
     \unpenalty
   \else
     \penalty \save@first@penalty \relax % put it back
   \fi
   \ifnum\outputpenalty <-\@Mii
     \addvspace\intextsep
     \vskip\parskip
   \else
     \addvspace\intextsep
   \fi}%
  {}{\ustc@patch@error{\@addtocurcol}}
\patchcmd{\@addtocurcol}%
  {\vskip\intextsep \ifnum\outputpenalty <-\@Mii \vskip -\parskip\fi}%
  {\ifnum\outputpenalty <-\@Mii
     \aftergroup\vskip\aftergroup\intextsep
     \aftergroup\nointerlineskip
   \else
     \vskip\intextsep
   \fi}%
  {}{\ustc@patch@error{\@addtocurcol}}
\patchcmd{\@getpen}{\@M}{\@Mi}
  {}{\ustc@patch@error{\@getpen}}


% \subsection{表达式}

% 修改 `amsmath` 的 `\tagform@`
% \def\tagform@#1{\maketag@@@{(\ignorespaces#1\unskip\@@italiccorr)}}
\def\tagform@#1{%
  \ifustc@language@chinese
    \ifustc@eqn@paren@style@full
      % 这里的 `\unskip` 是为了 `式~\eqref` 不产生额外的空格。
      \unskip
      % \kern 0pt 防止中文左括号与前面文字的距离过窄
      \maketag@@@{\kern 0pt\relax （\ignorespaces#1\unskip\@@italiccorr）}%
    \else
      \maketag@@@{(\ignorespaces#1\unskip\@@italiccorr)}%
    \fi
  \else
    \maketag@@@{(\ignorespaces#1\unskip\@@italiccorr)}%
  \fi
}

% \subsection{参考文献}

\PassOptionsToPackage{compress}{natbib}

\AtEndOfPackageFile*{natbib}{
  % 定义几种引用文献的标注样式。
  \newcommand\bibstyle@super{\bibpunct{[}{]}{,}{s}{,}{\textsuperscript{,}}}
  \newcommand\bibstyle@inline{\bibpunct{[}{]}{,}{n}{,}{,}}
  \newcommand\bibstyle@authoryear{\bibpunct{(}{)}{;}{a}{,}{,}}
  \@namedef{bibstyle@author-year}{\bibstyle@authoryear}
  %
  % 几种引用样式，与 \file{bst} 文件名保持一致，
  % 这样在使用 \cs{bibliographystyle} 选择参考文献表的样式时也会设置对应的引用样式。
  \@namedef{bibstyle@ustcthesis-numerical}{\bibstyle@super}
  \@namedef{bibstyle@ustcthesis-authoryear}{\bibstyle@authoryear}
  \@namedef{bibstyle@ustcthesis-bachelor}{\bibstyle@super}
  %
  % 如果载入 `natbib` 前设置了 `cite-style`，这里先进行配置。
  % https://github.com/ustctug/ustcthesis/issues/327
  \ifx\ustc@cite@style\@empty\else
    \citestyle{\ustc@cite@style}%
  \fi
  %
  % 定义接口 cite-style 切换引用样式。
  \ustc@option@hook{cite-style}{%
    \citestyle{\ustc@cite@style}%
  }
  %
  % 如果文献序号作为叙述文字的一部分，需要临时将文献序号与正文平排
  \DeclareRobustCommand\inlinecite{\@inlinecite}
  \def\@inlinecite#1{\begingroup\let\@cite\NAT@citenum\citep{#1}\endgroup}
  %
  % 修改引用的样式。
  % 这里在 filehook 中无法使用 \cs{patchcmd}，所以只能手动重定义。
  %
  % 将 super 式 \cs{citep} 引用的页码置于括号外。
  \renewcommand\NAT@citesuper[3]{%
    \ifNAT@swa
      \if*#2*\else
        #2\NAT@spacechar
      \fi
      % \unskip\kern\p@\textsuperscript{\NAT@@open#1\NAT@@close}%
      %  \if*#3*\else\NAT@spacechar#3\fi\else #1\fi\endgroup}
      \unskip\kern\p@
      \textsuperscript{%
        \NAT@@open#1\NAT@@close
        \if*#3*\else#3\fi
      }%
      \kern\p@
    \else
      #1%
    \fi
    \endgroup
  }
  %
  % 将 numbers 式 \cs{citep} 引用的页码置于括号外并改为上标。
  \renewcommand\NAT@citenum[3]{%
    \ifNAT@swa
      \NAT@@open
      \if*#2*\else
        #2\NAT@spacechar
      \fi
      % #1\if*#3*\else\NAT@cmt#3\fi\NAT@@close
      #1\NAT@@close
      \if*#3*\else
        \textsuperscript{#3}%
      \fi
    \else
      #1%
    \fi
    \endgroup
  }
  %
  % 在 filehook 中无法使用 \cs{patchcmd}，所以只能手动重定义。
  \def\NAT@citexnum[#1][#2]#3{%
    \NAT@reset@parser
    \NAT@sort@cites{#3}%
    \NAT@reset@citea
    \@cite{\def\NAT@num{-1}\let\NAT@last@yr\relax\let\NAT@nm\@empty
      \@for\@citeb:=\NAT@cite@list \do
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
              % 在顺序编码制下，\pkg{natbib} 只有在三个以上连续文献引用才会使用连接号，
              % 这里修改为允许两个引用使用连接号。
              % 参考 https://tex.stackexchange.com/a/86991/82731 。
              %
              % \ifx\NAT@last@yr\relax
              %   \def@NAT@last@yr{\@citea}%
              % \else
              %   \def@NAT@last@yr{--\NAT@penalty}%
              % \fi
              \def@NAT@last@yr{-\NAT@penalty}%
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
          % 将 numerical 式 \cs{citet} 引用的页码置于括号外并改为上标。
          %
          % \@ifnum{\NAT@ctype=\z@}{%
          %   \if*#2*\else\NAT@cmt#2\fi
          % }{}%
          \NAT@mbox{\NAT@@close}%
          \@ifnum{\NAT@ctype=\z@}{%
            \if*#2*\else
              \textsuperscript{#2}%
            \fi
          }{}%
          \NAT@super@kern
        \fi
    }{#1}{#2}%
  }%
  %
  % 将 author-year 式 \cs{citep} 引用的页码置于括号外并改为上标：
  \renewcommand\NAT@cite%
      [3]{\ifNAT@swa\NAT@@open\if*#2*\else#2\NAT@spacechar\fi
          % #1\if*#3*\else\NAT@cmt#3\fi\NAT@@close\else#1\fi\endgroup}
          #1\NAT@@close\if*#3*\else\textsuperscript{#3}\fi\else#1\fi\endgroup}
  %
  % 调整 author-year 式 \cs{citet} 引用的页码。
  \def\NAT@citex%
    [#1][#2]#3{%
    \NAT@reset@parser
    \NAT@sort@cites{#3}%
    \NAT@reset@citea
    \@cite{\let\NAT@nm\@empty\let\NAT@year\@empty
      \@for\@citeb:=\NAT@cite@list \do
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
        % 将 author-year 式 \cs{citet} 引用的页码置于括号外并改为上标。
        %
        % \if*#2*\else\NAT@cmt#2\fi
        \if\relax\NAT@date\relax\else\NAT@@close\fi
        \if*#2*\else\textsuperscript{#2}\fi
      \fi}{#1}{#2}}
  %
  % 为了将参考文献加入目录和 pdf 书签，重新定义 \pkg{natbib} 的 \cmd{bibsection}
  % 另外如果调用了 \pkg{chapterbib} 或者使用了 \opt{sectionbib} 参数，
  % 需要使用节标题 \cs{section}。
  \newcommand\ustc@bib@chapter{%
    \@mainmatterfalse
    \chapter{\bibname}%
  }%
  \newcommand\ustc@bib@section{%
    \begingroup
      \ctexset{section/numbering=false}%
      \section{\bibname}%
    \endgroup
  }%
  \@ifpackagewith{chapterbib}{sectionbib}{%
    \ustc@error{The "sectionbib" option cannot be used with chaperbib if natbib loaded}%
  }{}%
  \@ifpackageloaded{chapterbib}{%
    \let\bibsection\ustc@bib@section
  }{%
    \@ifxundefined\NAT@sectionbib{%
      \let\bibsection\ustc@bib@chapter
    }{%
      \let\bibsection\ustc@bib@section
    }%
  }%
  %
  % 参考文献列表格式：宋体 10.5 磅，行距 20 磅，续行缩进两字，左对齐。
  % 本科生依然是小四宋体。
  \renewcommand\bibfont{%
    \ifustc@degree@graduate
      \fontsize{10.5bp}{20bp}\selectfont
    \else
      \normalsize
    \fi
  }
  \setlength{\bibsep}{0\p@ \@plus.2\p@}
  \renewcommand\@biblabel[1]{[#1]\hfill}
  \setlength{\bibhang}{2em}
}


% biblatex 宏包的配置

\AtEndOfPackageFile*{biblatex}{
  \DeclareRobustCommand\inlinecite{\parencite}
  \defbibheading{bibliography}[\bibname]{%
    \@mainmatterfalse
    \chapter{\bibname}%
  }
  \renewcommand\bibfont{%
    \ifustc@degree@graduate
      \fontsize{10.5bp}{20bp}\selectfont
    \else
      \normalsize
    \fi
  }
  \setlength{\bibitemsep}{0\p@ \@plus.2\p@}
  \setlength{\bibhang}{2em}
}

% \subsection{附录}

% 定义了一个满足要求的致谢环境：
\newenvironment{acknowledgements}{%
  \@mainmatterfalse
  \chapter{\ustc@acknowledgements@name}%
}{
  \ifustc@degree@bachelor
    \par
    \null\par
    \begingroup
      \raggedleft
      \ustc@date@zh@short\par
    \endgroup
  \fi
}


% 兼容旧版本中“acknowledgments”的拼法。
% Reserved for compatibility until 2020-07-01.
\newenvironment{acknowledgments}{%
  \begin{acknowledgements}%
}{%
  \end{acknowledgements}%
}

% 科研成果环境：
\NewDocumentEnvironment{achievements}{+b}{%
  \ifustc@degree@graduate
    \@mainmatterfalse
    \chapter{\ustc@achievements@name}%
    \fontsize{12bp}{16bp}\selectfont
    #1\par
  \fi
}{}

% 兼容旧的接口
\newenvironment{publications}{%
  \ustc@deprecated{'publications' environment}{2024-12-15}{'achievements'}%
  \@mainmatterfalse
  \chapter{\ustc@achievements@name}%
}{}

\newif\ifustc@first@achievement@list
\ustc@first@achievement@listtrue

\newenvironment{theachievements}[1][已发表论文]{%
  \ifustc@first@achievement@list
    \vspace{1bp}%
  \else
    \vspace{19bp}%
  \fi
  \global\ustc@first@achievement@listfalse
  \noindent\textbf{#1：}\par
  \begin{achievementlist}
}{%
  \end{achievementlist}
}

\newlist{achievementlist}{enumerate}{1}
\setlist[achievementlist]{
  topsep     = 3bp,
  partopsep  = 0bp,
  itemsep    = 0bp,
  parsep     = 3bp,
  leftmargin = 21bp,
  itemindent = 0bp,
  labelsep   = 0bp,
  labelwidth = 21bp,
  align      = left,
  label      = [\arabic*],
}



% \subsection{其他宏包的设置}

% 这些宏包并非格式要求，但是为了方便同学们使用，在这里进行简单设置。


% \subsubsection{\pkg{hyperref} 宏包}

\AtEndOfPackageFile*{hyperref}{
  \hypersetup{
    bookmarksnumbered  = true,
    bookmarksopen      = true,
    bookmarksopenlevel = 1,
    linktoc            = all,
    unicode            = true,
    psdextra           = true,
  }
  %
  % 如果为 \opt{pdf} 样式，设置 hyperlink 颜色
  \ifustc@output@electronic
    \hypersetup{
      colorlinks = true,
      allcolors  = blue,
    }
  \else
    \hypersetup{hidelinks}
  \fi
  %
  % 填写 PDF 元信息。
  \AtBeginDocument{%
    \ifustc@main@language@chinese
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
  %
  % 添加 PDF 书签
  %
  \newcounter{ustc@bookmarknumber}
  \renewcommand\ustc@pdfbookmark[1]{%
    \phantomsection
    \stepcounter{ustc@bookmarknumber}%
    \pdfbookmark[0]{#1}{ustcchapter.\theustc@bookmarknumber}%
  }
  %
  % 在 PDF 字符串中去掉换行，以减少 \pkg{hyperref} 的警告信息。
  \pdfstringdefDisableCommands{
    \let\\\@empty
    \let\hspace\@gobble
  }
  %
  % \pkg{hyperref} 与 \pkg{unicode-math} 存在一些兼容性问题，见
  % \href{https://github.com/ustctug/ustcthesis/issues/223}{%
  %   ustctug/ustcthesis\#223}，
  % \href{https://github.com/ho-tex/hyperref/pull/90}{ho-tex/hyperref\#90} 和
  % \href{https://github.com/ustctug/ustcthesis/issues/235}{%
  %   ustctug/ustcthesis/\#235}。
  \@ifpackagelater{hyperref}{2019/04/27}{}{%
    \g@addto@macro\psdmapshortnames{\let\mu\textmu}%
  }
  %
  % 设置中文的 \cs{autoref}。
  % \footnote{\url{https://tex.stackexchange.com/a/66150/82731}}
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
  %
  % 本科生需要在 \tableofcontents 处切换 \pagenumbering，
  % 在使用了 notoccite 后会导致 PDF 书签的页码有误（#293），
  % 所以需要补充 https://tex.stackexchange.com/a/593839/82731 的 patch。
  % LuaTeX 不需要这个 patch。
  \ifXeTeX
    \def\HyPL@StorePageLabel#1{%
      \begingroup
        \edef\Hy@tempa{\the\Hy@abspage<<#1>>}%
        \immediate\write\@mainaux{%
          \string\HyPL@Entry{\Hy@tempa}%
        }%
      \endgroup
    }
  \fi
}


% \subsubsection{\pkg{amsthm} 宏包}

\AtEndOfPackageFile*{amsthm}{
  \newtheoremstyle{ustcplain}
    {}{}
    {}{2em}
    {\bfseries}{}
    {1em}{}
  \theoremstyle{ustcplain}
  % 定义新的定理
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
  % \pkg{amsthm} 单独定义了 proof 环境，这里重新定义以满足格式要求。
  % 原本模仿 \pkg{amsthm} 写成 |\item[\hskip\labelsep\hskip2em #1\hskip1em]|，
  % 但是却会多出一些间隙。
  \renewenvironment{proof}[1][\ustc@proof@name]{\par
    \pushQED{\qed}%
    \normalfont \topsep6\p@\@plus6\p@\relax
    \trivlist
      \item\relax\hskip2em\relax
      \textbf{#1}
      \hskip1em\ignorespaces
    }{%
    \popQED\endtrivlist\@endpefalse
  }
  \renewcommand\qedsymbol{\ustc@qed}
}


% \subsubsection{\pkg{algorithm2e} 宏包}

% 按章节编号。
\PassOptionsToPackage{algochapter}{algorithm2e}

\AtEndOfPackageFile*{algorithm2e}{
  \ifustc@language@chinese
    \SetAlgorithmName{算法}{算法}{算法清单}
  \else
    \SetAlgorithmName{Algorithm}{Algorithm}{List of Algorithms}
  \fi
  %
  % 设置算法环境的格式。
  \SetAlCapSkip{6bp}
  \SetAlCapFnt{\small}
  \SetAlCapNameFnt{\small}
  \ifustc@degree@graduate
    \SetAlCapNameSty{textbf}
  \fi
  \SetAlgoCaptionSeparator{\unskip\hspace*{1em}}
  %
  % 设置算法清单的格式
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
    {\__ustc_leaders:\contentspage}
  \contentsuse{algocf}{loa}
}


% \subsubsection{\pkg{mathtools} 宏包}

% \pkg{mathtools} 会修改 \pkg{unicode-math} 的 `\underbrace` 和 `\overbrace`，
% 需要还原为 `\LaTeXunderbrace` 和 `\LaTeXoverbrace`，
% 参考 \url{https://tex.stackexchange.com/q/521394/82731}。
\AtEndOfPackageFile*{mathtools}{
  \@ifpackageloaded{unicode-math}{
    \let\underbrace\LaTeXunderbrace
    \let\overbrace\LaTeXoverbrace
  }{}
}

% \subsubsection{\pkg{nomencl} 宏包}

\AtEndOfPackageFile*{nomencl}{
  \let\nomname\ustc@notation@name
  \def\thenomenclature{%
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
  }
}


% \subsubsection{\pkg{siunitx} 宏包}

\AtEndOfPackageFile*{siunitx}{
  \newcommand\ustc@set@siunitx@language{%
    \ifustc@language@chinese
      \sisetup{
        list-final-separator = { 和~},
        list-pair-separator  = { 和 },
        range-phrase         = {～},
      }%
    \else
      \sisetup{
        list-final-separator = {, and },
        list-pair-separator  = { and },
        range-phrase         = { to },
      }%
    \fi
  }
  \ustc@set@siunitx@language
  \ustc@option@hook{language}{\ustc@set@siunitx@language}
}

% \subsubsection{\pkg{chapterbib} 宏包}

\AtEndOfPackageFile*{chapterbib}{
  \@ifpackageloaded{natbib}{%
    \@ifpackagewith{chapterbib}{sectionbib}{%
      \ustc@error{The "sectionbib" option cannot be used with chaperbib if natbib loaded}%
    }{}%
    \renewcommand\bibsection{%
      \begingroup
        \ctexset{section/numbering=false}%
        \section{\bibname}%
      \endgroup
    }
  }{}
}
