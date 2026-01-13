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

\NeedsTeXFormat{LaTeX2e}[2020-10-01]

% 检查 LaTeXe kernel 版本
\providecommand\IfFormatAtLeastTF{\@ifl@t@r\fmtversion}
\IfFormatAtLeastTF{2020-10-01}{}
  {\ClassError{ustcthesis}{TeX Live 2021 or later version is required.}{}}

\newcommand\ustcthesisversion{4.0.0-beta.10}
\ProvidesExplClass{ustcthesis}{2025-12-21}{\ustcthesisversion}{USTC thesis template}

\prop_gput:Nnn \g_msg_module_type_prop { ustcthesis } { Class }

\cs_new:Npn \__ustc_deprecated:nnn #1#2#3
  { \msg_warning:nneee { ustcthesis } { deprecated } { #1 } { #2 } { #3 } }

\msg_new:nnn { ustcthesis } { deprecated }
  {
    The~ #1~ is~ deprecated~ since~ #2.\\
    Use~ #3~ instead.
  }

% 检查编译引擎，要求使用 XeLaTeX 或 LuaLaTeX。
\msg_new:nnn { ustcthesis } { unsupported-engine }
  {
    The~ ustcthesis~ class~ requires~ either~ XeTeX~ or~ LuaTeX.\\
    The~ '\c_sys_engine_str'~ engine~ is~ not~ supported.
  }

\sys_if_engine_xetex:F
  {
    \sys_if_engine_luatex:F
      { \msg_fatal:nn { ustcthesis } { unsupported-engine } }
  }


% \subsection{处理选项}

% 提供一个 \cs{ustcsetup} 命令支持 \emph{key-value} 的方式来设置。
% `\l__ustc_setup_hook_tl` 用于延迟 math-font 的设置。
\tl_new:N \l__ustc_setup_hook_tl
\NewDocumentCommand \ustcsetup { m }
  {
    \tl_clear:N \l__ustc_setup_hook_tl
    \keys_set:nn { ustc } {#1}
    \tl_use:N \l__ustc_setup_hook_tl
  }


\str_new:N \l__ustc_degree_str
\bool_new:N \l__ustc_degree_graduate_bool
\tl_new:N \l__ustc_degree_hook_tl
\str_new:N \l__ustc_degree_type_str
\str_new:N \l__ustc_language_str
\str_new:N \l__ustc_main_language_str
\tl_new:N \l__ustc_language_hook_tl
\tl_new:N \l__ustc_main_language_hook_tl
\bool_new:N \l__ustc_language_chinese_bool
\bool_new:N \l__ustc_main_language_chinese_bool
\bool_new:N \l__ustc_review_bool
\bool_new:N \l__ustc_reviewer_bool
\str_new:N \l__ustc_fontset_str
\str_new:N \l__ustc_font_str
\tl_new:N \l__ustc_font_hook_tl
\str_new:N \l__ustc_cjk_font_str
\tl_new:N \l__ustc_cjk_font_hook_tl
\str_new:N \l__ustc_math_font_str
\tl_new:N \l__ustc_math_font_hook_tl

\str_new:N \l__ustc_math_style_str
\tl_new:N \l__ustc_math_style_hook_tl
\bool_new:N \l__ustc_slanted_greek_bool
\bool_new:N \l__ustc_leq_slanted_bool
\bool_new:N \l__ustc_integral_upright_bool
\bool_new:N \l__ustc_integral_limits_bool
\bool_new:N \l__ustc_partial_upright_bool
\str_new:N \l__ustc_math_ellipsis_str
\bool_new:N \l__ustc_real_part_roman_bool

\str_new:N \l__ustc_cite_style_str
\tl_new:N \l__ustc_cite_style_hook_tl
\bool_new:N \l__ustc_output_electronic_bool
\bool_new:N \l__ustc_section_style_chinese_bool
\bool_new:N \l__ustc_badge_color_black_bool
\bool_new:N \l__ustc_eqn_paren_style_full_bool

% \clist_new:N \l__ustc_unknown_options_clist

\keys_define:nn { ustc / options }
  {
    degree .choices:nn =
      { doctor , master , bachelor }
      {
        \str_set:NV \l__ustc_degree_str \l_keys_choice_tl
        \str_if_eq:VnTF \l__ustc_degree_str { bachelor }
          { \bool_set_false:N \l__ustc_degree_graduate_bool }
          { \bool_set_true:N \l__ustc_degree_graduate_bool }
        \l__ustc_degree_hook_tl
      } ,

    degree-type .code:n = \keys_set:nn { ustc } { degree-type = {#1} } ,
    language .code:n = \keys_set:nn { ustc } { language = {#1} } ,
    fontset .choices:nn =
      { auto , windows , mac , ubuntu , fandol , none }
      { \str_set:NV \l__ustc_fontset_str \l_keys_choice_tl } ,
    font .code:n = \keys_set:nn { ustc } { font = {#1} } ,
    cjk-font .code:n = \keys_set:nn { ustc } { cjk-font = {#1} } ,
    math-font .code:n = \keys_set:nn { ustc } { math-font = {#1} } ,
    math-style .code:n = \keys_set:nn { ustc } { math-style = {#1} } ,
    output .choice: ,
    output / print .code:n =
      {
        \bool_set_false:N \l__ustc_output_electronic_bool
        \PassOptionsToClass { twoside } { ctexbook }
      } ,
    output / electronic .code:n =
      {
        \bool_set_true:N \l__ustc_output_electronic_bool
        \PassOptionsToClass { oneside } { ctexbook }
      } ,
    review .bool_set:N = \l__ustc_review_bool ,
    reviewer .bool_set:N = \l__ustc_reviewer_bool ,
    section-style .code:n = \keys_set:nn { ustc } { section-style = {#1} } ,
    cite-style .code:n = \keys_set:nn { ustc } { cite-style = {#1} } ,
    badge-color .code:n = \keys_set:nn { ustc } { badge-color = {#1} } ,
    eqn-paren-style .code:n = \keys_set:nn { ustc } { eqn-paren-style = {#1} } ,
    unknown .code:n =
      {
        % \clist_put_right:NV \l__ustc_unknown_options_clist \CurrentOption
        \PassOptionsToClass { \CurrentOption } { ctexbook }
      } ,
  }

\keys_define:nn { ustc }
  {
    degree-type .choices:nn =
      { academic , professional , engineering }
      { \str_set:NV \l__ustc_degree_type_str \l_keys_choice_tl } ,
    language .choices:nn =
      { chinese , english }
      {
        \str_set:NV \l__ustc_language_str \l_keys_choice_tl
        \str_if_eq:VnTF \l__ustc_language_str { chinese }
          { \bool_set_true:N \l__ustc_language_chinese_bool }
          { \bool_set_false:N \l__ustc_language_chinese_bool }
        \l__ustc_language_hook_tl
      } ,
    review .bool_set:N = \l__ustc_review_bool ,
    reviewer .bool_set:N = \l__ustc_reviewer_bool ,
    font .choices:nn =
      { auto , times , termes , stix , xits , libertinus , newcm , lm , newtx , cm , none }
      {
        \str_set:NV \l__ustc_font_str \l_keys_choice_tl
        \l__ustc_font_hook_tl
      } ,
    cjk-font .choices:nn =
      { auto , windows , mac , noto , fandol , none }
      {
        \str_set:NV \l__ustc_cjk_font_str \l_keys_choice_tl
        \l__ustc_cjk_font_hook_tl
      } ,
    math-font .choices:nn =
      { auto , stix , xits , libertinus , newcm , cm , lm , newtx , none }
      {
        \str_set:NV \l__ustc_math_font_str \l_keys_choice_tl
        \l__ustc_math_font_hook_tl
      } ,
    math-style .choices:nn =
      { TeX, ISO , GB }
      {
        \str_set:NV \l__ustc_math_style_str \l_keys_choice_tl
        \l__ustc_math_style_hook_tl
      } ,
    uppercase-greek .choice: ,
    uppercase-greek / italic .code:n =
      { \bool_set_true:N \l__ustc_slanted_greek_bool } ,
    uppercase-greek / upright .code:n =
      { \bool_set_false:N \l__ustc_slanted_greek_bool } ,
    less-than-or-equal .choice: ,
    less-than-or-equal / slanted .code:n =
      { \bool_set_true:N \l__ustc_leq_slanted_bool } ,
    less-than-or-equal / horizontal .code:n =
      { \bool_set_false:N \l__ustc_leq_slanted_bool } ,
    integral .choice: ,
    integral / upright .code:n =
      { \bool_set_true:N \l__ustc_integral_upright_bool } ,
    integral / slanted .code:n =
      { \bool_set_false:N \l__ustc_integral_upright_bool } ,
    integral-limits .bool_set:N = \l__ustc_integral_limits_bool ,
    partial .choice: ,
    partial / upright .code:n =
      { \bool_set_true:N \l__ustc_partial_upright_bool } ,
    partial / italic .code:n =
      { \bool_set_false:N \l__ustc_partial_upright_bool } ,
    math-ellipsis .choices:nn =
      { centered , lower , AMS }
      { \str_set:NV \l__ustc_math_ellipsis_str \l_keys_choice_tl } ,
    real-part .choice: ,
    real-part  / roman .code:n =
      { \bool_set_true:N \l__ustc_real_part_roman_bool } ,
    real-part  / fraktur .code:n =
      { \bool_set_false:N \l__ustc_real_part_roman_bool } ,
    cite-style .choices:nn =
      { super , inline , authoryear }
      {
        \str_set:NV \l__ustc_cite_style_str \l_keys_choice_tl
        \l__ustc_cite_style_hook_tl
      } ,
    section-style .choice: ,
    section-style / chinese .code:n =
      { \bool_set_true:N \l__ustc_section_style_chinese_bool } ,
    section-style / arabic .code:n =
      { \bool_set_false:N \l__ustc_section_style_chinese_bool } ,
    badge-color .choice: ,
    badge-color / blue .code:n =
      { \bool_set_false:N \l__ustc_badge_color_black_bool } ,
    badge-color / black .code:n =
      { \bool_set_true:N \l__ustc_badge_color_black_bool } ,
    eqn-paren-style .choice: ,
    eqn-paren-style / full .code:n =
      { \bool_set_true:N \l__ustc_eqn_paren_style_full_bool } ,
    eqn-paren-style / half .code:n =
      { \bool_set_false:N \l__ustc_eqn_paren_style_full_bool } ,
  }

\keys_set:nn { ustc / options }
  {
    degree      = doctor ,
    fontset     = auto ,
    output      = print ,
  }

\keys_set:nn { ustc }
  {
    degree-type = academic ,
    language    = chinese ,
    review      = false ,
    reviewer    = false ,
    font        = auto ,
    cjk-font    = auto ,
    math-font   = auto ,
    math-style  = TeX ,
    % TODO: make arabic default
    section-style = chinese ,
    badge-color = blue ,
    eqn-paren-style = full ,
  }


% 兼容旧版本的文档类选项。
% Deprecated since 2020-07-01.
\cs_new:Npn \__ustc_define_deprecated_option:nnn #1#2#3
  {
    \keys_define:nn { ustc }
      {
        #1 .code:n =
          {
            \__ustc_deprecated:nnn { '#1'~ option } { 2020-07-01 } { #2 = #3 }
            \keys_set:nn { ustc } { #2 = #3 }
          } ,
      }
  }
\__ustc_define_deprecated_option:nnn { doctor } { degree } { doctor }
\__ustc_define_deprecated_option:nnn { master } { degree } { master }
\__ustc_define_deprecated_option:nnn { bachelor } { degree } { bachelor }
\__ustc_define_deprecated_option:nnn { chinese } { language } { chinese }
\__ustc_define_deprecated_option:nnn { english } { language } { english }
\__ustc_define_deprecated_option:nnn { academic } { degree-type } { academic }
\__ustc_define_deprecated_option:nnn { professional } { degree-type } { professional }
\__ustc_define_deprecated_option:nnn { engineering } { degree-type } { engineering }
\__ustc_define_deprecated_option:nnn { print } { output } { print }
\__ustc_define_deprecated_option:nnn { pdf } { output } { electronic }
\__ustc_define_deprecated_option:nnn { arabic } { section-style } { arabic }
\__ustc_define_deprecated_option:nnn { colorlogo } { badge-color } { blue }
\__ustc_define_deprecated_option:nnn { bwlogo } { badge-color } { black }

\PassOptionsToClass { openany } { ctexbook }
\PassOptionsToClass { twoside } { ctexbook }

% 载入 \cls{ctexbook}。
% \IfFormatAtLeastTF { 2022-06-01 }
\cs_if_exist:NTF \ProcessKeyOptions
  { \ProcessKeyOptions [ ustc / options ] }
  {
    \RequirePackage { l3keys2e }
    \ProcessKeysOptions { ustc / options }
  }

% \clist_map_inline:Nn \l__ustc_unknown_options_clist
%   { \PassOptionsToClass { #1 } { ctexbook } }

\PassOptionsToPackage { no-math } { fontspec }


% \subsection{加载文档类和宏包}

% 载入 \cls{ctexbook} 文档类，注意要求为 2.4.9 或更高的版本。
\LoadClass
  [ UTF8 , a4paper , scheme = plain , zihao = - 4 , fontset = none ]
  { ctexbook } [ 2021-03-14 ]

% 建议在模板开始处载入全部宏包，不要轻易改变加载顺序。
% \pkg{hyperref} 一般在最后加载。
\RequirePackage { amsmath }
\RequirePackage { fontspec }
\RequirePackage { geometry }
\RequirePackage { graphicx }
\RequirePackage { fancyhdr }
\RequirePackage { color }
\RequirePackage { titletoc }
\RequirePackage { caption }
\RequirePackage { enumitem }
\RequirePackage [ perpage ] { footmisc }
\RequirePackage { url }
\RequirePackage { notoccite }
\RequirePackage { multirow }

\IfFormatAtLeastTF { 2021-11-15 }
  {
    \cs_new:Npn \__ustc_at_begin_package:nn #1#2
      { \hook_gput_code:nnn { package / #1 / before } { . } {#2} }
    \cs_new:Npn \__ustc_at_end_package:nn #1#2
      { \hook_gput_code:nnn { package / #1 / after } { . } {#2} }
  }
  {
    \cs_new:Npn \__ustc_at_begin_package:nn #1#2
      { \hook_gput_code:nnn { package / before / #1 } { . } {#2} }
    \cs_new:Npn \__ustc_at_end_package:nn #1#2
      { \hook_gput_code:nnn { package / after / #1 } { . } {#2} }
  }
\cs_new:Npn \__ustc_at_end_preamble:n #1
  { \hook_gput_code:nnn { begindocument / before } { . } {#1} }

% 如果用户在导言区未调用 \pkg{biblatex}，则自动调用 \pkg{natbib}。
\__ustc_at_end_preamble:n
  {
    \@ifpackageloaded { biblatex }
      { }
      { \RequirePackage { natbib } }
  }

% 对冲突的宏包报错。
\cs_new:Npn \__ustc_package_conflict:nn #1#2
  {
    \__ustc_at_begin_package:nn {#1}
      {
        \__ustc_at_begin_package:nn {#2}
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
\__ustc_at_begin_package:nn { amsthm }
  {
    \@ifpackageloaded { newtxmath }
      { \msg_error:nn { ustcthesis } { amsthm-after-newtxmath } }
      {}
  }

\msg_new:nnn { ustcthesis } { amsthm-after-newtxmath }
  { The~ 'amsthm'~ package~ should~ be~ loaded~ before~ setting~ 'newtxmath'. }


% \subsection{处理语言}

% 定义 \l__ustc_language_str，当在导言区修改 \option{language} 时，
% 保存为论文的主要语言；
% \cs{__ustc_reset_main_language:} 则用于正文中恢复为主要语言。
\str_set_eq:NN \l__ustc_main_language_str \l__ustc_language_str
\bool_set_eq:NN \l__ustc_main_language_chinese_bool
  \l__ustc_language_chinese_bool

\prg_new_conditional:Nnn \__ustc_if_preamble: { T , F , TF }
  {
    \if_meaning:w \@begindocumenthook \@undefined
      \prg_return_false:
    \else
      \prg_return_true:
    \fi
  }

\tl_put_right:Nn \l__ustc_language_hook_tl
  {
    \__ustc_if_preamble:T
      {
        \str_set_eq:NN \l__ustc_main_language_str \l__ustc_language_str
        \bool_set_eq:NN \l__ustc_main_language_chinese_bool
          \l__ustc_language_chinese_bool
      }
  }

\cs_new:Npn \__ustc_reset_main_language:
  { \exp_args:Ne \ustcsetup { language = \l__ustc_main_language_str } }

% 带圈数字和星号使用中文字体。
\sys_if_engine_xetex:TF
  { \xeCJKDeclareCharClass { CJK } { "2460 -> "2473 , "2605 } }
  {
    \sys_if_engine_luatex:T
      {
        % ctex 将带圈数字 U+2460–U+2473 归入字符范围 3（ALchar），这里改回范围 6（JAchar）
        \ltjdefcharrange { 6 } { "2460 - "2473 , "2605 }
      }
  }

% 由于 Unicode 的一些标点符号是中西文混用的：
% U+00B7、U+2013、U+2014、U+2018、U+2019、
% U+201C、U+201D、U+2025、U+2026、U+2E3A，
% 所以要根据语言设置正确的字体。
% https://github.com/CTeX-org/ctex-kit/issues/389
\cs_new:Npn \__ustc_set_punctuations:
  {
    \bool_if:NTF \l__ustc_language_chinese_bool
      {
        \sys_if_engine_xetex:TF
          {
            \xeCJKDeclareCharClass { FullLeft } { "2018 , "201C }
            \xeCJKDeclareCharClass { FullRight }
              { "00B7, "2019, "201D, "2013, "2014, "2025, "2026, "2E3A }
          }
          {
            \sys_if_engine_luatex:T
              { \ltjsetparameter { jacharrange = { +9 } } }
          }
      }
      {
        \sys_if_engine_xetex:TF
          {
            \xeCJKDeclareCharClass { HalfLeft } { "2018 , "201C }
            \xeCJKDeclareCharClass { HalfRight }
              { "00B7, "2019, "201D, "2013, "2014, "2025, "2026, "2E3A }
          }
          {
            \sys_if_engine_luatex:T
              { \ltjsetparameter { jacharrange = { -9 } } }
          }
      }
  }

\__ustc_set_punctuations:
\tl_put_right:Nn \l__ustc_language_hook_tl { \__ustc_set_punctuations: }


% 根据语言设置各章节的名称，只有在导言区设置 \option{language} 时会修改，
% 而在正文局部切换语言时则不变。

% 由于《撰写手册》中的“speciality”一词使用的是英式拼法，
% 所以“acknowledgements”也保持一致。
\tl_new:N \l__ustc_list_figure_table_name_tl
\tl_new:N \l__ustc_notation_name_tl
\tl_new:N \l__ustc_acknowledgements_name_tl
\tl_new:N \l__ustc_achievements_name_tl

\cs_new:Npn \__ustc_set_chapter_names:
  {
    \bool_if:NTF \l__ustc_main_language_chinese_bool
      {
        \ctexset { chapter / name = { 第 , 章 } }
        \tl_set:Nn \contentsname{目录}
        \tl_set:Nn \listfigurename { 插图清单 }
        \tl_set:Nn \listtablename { 附表清单 }
        \tl_set:Nn \l__ustc_list_figure_table_name_tl { 插图和附表清单 }
        \tl_set:Nn \l__ustc_notation_name_tl { 符号说明 }
        \tl_set:Nn \bibname { 参考文献 }
        \tl_set:Nn \appendixname { 附录 }
        \tl_set:Nn \l__ustc_acknowledgements_name_tl { 致谢 }
        \tl_set:Nn \l__ustc_achievements_name_tl { 在读期间取得的科研成果 }
      }
      {
        \ctexset { chapter / name = \chaptername \space }
        \tl_set:Nn \contentsname { Contents }
        \tl_set:Nn \listfigurename { List~ of~ Figures }
        \tl_set:Nn \listtablename { List~ of~ Tables }
        \tl_set:Nn \l__ustc_list_figure_table_name_tl { List~ of~ Figures~ and~ Tables }
        \tl_set:Nn \l__ustc_notation_name_tl { Notation }
        \tl_set:Nn \bibname { Bibliography }
        \tl_set:Nn \appendixname { Appendix }
        \tl_set:Nn \l__ustc_acknowledgements_name_tl { Acknowledgements }
        \tl_set:Nn \l__ustc_achievements_name_tl { Research~ Achievements }
      }
  }

\__ustc_set_chapter_names:
\tl_put_right:Nn \l__ustc_main_language_hook_tl { \__ustc_set_chapter_names: }

% 这部分名称在正文中局部地修改语言时会发生变化。
\cs_new:Npn \__ustc_set_names:
  {
    \bool_if:NTF \l__ustc_language_chinese_bool
      {
        \tl_set:Nn \figurename { 图 }
        \tl_set:Nn \tablename { 表 }
      }
      {
        \tl_set:Nn \figurename { Figure }
        \tl_set:Nn \tablename { Table }
      }
  }

\__ustc_set_names:
\tl_put_right:Nn \l__ustc_language_hook_tl { \__ustc_set_names: }


% \subsection{字体}

% 字号

% 正文字号12 bp，研究生行距20 bp，本科生行距22 bp；
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
    \bool_if:NTF \l__ustc_degree_graduate_bool
      {
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
      }
      {
        \cs_set:Npn \normalsize
          {
            \@setfontsize \normalsize { 12 bp } { 22 bp }
            \skip_set:Nn \abovedisplayskip { 6 bp plus 3 bp minus 3 bp }
            \skip_set:Nn \abovedisplayshortskip { 6 bp plus 3 bp minus 3 bp }
            \skip_set_eq:NN \belowdisplayshortskip \abovedisplayshortskip
            \skip_set_eq:NN \belowdisplayskip \abovedisplayskip
            \cs_set_eq:NN \@listi \@listI
          }
      }
    \normalsize
    \cs_if_exist:NT \MakeRobust
      { \MakeRobust \normalsize }
  }
\__ustc_set_font_size:
\tl_put_right:Nn \l__ustc_degree_hook_tl { \__ustc_set_font_size: }

% 设置行距的倍数为 1。
\linespread { 1 } \selectfont


% 检测系统
\bool_new:N \l__ustc_platform_mac_bool
\bool_set_false:N \l__ustc_platform_mac_bool
\sys_if_platform_unix:T
  {
    \file_if_exist:nT { /System/Library/Fonts/Menlo.ttc }
      { \bool_set_true:N \l__ustc_platform_mac_bool }
  }

\prg_new_conditional:Nnn \__ustc_if_platform_mac: { T , F , TF }
  {
    \bool_if:NTF \l__ustc_platform_mac_bool
      { \prg_return_true: }
      { \prg_return_false: }
  }

% 处理 \opt{fontset}
\str_if_eq:VnT \l__ustc_fontset_str { auto }
  {
    \sys_if_platform_windows:TF
      { \keys_set:nn { ustc / options } { fontset = windows } }
      {
        \fontspec_font_if_exist:nTF { SimSun }
          { \keys_set:nn { ustc / options } { fontset = windows} }
          {
            \__ustc_if_platform_mac:TF
              { \keys_set:nn { ustc / options } { fontset = mac } }
              { \keys_set:nn { ustc / options } { fontset = fandol } }
          }
      }
  }

% 《撰写手册》要求西文字体使用 Times New Roman 和 Arial，
% 但是在 Linux 下没有这两个字体，所以使用它们的克隆版 TeX Gyre Termes 和
% TeX Gyre Heros。
\str_if_eq:VnT \l__ustc_font_str { auto }
  {
    \str_case:VnF \l__ustc_fontset_str
      {
        { windows } { \ustcsetup { font = times } }
        { mac }     { \ustcsetup { font = times } }
      }
      { \ustcsetup { font = termes } }
  }

% Times New Roman + Arial + Courier New
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
\cs_new:Npn \__ustc_set_font_stix:
  {
    \setmainfont { STIXTwoText }
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
\cs_set:Npn \__ustc_set_font_xits:
  {
    \setmainfont { XITS }
      [
        Extension      = .otf ,
        UprightFont    = *-Regular ,
        BoldFont       = *-Bold ,
        ItalicFont     = *-Italic ,
        BoldItalicFont = *-BoldItalic ,
      ]
    \__ustc_set_texgyre_sans_mono:
  }

% Libertinus
\cs_new:Npn \__ustc_set_font_libertinus:
  {
    \setmainfont { LibertinusSerif }
      [
        Extension      = .otf ,
        UprightFont    = *-Regular ,
        BoldFont       = *-Bold ,
        ItalicFont     = *-Italic ,
        BoldItalicFont = *-BoldItalic ,
      ]
    \setsansfont { LibertinusSans }
      [
        Extension      = .otf ,
        UprightFont    = *-Regular ,
        BoldFont       = *-Bold ,
        ItalicFont     = *-Italic ,
      ]
    \setmonofont { lmmonolt10 }
      [
        Extension      = .otf,
        UprightFont    = *-regular,
        BoldFont       = *-bold,
        ItalicFont     = *-oblique,
        BoldItalicFont = *-boldoblique,
      ]
  }

% New Computer Modern
\cs_new:Npn \__ustc_set_font_newcm:
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
\cs_new:Npn \__ustc_set_font_lm:
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

% Latin Modern
\cs_new:Npn \__ustc_set_font_cm: { }

% newtx 字体
\cs_new:Npn \__ustc_set_font_newtx:
  { \RequirePackage { newtxtext } }

% 设置西文字体
\cs_new:Npn \__ustc_set_font:
  { \use:c { __ustc_set_font_ \l__ustc_font_str : } }

\__ustc_set_font:
\tl_put_right:Nn \l__ustc_font_hook_tl { \__ustc_set_font: }


% 中文字体
\str_if_eq:VnT \l__ustc_cjk_font_str { auto }
  {
    \str_case:Vn \l__ustc_fontset_str
      {
        { windows } { \ustcsetup { cjk-font = windows } }
        { mac }     { \ustcsetup { cjk-font = mac } }
        { ubuntu }  { \ustcsetup { cjk-font = noto } }
        { fandol }  { \ustcsetup { cjk-font = fandol } }
      }
  }

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
  }

% 思源字体。
% 注意 Noto CJK 的 regular 字重名字不带“Regular”。
\cs_new:Npn \__ustc_set_cjk_font_noto:
  {
    \defaultCJKfontfeatures { }
    \setCJKmainfont { Noto~ Serif~ CJK~ SC }
      [
        UprightFont    = *~ Light ,
        BoldFont       = *~ Bold ,
        ItalicFont     = FandolKai-Regular,
        ItalicFeatures = { Extension = .otf } ,
        Script         = CJK ,
      ]
    \setCJKsansfont { Noto~ Sans~ CJK~ SC }
      [
        BoldFont       = *~ Medium ,
        Script         = CJK ,
      ]
    \setCJKmonofont { Noto~ Sans~ Mono~ CJK~ SC } [ Script = CJK ]
    \setCJKfamilyfont { zhsong } { Noto~ Serif~ CJK~ SC }
      [
        UprightFont    = *~ Light ,
        UprightFont    = *~ Bold ,
        Script         = CJK ,
      ]
    \setCJKfamilyfont { zhhei } { Noto~ Sans~ CJK~ SC }
      [
        BoldFont       = *~ Medium ,
        Script         = CJK ,
      ]
    \setCJKfamilyfont { zhfs } { FandolFang }
      [
        Extension      = .otf ,
        UprightFont    = *-Regular ,
      ]
    \setCJKfamilyfont { zhkai } { FandolKai }
      [
        Extension      = .otf ,
        UprightFont    = *-Regular ,
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

\str_if_eq:VnF \l__ustc_cjk_font_str { none }
  {
    \providecommand \songti { \CJKfamily { zhsong } }
    \providecommand \heiti { \CJKfamily { zhhei } }
    \providecommand \fangsong { \CJKfamily { zhfs } }
    \providecommand \kaishu { \CJKfamily { zhkai } }
  }

\cs_new:Npn \__ustc_set_cjk_font:
  { \use:c { __ustc_set_cjk_font_ \l__ustc_cjk_font_str : } }

\__ustc_set_cjk_font:
\tl_put_right:Nn \l__ustc_cjk_font_hook_tl { \__ustc_set_cjk_font: }


% 数学字体

% 设置数学符号风格。
\cs_new:Npn \__ustc_set_math_style:
  {
    \str_case:Vn \l__ustc_math_style_str
      {
        { TeX }
          {
            \keys_set:nn { ustc }
              {
                uppercase-greek    = upright ,
                less-than-or-equal = horizontal ,
                integral           = slanted ,
                integral-limits    = false ,
                partial            = italic ,
                math-ellipsis      = AMS ,
                real-part          = fraktur ,
              }
          }
        { ISO }
          {
            \keys_set:nn { ustc }
              {
                uppercase-greek    = italic ,
                less-than-or-equal = horizontal ,
                integral           = upright ,
                integral-limits    = true ,
                partial            = upright ,
                math-ellipsis      = lower ,
                real-part          = roman ,
              }
          }
        { GB }
          {
            \keys_set:nn { ustc }
              {
                uppercase-greek    = italic ,
                less-than-or-equal = slanted,
                integral           = upright ,
                integral-limits    = false ,
                partial            = upright ,
                math-ellipsis      = centered ,
                real-part          = roman ,
              }
          }
      }
  }

\__ustc_set_math_style:
\tl_gput_right:Nn \l__ustc_math_style_hook_tl { \__ustc_set_math_style: }

% 针对 \pkg{unicode-math} 逐项配置数学符号。

\cs_new:Npn \__ustc_set_unimath_leq:
  {
    \bool_if:NTF \l__ustc_leq_slanted_bool
      {
        \hook_gput_code:nnn { begindocument } { . }
          {
            \cs_set_protected_nopar:Npn \le { \leqslant }
            \cs_set_protected_nopar:Npn \ge { \geqslant }
          }
      }
      {
        \hook_gput_code:nnn { begindocument } { . }
          {
            \cs_set_protected_nopar:Npn \le { \leq }
            \cs_set_protected_nopar:Npn \ge { \geq }
          }
      }
  }

\tl_const:Nn \c__ustc_integral_symbols_tl
  {
    \int \iint \iiint \iiiint \oint \oiint \oiiint
    \intclockwise \varointclockwise \ointctrclockwise \sumint
    \intbar \intBar \fint \cirfnint \awint \rppolint
    \scpolint \npolint \pointint \sqint \intlarhk \intx
    \intcap \intcup \upint \lowint
  }

\cs_new:Npn \__ustc_set_unimath_integral_limits:
  {
    \bool_if:NTF \l__ustc_integral_limits_bool
      {
        \tl_map_inline:Nn \c__ustc_integral_symbols_tl
          { \removenolimits {##1} }
      }
      {
        \tl_map_inline:Nn \c__ustc_integral_symbols_tl
          { \addnolimits {##1} }
      }
  }

\cs_new:Npn \__ustc_set_unimath_ellipsis:
  {
    \str_if_eq:VnTF \l__ustc_math_ellipsis_str { centered }
      { \cs_set_protected:Npn \mathellipsis { \mathinner { \unicodecdots } } }
      { \cs_set_protected:Npn \mathellipsis { \mathinner { \unicodeellipsis } } }
  }

\cs_new:Npn \__ustc_set_unimath_real_part:
  {
    \bool_if:NTF \l__ustc_real_part_roman_bool
      {
        \hook_gput_code:nnn { begindocument } { . }
          {
            \cs_set_protected:Npn \Re { \operatorname { Re } }
            \cs_set_protected:Npn \Im { \operatorname { Im } }
          }
      }
      {
        \hook_gput_code:nnn { begindocument } { . }
          {
            \cs_set_eq:NN \Re \__ustc_save_real_part:
            \cs_set_eq:NN \Im \__ustc_save_imaginary_part:
          }
      }
  }

\cs_set:Npn \__ustc_set_unimath_style:
  {
    \bool_if:NTF \l__ustc_slanted_greek_bool
      { \unimathsetup { math-style = ISO } }
      { \unimathsetup { math-style = TeX } }
    \str_if_eq:VnTF \l__ustc_math_style_str { TeX }
      { \unimathsetup { bold-style = TeX } }
      { \unimathsetup { bold-style = ISO } }
    \__ustc_set_unimath_leq:
    \__ustc_set_unimath_integral_limits:
    \bool_if:NTF \l__ustc_partial_upright_bool
      { \unimathsetup { partial = upright } }
      { \unimathsetup { partial = italic } }
    \__ustc_set_unimath_ellipsis:
    \__ustc_set_unimath_real_part:
  }

\cs_new:Npn \__ustc_qed: { \rule { 1 ex } { 1 ex } }
\cs_new:Npn \__ustc_load_unimath:
  {
    \@ifpackageloaded { unicode-math }
      { }
      {
        \RequirePackage { unicode-math }
        \hook_gput_code:nnn { begindocument } { . }
          {
            \cs_set_eq:NN \__ustc_save_real_part: \Re
            \cs_set_eq:NN \__ustc_save_imaginary_part: \Im
          }
        % 兼容旧的粗体命令：\pkg{bm} 的 \cs{bm} 和 \pkg{amsmath} 的 \cs{boldsymbol}。
        \DeclareRobustCommand \bm [ 1 ] { { \symbfit {##1} } }
        \DeclareRobustCommand \boldsymbol [ 1 ] { { \symbfit {##1} } }
        % 兼容 \pkg{amsfonts} 和 \pkg{amssymb} 中的一些命令。
        \cs_new:Npn \square { \mdlgwhtsquare }
        \cs_new:Npn \blacksquare { \mdlgblksquare }
        \hook_gput_code:nnn { begindocument } { . }
          { \cs_set:Npn \checkmark { \ensuremath { ✓ } } }
        % 兼容 \pkg{amsthm} 的 \cs{qedsymbol}。
        \cs_set:Npn \__ustc_qed: { \ensuremath { \QED } }
      }
  }

% STIX Two Math
\cs_new:Npn \__ustc_set_math_font_stix:
  {
    \__ustc_load_unimath:
    \__ustc_set_unimath_style:
    \setmathfont { STIXTwoMath-Regular }
      [
        Extension    = .otf ,
        Scale        = MatchLowercase ,
        StylisticSet = \__ustc_xits_integral_stylistic_set: ,
      ]
    \setmathfont { STIXTwoMath-Regular }
      [
        Extension    = .otf ,
        Scale        = MatchLowercase ,
        StylisticSet = 1 ,
        range        = { scr , bfscr } ,
      ]
  }

% XITS Math
\cs_new:Npn \__ustc_xits_integral_stylistic_set:
  {
    \bool_if:NT \l__ustc_integral_upright_bool
      { 8 }
  }

\cs_new:Npn \__ustc_set_math_font_xits:
  {
    \__ustc_load_unimath:
    \__ustc_set_unimath_style:
    \setmathfont { XITSMath-Regular }
      [
        Extension    = .otf ,
        Scale        = MatchLowercase ,
        StylisticSet = \__ustc_xits_integral_stylistic_set: ,
      ]
    % 使用 STIX Two Math 的 `\mathcal` 字形
    \setmathfont { STIXTwoMath-Regular }
      [
        Extension    = .otf ,
        Scale        = MatchLowercase ,
        range        = { cal , bfcal } ,
      ]
  }

% Libertinus Math
\cs_new:Npn \__ustc_libertinus_integral_stylistic_set:
  {
    \bool_if:NF \l__ustc_integral_upright_bool
      { 8 }
  }

\cs_new:Npn \__ustc_set_math_font_libertinus:
  {
    \__ustc_load_unimath:
    \__ustc_set_unimath_style:
    \setmathfont { LibertinusMath-Regular }
      [
        Extension    = .otf,
        StylisticSet = \__ustc_libertinus_integral_stylistic_set: ,
      ]
    \setmathfont { XITSMath-Regular }
      [
        Extension    = .otf,
        range        = { \checkmark },
      ]
  }

% New Computer Modern Math
\cs_new:Npn \__ustc_newcm_integral_stylistic_set:
  {
    \bool_if:NT \l__ustc_integral_upright_bool
      { 2 }
  }

\cs_new:Npn \__ustc_set_math_font_newcm:
  {
    \__ustc_load_unimath:
    \__ustc_set_unimath_style:
    \setmathfont { NewCMMath-Book }
      [
        Extension    = .otf ,
        StylisticSet = \__ustc_newcm_integral_stylistic_set: ,
      ]
    \setmathfont { NewCMMath-Book }
      [
        Extension    = .otf ,
        StylisticSet = 1 ,
        range        = { scr , bfscr } ,
      ]
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
        Extension         = .otf ,
        UprightFont       = *-Book ,
        BoldFont          = *-Bold ,
        ItalicFont        = *-BookOblique ,
        BoldItalicFont    = *-BoldOblique ,
      ]
    \setmathtt { NewCMMono10 }
      [
        Extension           = .otf ,
        UprightFont         = *-Book ,
        ItalicFont          = *-BookItalic ,
        BoldFont            = *-Bold ,
        BoldItalicFont      = *-BoldOblique ,
      ]
  }

% Latin Modern Math
\cs_new:Npn \__ustc_set_math_font_lm:
  {
    \__ustc_load_unimath:
    \__ustc_set_unimath_style:
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
    \str_if_eq:VnF \l__ustc_font_str { newtx }
      {
        \tl_set_eq:NN \l__ustc_save_encoding_default_tl \encodingdefault
        \tl_set_eq:NN \l__ustc_save_rm_default_tl \rmdefault
        \tl_set_eq:NN \l__ustc_save_sf_default_tl \sfdefault
        \tl_set_eq:NN \l__ustc_save_tt_default_tl \ttdefault
        \RequirePackage [ T1 ] { fontenc }
        \tl_set:Nn \rmdefault { ntxtlf }
        \tl_set:Nn \sfdefault { qhv }
        \tl_set:Nn \ttdefault { ntxtt }
      }
    \bool_if:NTF \l__ustc_slanted_greek_bool
      { \PassOptionsToPackage { slantedGreek } { newtxmath } }
    \bool_if:NT \l__ustc_integral_upright_bool
      { \PassOptionsToPackage { upint } { newtxmath } }
    \RequirePackage { newtxmath }
    \bool_if:NT \l__ustc_leq_slanted_bool
      {
        \cs_set_protected_nopar:Npn \le { \leqslant }
        \cs_set_protected_nopar:Npn \ge { \geqslant }
      }
    \bool_if:NT \l__ustc_integral_limits_bool
      { \cs_set_eq:NN \ilimits@ \displaylimits }
    \cs_set_eq:NN \l__ustc_save_partial_tl \partial
    \bool_if:NT \l__ustc_partial_upright_bool
      { \cs_set_eq:NN \partial \uppartial }
    \str_if_eq:VnTF \l__ustc_math_ellipsis_str { centered }
      { \DeclareRobustCommand \mathellipsis { \mathinner { \cdotp \cdotp \cdotp } } }
      { \DeclareRobustCommand \mathellipsis { \mathinner { \ldotp \ldotp \ldotp } } }
    \cs_set_eq:NN \__ustc_save_real_part: \Re
    \cs_set_eq:NN \__ustc_save_imaginary_part: \Im
    \bool_if:NT \l__ustc_real_part_roman_bool
      {
        \cs_set:Nn \Re { \operatorname { Re } }
        \cs_set:Nn \Im { \operatorname { Im } }
      }
    \RequirePackage { bm }
    \str_if_eq:VnF \l__ustc_font_str { newtx }
      {
        \tl_set_eq:NN \encodingdefault \l__ustc_save_encoding_default_tl
        \tl_set_eq:NN \rmdefault \l__ustc_save_rm_default_tl
        \tl_set_eq:NN \sfdefault \l__ustc_save_sf_default_tl
        \tl_set_eq:NN \ttdefault \l__ustc_save_tt_default_tl
      }
    \cs_set_protected:Npn \symup ##1 { { \mathrm {##1} } }
    \cs_set_protected:Npn \symbf ##1 { { \bm {##1} } }
    \cs_set_protected:Npn \symbfsf ##1 { { \bm {##1} } }
    \cs_set_eq:NN \increment \upDelta
    \cs_set:Npn \__ustc_qed: { \openbox }
  }

% Computer Modern
% 使用 LaTeX 默认的 cm 字体
\cs_new:Npn \__ustc_set_math_font_cm:
  {
    \RequirePackage { amssymb }
    \bool_if:NT \l__ustc_leq_slanted_bool
      {
        \cs_set_protected_nopar:Npn \le { \leqslant }
        \cs_set_protected_nopar:Npn \ge { \geqslant }
      }
    \bool_if:NT \l__ustc_integral_limits_bool
      { \cs_set_eq:NN \ilimits@ \displaylimits }
    \str_if_eq:VnTF \l__ustc_math_ellipsis_str { centered }
      { \DeclareRobustCommand \mathellipsis { \mathinner { \cdotp \cdotp \cdotp } } }
      { \DeclareRobustCommand \mathellipsis { \mathinner { \ldotp \ldotp \ldotp } } }
    \cs_set_eq:NN \__ustc_save_real_part: \Re
    \cs_set_eq:NN \__ustc_save_imaginary_part: \Im
    \bool_if:NT \l__ustc_real_part_roman_bool
      {
        \cs_set:Nn \Re { \operatorname { Re } }
        \cs_set:Nn \Im { \operatorname { Im } }
      }
    \RequirePackage { bm }
    \cs_set_protected:Npn \symup ##1 { { \mathrm {##1} } }
    \cs_set_protected:Npn \symbf ##1 { { \bm {##1} } }
    \cs_set_protected:Npn \symbfsf ##1 { { \bm {##1} } }
    \cs_set_eq:NN \increment \Delta
    \cs_set:Npn \__ustc_qed: { \openbox }
    \cs_set_eq:NN \uppi \pi
  }

% 不设置数学字体，仅提供兼容支持。
\cs_new:Npn \__ustc_set_math_font_none:
  {
    \RequirePackage { amssymb }
    \RequirePackage { bm }
    \cs_set_protected:Npn \symup ##1 { { \mathrm {##1} } }
    \cs_set_protected:Npn \symbf ##1 { { \bm {##1} } }
    \cs_set_protected:Npn \symbfsf ##1 { { \bm {##1} } }
    \cs_set_eq:NN \increment \Delta
    \cs_set:Npn \__ustc_qed: { \openbox }
    \cs_set_eq:NN \uppi \pi
  }

\cs_new:Npn \__ustc_set_math_font:
  { \use:c { __ustc_set_math_font_ \l__ustc_math_font_str : } }
\tl_put_right:Nn \l__ustc_math_font_hook_tl
  { \tl_put_right:Nn \l__ustc_setup_hook_tl { \__ustc_set_math_font: } }
\cs_new:Npn \__ustc_set_math_font_auto:
  {
    \str_if_eq:VnT \l__ustc_math_font_str { auto }
      { \ustcsetup { math-font = xits } }
  }
\__ustc_at_begin_package:nn { siunitx } { \__ustc_set_math_font_auto: }
\__ustc_at_end_preamble:n
  {
    \__ustc_set_math_font_auto:
    \cs_if_exist:NF \square
      { \RequirePackage { amssymb } }
  }


% \subsection{纸张和页面}
% 使用 \pkg{geometry} 宏包设置纸张和页面。

% 纸张：A4；

% 纸张大小：标准A4（21.0 cm×29.7 cm）尺寸。
% 页边距：上、下、左、右、装订线的页边距分别为：2.54 cm，2.54 cm，3.17 cm，3.17 cm，0 cm。装订线位置：左。左右对称页边距。
% 页眉距边界 2.0 cm
% 页脚距边界 1.5 cm
% headheight 为 14.65 bp ≈ 0.49 cm，headsep 为 2.54 - 1.5 - 0.49 = 0.55 cm。
\geometry
  {
    paper      = a4paper ,
    vmargin    = 2.54 cm ,
    hmargin    = 3.17 cm ,
    headheight = 0.49 cm ,
    headsep    = 0.55 cm ,
    footskip   = 0.79 cm ,
  }

\cs_new:Npn  \__ustc_header_font:
  {
    \bool_if:NTF \l__ustc_degree_graduate_bool
      { \fontsize { 10.5 bp } { 13.65 bp } \selectfont }
      { \fontsize { 9 bp } { 11.7 bp } \selectfont }
  }
\cs_set_eq:NN \sectionmark \use_none:n
\cs_set:Npn \headrulewidth { 0.75 bp }

% 使用 \pkg{fancy} 需要先调用 |\pagestyle{fancy}| 再修改 \cs{chaptermark} 和
% \cs{sectionmark}。
\pagestyle { fancy }
% 重定义默认的 |plain| page style，显示页眉和页脚。
\fancypagestyle { plain }
  {
    \fancyhf { }
    % 页眉与该部分的章标题相同，宋体 10.5 磅（五号）居中。
    % 页码：宋体 10.5 磅、页面下脚居中。
    \bool_if:NTF \l__ustc_degree_graduate_bool
      {
        \fancyhead [ C ] { \__ustc_header_font: \leftmark }
        \fancyfoot [ C ] { \__ustc_header_font: \thepage }
        \cs_set_eq:NN \@mkboth \markboth
        \cs_set:Npn \chaptermark ##1
          { \markboth { \CTEXifname { \CTEXthechapter \quad } { } ##1 } { } }
        \cs_set_eq:NN \sectionmark \use_none:n
      }
      {
        % 本科生要求除封面、扉页外，每面上部加页眉，
        % 用小 5 号字（9 bp）标注“中国科学技术大学本科毕业论文”，居中；
        % 从目录页开始在每面底部居中用小五宋体（9 bp）连续编页码。
        \fancyhead [ C ] { \__ustc_header_font: 中国科学技术大学本科毕业论文 }
        \fancyfoot [ C ] { \__ustc_header_font: \thepage }
        \cs_set_eq:NN \@mkboth \use_none:nn
        \cs_set_eq:NN \chaptermark \use_none:n
        \cs_set_eq:NN \sectionmark \use_none:n
      }
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
    \fancyfoot [ C ] { \__ustc_header_font: \thepage }
  }

\bool_new:N \l__ustc_title_page_bool

\cs_set_nopar:Npn \cleardoublepage
  {
    \clearpage
    \if@twoside
      \int_if_odd:nF { \c@page }
        {
          \hbox:n { }
          \bool_if:NTF \l__ustc_degree_graduate_bool
            {
              % 封面的空白页不显示页码
              \bool_if:NTF \l__ustc_title_page_bool
                { \thispagestyle { empty } }
                { \thispagestyle { blank } }
            }
            { \thispagestyle { empty } }
          \newpage
          \if@twocolumn
            \hbox:n { }
            \newpage
          \fi
        }
    \fi
  }

% 研究生要求从“中文摘要”开始页码用大写罗马数字，
% 而本科生的 frontmatter（只有致谢）不编页码，从目录开始页码用阿拉伯数字。
\cs_set:Npn \frontmatter
  {
    \cleardoublepage
    \@mainmatterfalse
    \pagenumbering { Roman }
    \bool_if:NTF \l__ustc_degree_graduate_bool
      { \pagestyle { plain } }
      { \pagestyle { headings } }
  }

% 研究生要求“第 1 章”要另页起，但是本科生要求另面起。
\cs_set:Npn \mainmatter
  {
    \bool_if:NTF \l__ustc_degree_graduate_bool
      {
        \cleardoublepage
        \pagenumbering { arabic }
      }
      { \clearpage }
    \pagestyle { plain }
    \@mainmattertrue
  }

\tl_gput_right:Nn \appendix { \@mainmattertrue }


% \subsection{封面}


% 定义用户接口：
\tl_new:N \l__ustc_title_tl
\tl_new:N \l__ustc_title_en_tl
\tl_new:N \l__ustc_author_tl
\tl_new:N \l__ustc_author_en_tl
\tl_new:N \l__ustc_speciality_tl
\tl_new:N \l__ustc_speciality_en_tl
\clist_new:N \l__ustc_supervisor_clist
\clist_new:N \l__ustc_supervisor_en_clist
\clist_new:N \l__ustc_practice_supervisor_clist
\clist_new:N \l__ustc_practice_supervisor_en_clist
\seq_new:N \l__ustc_date_seq
\tl_new:N \l__ustc_department_tl
\tl_new:N \l__ustc_student_id_tl
\tl_new:N \l__ustc_secret_level_tl
\tl_new:N \l__ustc_secret_level_en_tl
\tl_new:N \l__ustc_secret_year_tl
\clist_new:N \l__ustc_keywords_clist
\clist_new:N \l__ustc_keywords_en_clist

\keys_define:nn { ustc }
  {
    title  .tl_set:N = \l__ustc_title_tl ,
    title* .tl_set:N = \l__ustc_title_en_tl ,
    author  .tl_set:N = \l__ustc_author_tl ,
    author* .tl_set:N = \l__ustc_author_en_tl ,
    speciality  .tl_set:N = \l__ustc_speciality_tl ,
    speciality* .tl_set:N = \l__ustc_speciality_en_tl ,
    supervisor  .clist_set:N = \l__ustc_supervisor_clist ,
    supervisor* .clist_set:N = \l__ustc_supervisor_en_clist ,
    practice-supervisor  .clist_set:N = \l__ustc_practice_supervisor_clist ,
    practice-supervisor* .clist_set:N = \l__ustc_practice_supervisor_en_clist ,
    % Deprecated since 2025-01-04
    advisor  .clist_set:N = \l__ustc_practice_supervisor_clist ,
    advisor  .code:n =
      {
        \__ustc_deprecated:nnn { 'advisor' option }
          { 2025-01-04 } { 'practice-supervisor' }
      } ,
    advisor* .clist_set:N = \l__ustc_practice_supervisor_en_clist ,
    advisor* .code:n =
      {
        \__ustc_deprecated:nnn { 'advisor*' option }
          { 2025-01-04 } { 'practice-supervisor*' }
      } ,
    date .code:n = { \__ustc_set_date:n {#1} } ,
    % Deprecated since 2025-01-04
    professional-type  .code:n =
      {
        \msg_warning:nnnn { ustcthesis } { obsolete }
          { 'professional-type'~ option } { 2025-01-04 }
      } ,
    professional-type* .code:n =
      {
        \msg_warning:nnnn { ustcthesis } { obsolete }
          { 'professional-type*'~ option } { 2025-01-04 }
      } ,
    department .tl_set:N = \l__ustc_department_tl ,
    student-id .tl_set:N = \l__ustc_student_id_tl ,
    secret-level  .tl_set:N = \l__ustc_secret_level_tl ,
    secret-level* .tl_set:N = \l__ustc_secret_level_en_tl ,
    secret-year .tl_set:N = \l__ustc_secret_year_tl ,
    keywords  .clist_set:N = \l__ustc_keywords_clist ,
    keywords* .clist_set:N = \l__ustc_keywords_en_clist ,
  }

\cs_new:Npn \__ustc_set_date:n #1
  {
    % \tl_set:Ne is not available in TeX Live 2022
    \tl_set:Nx \l_tmpa_tl {#1}
    \regex_if_match:nVTF { ^ \d { 4 } - \d { 2 } - \d { 2 } $ } \l_tmpa_tl
      {
        \seq_set_split:NnV \l_tmpa_seq { - } \l_tmpa_tl
        \seq_clear:N \l__ustc_date_seq
        \seq_map_inline:Nn \l_tmpa_seq
          { \seq_put_right:Ne \l__ustc_date_seq { \int_eval:n { ##1 } } }
      }
      { \msg_error:nnn { ustcthesis } { invalid-date } {#1} }
  }

\msg_new:nnn { ustcthesis } { invalid-date }
  { The~ date~ '#1'~ is~ invalid.~ Expecting~ ISO~ format~ 'YYYY-MM-DD'. }

\msg_new:nnn { ustcthesis } { obsolete }
  { The~ #1~ is~ no~ longer~ required~ and~ is~ obsolete~ since~ #2. }

\keys_set:nn { ustc }
  {
    title  = 论文题目 ,
    title* = Title ,
    author  = 作者姓名 ,
    author* = Author~ Name ,
    speciality  = 专业 ,
    speciality* = Speciality ,
    supervisor  = 导师 ,
    supervisor* = Supervisor~ Name ,
    practice-supervisor  = { } ,
    practice-supervisor* = { } ,
  }

% \seq_set_split:Nne is not available in TeX Live 2022
\tl_set:Nx \l_tmpa_tl
  {
    \int_use:N \c_sys_year_int
    - \int_use:N \c_sys_month_int
    - \int_use:N \c_sys_day_int
  }
\seq_set_split:NnV \l__ustc_date_seq { - } \l_tmpa_tl


% 版本 v3.2 开始使用 \cs{ustcsetup} 设置接口，
% 兼容旧版本的命令式设置。
% Deprecated since 2020-07-01.
\cs_new:Npn \__ustc_def_info_cmd:nn #1#2
  {
    \cs_set:cpn {#1} ##1
      {
        \__ustc_deprecated:nnn { ' \iow_char:N \\ #1 '~ command } { 2020-07-01 }
          { ' \token_to_str:N \ustcsetup '~ with~ '#2'~ option }
        \ustcsetup { #2 = { ##1 } }
      }
  }
\__ustc_def_info_cmd:nn { title } { title }
\__ustc_def_info_cmd:nn { entitle } { title* }
\__ustc_def_info_cmd:nn { author } { author }
\__ustc_def_info_cmd:nn { enauthor } { author* }
\__ustc_def_info_cmd:nn { major } { speciality }
\__ustc_def_info_cmd:nn { enmajor } { speciality* }
\__ustc_def_info_cmd:nn { supervisor } { supervisor }
\__ustc_def_info_cmd:nn { ensupervisor } { supervisor* }
\cs_new:Npn \cosupervisor #1
  {
    \__ustc_deprecated:nnn { ' \token_to_str:N \cosupervisor '~ command }
      { 2020-07-01 } { ' \token_to_str:N \ustcsetup '~ with 'supervisor'~ option }
    \clist_put_right:Nn \l__ustc_supervisor_clist {#1}
  }
\cs_new:Npn \encosupervisor #1
  {
    \__ustc_deprecated:nnn { ' \token_to_str:N \encosupervisor '~ command }
      { 2020-07-01 } { ' \token_to_str:N \ustcsetup '~ with 'supervisor*'~ option }
    \clist_put_right:Nn \l__ustc_supervisor_en_clist {#1}
  }

\tl_clear_new:N \l__ustc_date_text_tl
\tl_clear_new:N \l__ustc_date_en_text_tl

\cs_set:Npn \date #1
  {
    \__ustc_deprecated:nnn { ' \token_to_str:N \date '~ command }
      { 2020-07-01 } { ' \token_to_str:N \ustcsetup '~ with 'date'~ option }
    \tl_set:Nn \l__ustc_date_text_tl {#1}
  }
\cs_new:Npn \endate #1
  {
    \__ustc_deprecated:nnn { ' \token_to_str:N \endate '~ command }
      { 2020-07-01 } { ' \token_to_str:N \ustcsetup '~ with 'date'~ option }
    \tl_set:Nn \l__ustc_date_en_text_tl {#1}
  }
\__ustc_def_info_cmd:nn { professionaltype } { professional-type }
\__ustc_def_info_cmd:nn { enprofessionaltype } { professional-type* }
\__ustc_def_info_cmd:nn { secretlevel } { secret-level }
\__ustc_def_info_cmd:nn { ensecretlevel } { secret-level* }
\__ustc_def_info_cmd:nn { secretyear } { secret-year }

\tl_new:N \l__ustc_keywords_text_tl
\tl_new:N \l__ustc_keywords_en_text_tl

\cs_new:Npn \keywords #1
  {
    \__ustc_deprecated:nnn { ' \token_to_str:N \keywords '~ command }
      { 2020-07-01 } { ' \token_to_str:N \ustcsetup '~ with 'keywords'~ option }
    \tl_set:Nn \l__ustc_keywords_text_tl {#1}
  }
\cs_new:Npn \enkeywords #1
  {
    \__ustc_deprecated:nnn { ' \token_to_str:N \enkeywords '~ command }
      { 2020-07-01 } { ' \token_to_str:N \ustcsetup '~ with 'keywords*'~ option }
    \tl_set:Nn \l__ustc_keywords_en_text_tl {#1}
  }

% 定义一些常量。
\cs_set:Nn \__ustc_thesis_name:
  {
    \str_case:Vn \l__ustc_degree_type_str
      {
        { professional } { 专业 }
        { engineering }  { 工程 }
      }
    \str_case:Vn \l__ustc_degree_str
      {
        { doctor }   { 博士 }
        { master }   { 硕士 }
        { bachelor } { 学士 }
      }
    学位论文
  }
\cs_set:Npn \__ustc_thesis_name_en:
  { A~ dissertation~ for~ \str_use:N \l__ustc_degree_str 's~ degree }

% 定义校徽颜色
%
% 推迟定义颜色以避免调用 \pkg{xcolor} 时的警告
\hook_gput_code:nnn { begindocument } { . }
  { \definecolor { ustcblue } { cmyk } { 1 , 0.8 , 0 , 0 } }

% 添加 PDF 书签，在 \pkg{hyperref} 载入后才有效。
\cs_new:Npn \__ustc_pdf_bookmark:n #1 { }

% 重定义 \env{titlepage} 环境，不修改页码。
\RenewDocumentEnvironment { titlepage } { }
  {
    \cleardoublepage
    \if@twocolumn
      \@restonecoltrue
      \onecolumn
    \else
      \@restonecolfalse
      \newpage
    \fi
    \thispagestyle { empty }
  }
  {
    \if@restonecol
      \twocolumn
    \else
      \newpage
    \fi
  }

% 中文封面：
% 密级仿宋 14 磅；
% 论文类型黑体 56 磅；
% 论文题目黑体 26 磅加粗居中，单倍行距；
% 作者姓名宋体 16 磅，1.5 倍行距；
\cs_new:Npn \__ustc_title_page_graduate_zh:
  {
    \ustcsetup { language = chinese }
    \begin { titlepage }
      \__ustc_pdf_bookmark:n { 封面 }
      \centering
      \parbox [ t ] [ 0 bp ] [ t ] { \textwidth }
        {
          \raggedleft \fangsong
          \fontsize { 14 bp } { 14 bp } \selectfont
          \null \tl_use:N \l__ustc_secret_level_tl
        }
      \par
      \skip_vertical:n { 11 bp }
      \includegraphics [ height = 1.3 cm ] { figures/ustc-name-stxingkai.pdf } \par
      \skip_vertical:n { -7 bp }
      \group_begin:
        \sffamily \fontsize { 54 bp } { 70.2 bp } \selectfont
        \ifXeTeX
          \cs_set_protected:Npn \CJKglue { \skip_horizontal:n { -5.2 bp } }
        \else
          \ltjsetparameter { kanjiskip = { -5.2 bp } }
        \fi
        \__ustc_thesis_name: \par
      \group_end:
      \skip_vertical:n { 51 bp }
      \group_begin:
        \bool_if:NF \l__ustc_badge_color_black_bool
          { \color { ustcblue } }
        \includegraphics [ height = 123 bp ] { figures/ustc-badge.pdf } \par
      \group_end:
      \skip_vertical:n { 2.8 bp }
      \parbox [ t ] [ 101.3 bp ] [ c ] { \textwidth }
        {
          \centering \sffamily \bfseries
          \fontsize { 26 bp } { 33.8 bp } \selectfont
          \tl_use:N \l__ustc_title_tl
        }
      \par
      \skip_vertical:n { 37 bp }
      \parbox [ t ] { \textwidth }
        {
          \skip_horizontal:n { 45 bp }
          \parbox [ t ] { 368 bp }
            {
              % 1.5 行 = 16 bp * 1.3 * 1.5
              \fontsize { 16 bp }{ 31.2 bp } \selectfont
              \textsf { 作者姓名： } \quad \tl_use:N \l__ustc_author_tl \par
              \str_if_eq:VnTF \l__ustc_degree_type_str { engineering }
                {
                  % 工程硕士的封面是“类别领域”，而工程博士的是“学科专业”
                  \str_if_eq:VnTF \l__ustc_degree_str { master }
                    {
                      \textsf { 类别领域： } \quad
                      \tl_use:N \l__ustc_speciality_tl \par
                    }
                    {
                      \textsf { 学科专业： } \quad
                      \tl_use:N \l__ustc_speciality_tl \par
                    }
                }
                {
                  \textsf { 学科专业： } \quad
                  \tl_use:N \l__ustc_speciality_tl \par
                }
              \clist_if_empty:NTF \l__ustc_practice_supervisor_clist
                {
                  \textsf { 导 \skip_horizontal:n { 2 em } 师： } \quad
                  \clist_use:Nn \l__ustc_supervisor_clist { \quad } \par
                }
                {
                  \textsf { 校内导师： } \quad
                  \clist_use:Nn \l__ustc_supervisor_clist { \quad } \par
                  \textsf { 实践导师： } \quad
                  \clist_use:Nn \l__ustc_practice_supervisor_clist { \quad } \par
                }
              \textsf { 完成时间： } \quad \__ustc_format_date_zh: \par
            }
        }
    \end { titlepage }
    \__ustc_reset_main_language:
  }

\cs_new:Npn \__ustc_format_date_zh:
  {
    \exp_args:Ne \zhdigits { \seq_item:Nn \l__ustc_date_seq { 1 } } 年
    \exp_args:Ne \zhnumber { \seq_item:Nn \l__ustc_date_seq { 2 } } 月
    \exp_args:Ne \zhnumber { \seq_item:Nn \l__ustc_date_seq { 3 } } 日
  }


% 英文封面
\cs_set:Npn \__ustc_title_page_graduate_en:
  {
    \ustcsetup { language = english }
    \begin { titlepage }
      \__ustc_pdf_bookmark:n { Title~ page }
      \centering
      \parbox [ t ] [ 0 bp ] [ t ] { \textwidth }
        {
          \raggedleft \fangsong
          \fontsize { 14 bp } { 14 bp } \selectfont
          \null \tl_use:N \l__ustc_secret_level_en_tl
        }
      \par
      \skip_vertical:n { 5 bp }
      \group_begin:
        \fontsize { 20 bp } { 30 bp } \selectfont
        University~ of~ Science~ and~ Technology~ of~ China\par
      \group_end:
      \skip_vertical:n { 30 bp }
      \group_begin:
        \fontsize { 26 bp } { 30 bp } \selectfont
        \__ustc_thesis_name_en: \par
      \group_end:
      \skip_vertical:n { 68 bp }
      \group_begin:
        \bool_if:NF \l__ustc_badge_color_black_bool
          { \color { ustcblue } }
        % \skip_horizontal:n { 3 bp }
        \includegraphics [ height = 123 bp ] { figures/ustc-badge.pdf } \par
      \group_end:
      \skip_vertical:n { 10 bp }
      \parbox [ t ] [ 90 bp ] [ c ] { \textwidth }
        {
          \centering \sffamily \bfseries
          \fontsize { 26 bp } { 30 bp } \selectfont
          \tl_use:N \l__ustc_title_en_tl
        }
      \par
      \skip_vertical:n { 48 bp }
      \parbox [ t ] { \textwidth }
        {
          \skip_horizontal:n { 61.5 bp }
          \parbox [ t ] { 352 bp }
            {
              \fontsize { 16 bp } { 30 bp } \selectfont
              Author:~       \tl_use:N \l__ustc_author_en_tl \par
              Speciality:~   \tl_use:N \l__ustc_speciality_en_tl \par
              \__ustc_print_supervisors_en: \par
              \clist_if_empty:NF \l__ustc_practice_supervisor_en_clist
                { \__ustc_print_practice_supervisors_en: \par }
              Completion~ date:~
              \tl_if_empty:NTF \l__ustc_date_en_text_tl
                { \__ustc_format_date_en: }
                { \tl_use:N \l__ustc_date_en_text_tl }
              \par
            }
      }
      \par
    \end { titlepage }
    \__ustc_reset_main_language:
  }

\cs_new:Npn \__ustc_print_supervisors_en:
  {
    \int_compare:nNnTF { \clist_count:N \l__ustc_supervisor_en_clist } > { 1 }
      { Supervisors: }
      { Supervisor: }
    \space
    \clist_use:Nn \l__ustc_supervisor_en_clist { ,~ }
  }

\cs_new:Npn \__ustc_print_practice_supervisors_en:
  {
    \int_compare:nNnTF { \clist_count:N \l__ustc_practice_supervisor_en_clist } > { 1 }
      { Practice~ supervisors: }
      { Practice~ supervisor: }
    \space
    \clist_use:Nn \l__ustc_practice_supervisor_en_clist { ,~ }
  }

\cs_new:Npn \__ustc_format_date_en:
  {
    \int_case:nn { \seq_item:Nn \l__ustc_date_seq { 2 } }
      {
        { 1 } { January }
        { 2 } { February }
        { 3 } { March }
        { 4 } { April }
        { 5 } { May }
        { 6 } { June }
        { 7 } { July }
        { 8 } { August }
        { 9 } { September }
        { 10 } { October }
        { 11 } { November }
        { 12 } { December }
      } ~
    \seq_item:Nn \l__ustc_date_seq { 3 } , ~
    \seq_item:Nn \l__ustc_date_seq { 1 }
  }
\box_new:N \l__ustc_title_box

\NewDocumentCommand { \makecover } {  }
  { \__ustc_cover: }

% 本科生的外封
\cs_new:Npn \__ustc_cover:
  {
    \begin { titlepage }
      \__ustc_pdf_bookmark:n {Cover }
      \centering
      \vspace * { 0.8 cm }
      \includegraphics { figures / ustc-title-page-heading.pdf }
      \skip_vertical:n { 4.3 cm }
      \group_begin:
        \bfseries \fontsize { 15 bp } { 16 bp } \selectfont
        \dim_zero:N \tabcolsep
        \dim_set:Nn \arrayrulewidth { 1.5 pt }
        \begin { tabular }{ l p { 140 bp } l p { 140 bp } }
          题 \quad 目 &
            \multicolumn { 3 } { c }
              {
                \multirow [ t ] { 2 } { 325 bp }
                  {
                    \hbox_set:Nn \l__ustc_title_box
                      {
                        \parbox [ t ] { 325 bp }
                          {
                            \centering \fontsize { 15 bp } { 40 bp } \selectfont
                            \tl_use:N \l__ustc_title_tl
                          }
                      }
                    \box_set_dp:Nn \l__ustc_title_box { \c_zero_dim }
                    \box_use:N \l__ustc_title_box
                  }
              } \\
          \cline { 2 - 4 }
          \noalign { \skip_vertical:n { 24 bp } }
          & & & \\
          \cline { 2 - 4 }
          \noalign { \skip_vertical:n { 24 bp } }
          英 \quad 文 &
            \multicolumn { 3 } { c }
              {
                \multirow [ t ] { 3 } { 325 bp }
                  {
                    \savebox \l__ustc_title_box
                      {
                        \parbox [ t ] { 325 bp }
                          {
                            \centering \fontsize { 15 bp } { 40 bp } \selectfont
                            \tl_use:N \l__ustc_title_en_tl
                          }
                      }
                    \box_set_dp:Nn \l__ustc_title_box { \c_zero_dim }
                    \box_use:N \l__ustc_title_box
                  }
              } \\
          \cline { 2 - 4 }
          \noalign { \skip_vertical:n { 24 bp } }
          题 \quad 目 & & & \\
          \cline { 2 - 4 }
          \noalign { \skip_vertical:n { 24 bp } }
          & & & \\
          \cline { 2 - 4 }
          \noalign { \skip_vertical:n { 24 bp } }
          院 \quad 系 & \multicolumn { 3 } { c }
            { \tl_use:N \l__ustc_department_tl } \\
          \cline { 2 - 4 }
          \noalign { \skip_vertical:n { 24 bp } }
          姓 \quad 名 & \multicolumn { 1 } { c }
            { \tl_use:N \l__ustc_author_tl } &
          学 \quad 号 & \multicolumn { 1 } { c }
            { \tl_use:N \l__ustc_student_id_tl } \\
          \cline { 2 - 2 }
          \cline { 4 - 4 }
          \noalign { \skip_vertical:n { 24 bp } }
          导 \quad 师 & \multicolumn { 3 } { c }
            { \clist_use:Nn \l__ustc_supervisor_clist { \quad } } \\
          \cline { 2 - 4 }
          \noalign { \skip_vertical:n { 24 bp } }
          日 \quad 期 & \multicolumn { 3 } { c } { \__ustc_format_date_zh_arabic: } \\
          \cline { 2 - 4 }
        \end { tabular }
      \group_end:
    \end { titlepage }
  }

% 本科生的扉页（内封）
\cs_new:Npn \__ustc_title_page_bachelor:
  {
    \begin { titlepage }
      \__ustc_pdf_bookmark:n { Title~ page }
      \centering
      \vspace* { 29.5 bp }
      \includegraphics { figures/ustc-name-stxingkai.pdf } \par
      \skip_vertical:n { 0.8 bp }
      \group_begin:
        \sffamily \fontsize { 56 bp } { 72.8 bp } \selectfont
        \sys_if_engine_xetex:TF
          { \cs_set_protected:Npn \CJKglue { \hspace { 6.2 bp } } }
          {
            \sys_if_engine_luatex:T
              { \ltjsetparameter { kanjiskip = { 6.2 bp } } }
          }
        本科毕业论文\par
      \group_end:
      \skip_vertical:n { 52 bp }
      \group_begin:
        \bool_if:NF \l__ustc_badge_color_black_bool
          { \color { ustcblue } }
        \includegraphics [ height = 126 bp ] { figures/ustc-badge.pdf } \par
      \group_end:
      \par
      \skip_vertical:n { 43 bp }
      \parbox [ t ] [ 115 bp ] [ t ] { \textwidth }
        {
          \centering \sffamily \bfseries
          \fontsize { 26 bp } { 46.8 bp } \selectfont
          \tl_use:N \l__ustc_title_tl \par
        }
      \par
      \group_begin:
        \skip_horizontal:n { 10 bp }
        \heiti \fontsize { 16 bp } { 31.7 bp } \selectfont
        \dim_set_eq:NN \tabcolsep \c_zero_dim
        % TODO: fix pt
        \dim_set:Nn \arrayrulewidth { 0.5 pt }
        \begin { tabular } { p { 90 bp } c }
          作者姓名： & \makebox [ 238 bp ] { \tl_use:N \l__ustc_author_tl } \\
          \cline { 2 - 2 }
          学 \quad \quad 号： &
            \makebox [ 238 bp ] { \tl_use:N \l__ustc_student_id_tl } \\
          \cline { 2 - 2 }
          专 \quad \quad 业： &
            \makebox [ 238 bp ] { \tl_use:N \l__ustc_speciality_tl } \\
          \cline { 2 - 2 }
          导 \hspace { 2 em } 师： &
            \makebox [ 238 bp ]
              { \clist_use:Nn \l__ustc_supervisor_clist { \quad } } \\
          \cline { 2 - 2 }
          完成时间： & \makebox [ 238 bp ] { \__ustc_format_date_zh_arabic: } \\
          \cline { 2 - 2 }
        \end { tabular }
        \par
      \group_end:
    \end { titlepage }
  }

  \cs_new:Npn \__ustc_format_date_zh_arabic:
    {
      \seq_item:Nn \l__ustc_date_seq { 1 } ~年~
      \seq_item:Nn \l__ustc_date_seq { 2 } ~月~
      \seq_item:Nn \l__ustc_date_seq { 3 } ~日
    }


% 重新定义 \cs{maketitle}
% 分别生成中、英文封面。
\cs_set:Npn \maketitle
  {
    \pagenumbering { Alph }
    \pagestyle { empty }
    \bool_set_true:N \l__ustc_title_page_bool
    \bool_if:NT \l__ustc_review_bool
      {
        \ustcsetup
          {
            author  = {} ,
            author* = {} ,
            speciality  = {} ,
            speciality* = {} ,
            supervisor  = {} ,
            supervisor* = {} ,
            practice-supervisor  = {} ,
            practice-supervisor* = {} ,
            student-id = {} ,
          }
      }
    \bool_if:NTF \l__ustc_degree_graduate_bool
      {
        \__ustc_title_page_graduate_zh:
        \__ustc_title_page_graduate_en:
      }
      { \__ustc_title_page_bachelor: }
    \cleardoublepage
    \restoregeometry
    \pagestyle { plain }
    \bool_set_false:N \l__ustc_title_page_bool
  }


% \subsection{原创性声明}

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
\DeclareDocumentCommand \__ustc_underline:nn { O { 8 em } m }
  { \underline { \hbox_to_wd:nn {#1} { \hss #2 \hss } } }

\cs_new:Npn \__ustc_checkbox:
  {
    \makebox [ \c_zero_dim ] [ l ]
      { \raisebox { - 0.2 ex } { \skip_horizontal:n { 0.1 em } $ \checkmark $ } }
    $\square$
  }

\NewDocumentCommand \copyrightpage { }
  {
    \bool_if:NTF \l__ustc_degree_graduate_bool
      {
        \begin { titlepage }
          \__ustc_pdf_bookmark:n { 原创性和授权使用声明 }
          \vspace* { 21 bp }
          \group_begin:
            \centering \sffamily \fontsize { 16 bp } { 32 bp } \selectfont
            中国科学技术大学学位论文原创性声明 \par
          \group_end:
          \skip_vertical:n { 13 bp }
          \__ustc_shrinkable_text:n { \tl_use:N \c__ustc_originality_tl \par }
          \skip_vertical:n { 37 bp }
          \noindent
          作者签名： \__ustc_underline:nn{} \hspace { 8 em }
          签字日期： \__ustc_underline:nn{} \par
          \skip_vertical:n { 69 bp }
          \group_begin:
            \centering \sffamily \fontsize { 16 bp } { 32 bp } \selectfont
            中国科学技术大学学位论文授权使用声明 \par
          \group_end:
          \skip_vertical:n { 13 bp }
          \__ustc_shrinkable_text:n { \tl_use:N \c__ustc_authorization_tl \par }
          \skip_vertical:n { 12 bp }
          \tl_if_empty:NTF \l__ustc_secret_level_tl
            {
              \__ustc_checkbox: \hbox:n { } 公开 \quad
              $\square$ \hbox:n { } 控阅（ \__ustc_underline:nn [ 2 em ] { } 年）
            }
            {
              $\square$ \hbox:n { } 公开 \quad
              \__ustc_checkbox: \hbox:n { } 控阅（
              \__ustc_underline:nn [ 2 em ] { \tl_use:N \l__ustc_secret_year_tl }
              年）
            }
          \par
          \skip_vertical:n { 29 bp }
          \noindent
          作者签名： \__ustc_underline:nn [ 7.5 em ] { } \skip_horizontal:n { 8.5 em }
          导师签名： \__ustc_underline:nn [ 7.5 em ] { } \par
          \skip_vertical:n { 12 bp }
          \noindent
          签字日期： \__ustc_underline:nn [ 7.5 em ] { } \skip_horizontal:n { 8.5 em }
          签字日期： \__ustc_underline:nn [ 7.5 em ] { } \par
          \bool_if:NT \l__ustc_reviewer_bool
            {
              \skip_vertical:n { 12 bp }
              \skip_horizontal:n { - 1 em }
              评审专家签名： \__ustc_underline:nn { } \skip_horizontal:n { 4.5 em }
              评审专家签名： \__ustc_underline:nn { } \par
            }
        \end { titlepage }
        \bool_set_true:N \l__ustc_title_page_bool
        \cleardoublepage
        \bool_set_false:N \l__ustc_title_page_bool
      }
  }

\cs_new:Npn \__ustc_shrinkable_text:n #1
  {
    \group_begin:
      \skip_set:Nn \l_tmpa_skip { 0 pt plus .1 pt minus .1 pt }
      \sys_if_engine_xetex:TF
        { \cs_set_protected:Npn \CJKglue { \skip_horizontal:N \l_tmpa_skip } }
        {
          \sys_if_engine_luatex:T
            { \ltjsetparameter { kanjiskip = \l_tmpa_skip } }
        }
      #1
    \group_end:
  }

% Deprecated since 2020-07-01.
\NewDocumentCommand \makestatement { }
  {
    \__ustc_deprecated:nnn { ' \token_to_str:N \makestatement '~ command }
      { 2020-07-01 } { ' \token_to_str:N \copyrightpage ' }
    \copyrightpage
  }


% \subsection{章节标题}

% 研究生一般不建议使用三级节标题，不得使用三级以下节标题。
% 本科生允许至四级节标题。
\bool_if:NTF \l__ustc_degree_graduate_bool
  { \setcounter { secnumdepth } { 4 } }
  { \setcounter { secnumdepth } { 3 } }

% 本科生章题为两字时中间空一字，四字时空半字。
\cs_new_protected:Npn \__ustc_spaced_title:n #1
  {
    % \tl_show:n {#1}
    % \int_set:Nn \l_tmpa_int { \exp_args:Ne \str_count:n {#1} }
    % \int_show:N \l_tmpa_int
    \group_begin:
      \if@mainmatter \else
        \int_case:nn { \exp_args:Ne \str_count:n {#1} }
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
        format      =
          { \centering \heiti \fontsize { 16 bp } { 20.8 bp } \selectfont } ,
        nameformat  = { } ,
        titleformat = { } ,
        number      = \thechapter ,
        aftername   = \quad ,
        beforeskip  = 7 bp ,
        afterskip   = 19 bp ,
        lofskip     = \c_zero_dim ,
        lotskip     = \c_zero_dim ,
        % fixskip     = true ,
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
      },
    %
    % 二级节标题，例如：“2.1.1  实验装置”。
    % 采用黑体13 pt字居左书写，固定行距20磅，段前12磅，段后6磅。
    subsection =
      {
        format     = \heiti \fontsize { 13 bp } { 20 bp } \selectfont ,
        aftername  = \quad,
        beforeskip = 12 bp,
        afterskip  = 6 bp,
      },
    %
    % 三级节标题，例如：“2.1.1.1  实验结果”。
    % 采用黑体小四号（12 pt）字居左书写，固定行距20磅，段前12磅，段后6磅。
    subsubsection =
      {
        format     = \heiti \fontsize { 12 bp } { 20 bp } \selectfont ,
        aftername  = \quad ,
        beforeskip = 12 bp ,
        afterskip  = 6 bp ,
      },
    %
    % 研究生要求不得使用三级以下节标题
  }

\str_if_eq:VnT \l__ustc_degree_str { bachelor }
  {
    \bool_if:NF \l__ustc_main_language_chinese_bool
      { \ustcsetup { section-style = arabic } }
  }
\tl_put_right:Nn \l__ustc_main_language_hook_tl
  {
    \str_if_eq:VnT \l__ustc_degree_str { bachelor }
      {
        \bool_if:NF \l__ustc_main_language_chinese_bool
          { \ustcsetup { section-style = arabic } }
      }
  }

% 在研究生格式的基础上再设置本科生的章节标题格式。
\str_if_eq:VnT \l__ustc_degree_str { bachelor }
  {
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
            format = \centering \sffamily \fontsize { 15 bp } { 27.5 bp } \selectfont ,
          } ,
        subsection =
          {
            format    = \sffamily \fontsize { 14 bp } { 25.67 bp } \selectfont ,
            indent    = \c_zero_dim ,
          },
        subsubsection =
          {
            format    = \rmfamily \fontsize { 12 bp } { 22 bp } \selectfont ,
            number    = \arabic { subsubsection } ,
            aftername = . \hspace { 0.5 em } ,
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
    \bool_if:NT \l__ustc_section_style_chinese_bool
      {
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
                aftername = { 、 } ,
              } ,
          }
      }
  }

% 默认的 \cs{chapter*} 生成的章标题没有编号、不更改页眉，
% 也不添加进目录或 PDF 书签。
% 然而像摘要、目录、符号说明这样的章节，它们不需要编号、不加入目录，
% 但是需要修改页眉，并且加入 PDF 标签。
% 所以我们新定义 \cs{__ustc_chapter:nn} 用于处理这些章节。%
\NewDocumentCommand \__ustc_chapter:nn { o m }
  {
    \if@openright
      \cleardoublepage
    \else
      \clearpage
    \fi
    \IfValueTF {#1}
      {
        \__ustc_pdf_bookmark:n {#1}
        \chaptermark {#1}
      }
      {
        \__ustc_pdf_bookmark:n {#2}
        \chaptermark {#2}
      }
    \chapter * {#2}
  }


% \subsection{创新性说明}

\NewDocumentEnvironment { innovations } { +b }
  {
    \str_if_eq:VnT \l__ustc_degree_str { doctor }
      {
        \str_if_eq:VnTF \l__ustc_degree_type_str { academic }
          { \__ustc_chapter:nn { 创新性说明 } }
          { \__ustc_chapter:nn { 创新性及应用性说明 } }
        #1 \par
      }
  }
  { }


% \subsection{摘要}

\NewDocumentEnvironment { abstract } { }
  {
    \ustcsetup { language = chinese }
    \__ustc_chapter:nn { 摘要 }
  }
  {
    \par \null \par
    \dim_set:Nn \hangindent { 4 em }
    \noindent
    \textbf { 关键词： }
    \clist_if_empty:NTF \l__ustc_keywords_clist
      { \tl_use:N \l__ustc_keywords_text_tl }
      { \clist_use:Nn \l__ustc_keywords_clist { ； } }
    \par
    \__ustc_reset_main_language:
  }

% 英文摘要环境
\NewDocumentEnvironment { abstract* } { }
  {
    \ustcsetup { language = english }
    \bool_if:NTF \l__ustc_degree_graduate_bool
      {
        \ctexset
          {
            chapter =
              {
                format =
                  {
                    \centering \bfseries
                    \fontsize { 16 bp } { 18.4 bp } \selectfont
                  } ,
                beforeskip = 9 bp ,
                afterskip  = 17 bp ,
              }
          }
        \__ustc_chapter:nn { ABSTRACT }
        \ctexset { autoindent = 2 em }
      }
      {
        \group_begin:
          % 本科生的英文摘要使用小二号衬线体
          \ctexset
            {
              chapter / format =
                { \centering \fontsize { 18 bp } { 33 bp } \selectfont }
            }
          \__ustc_chapter:nn { ABSTRACT }
        \group_end:
      }
  }
  {
    \par \null \par
    \dim_set:Nn \hangindent { 6.5 em }
    \noindent
    \bool_if:NTF \l__ustc_degree_graduate_bool
      { \textbf { KEY~ WORDS } : }
      { \textbf { Key~ Words: } }
    \space
    \clist_if_empty:NTF \l__ustc_keywords_en_clist
      { \tl_use:N \l__ustc_keywords_en_text_tl }
      {
        \bool_if:NTF \l__ustc_degree_graduate_bool
          { \clist_use:Nn \l__ustc_keywords_en_clist { ,~ } }
          { \clist_use:Nn \l__ustc_keywords_en_clist { ;~ } }
      }
    \par
    \__ustc_reset_main_language:
  }

% Deprecated since 2020-07-01.
\NewDocumentEnvironment { enabstract } { }
  {
    \__ustc_deprecated:nnn { 'enabsctract'~ environment } { 2020-07-01 }
      { 'abstract*' }
    \begin { abstract* }
  }
  {
    \end { abstract* }
  }


% \subsection{目录}

% 研究生规定目录另面起；
% 本科生规定从目录开始编页码，所以必须另页起。
\RenewDocumentCommand \tableofcontents { }
  {
    \str_if_eq:VnT \l__ustc_degree_str { bachelor }
      {
        \cleardoublepage
        \pagenumbering { arabic }
        \pagestyle { plain }
      }
    \__ustc_chapter:nn { \contentsname }
    \@starttoc { toc }
  }

% 下面用 \pkg{titletoc} 宏包设置目录内容的格式。
% 先定义目录线：
\cs_new:Npn \__ustc_leaders:
  {
    \skip_horizontal:n { 2 bp }
    \titlerule * [ 4 bp ] { . }
    \skip_horizontal:n { 2 bp }
  }

\contentsmargin { 0 bp }

% 目录中的章标题行采用黑体小四号字，固定行距 20 磅，段前 6 磅，段后 0 磅；
% 其他内容采用宋体小四号字，行距 20 磅，段前、段后均为 0 磅。
% 章标题行居左书写，一级节标题行缩进 1 个汉字符，二级节标题行缩进 2 个汉字符。
% 带有序号的各级标题，其序号与题名之间均空一字符，行末右顶格。
\bool_if:NTF \l__ustc_degree_graduate_bool
  {
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
  }
  {
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
          {
            \thecontentslabel
            \bool_if:NTF \l__ustc_section_style_chinese_bool
              { 、 }
              { \quad  }
          }
      } { }
      { \__ustc_leaders: \thecontentspage }
  }

% 本科生要求目录中正文每章前多空一行，而目录、附录等章则不需要空行，
% 所以不能简单判断 \cs{if@mainmatter}，需要重新定义 \cs{mainmatter} 等命令。
\bool_new:N \l__ustc_add_toc_space_bool
\str_if_eq:VnT \l__ustc_degree_str { bachelor }
  {
    \bool_set_true:N \l__ustc_add_toc_space_bool
    \tl_put_right:Nn \frontmatter { \bool_set_false:N \l__ustc_add_toc_space_bool }
    \tl_put_right:Nn \mainmatter { \bool_set_true:N \l__ustc_add_toc_space_bool }
    \tl_put_right:Nn \backmatter { \bool_set_false:N \l__ustc_add_toc_space_bool }
    \tl_put_right:Nn \appendix { \bool_set_false:N \l__ustc_add_toc_space_bool }
  }

% 处理本科生在目录中添加空行。
\RenewDocumentCommand \chapter { }
  {
    \if@openright
      \cleardoublepage
    \else
      \clearpage
    \fi
    \thispagestyle { \CTEX@chapter@pagestyle }%
    \int_gzero:N \@topnum
    \@afterindenttrue
    \str_if_eq:VnT \l__ustc_degree_str { bachelor }
      {
        \bool_if:NT \l__ustc_add_toc_space_bool
          { \addtocontents { toc } { \protect \addvspace { 12 bp } } }
      }
    \secdef \@chapter \@schapter
  }

% 插图和附表清单
\titlecontents { figure }
  [ 0 bp ] { }
  { \contentspush { \figurename \nobreakspace \thecontentslabel \quad } } { }
  { \__ustc_leaders: \thecontentspage }

\titlecontents { table }
  [ 0 bp ] { }
  { \contentspush { \tablename \nobreakspace \thecontentslabel \quad } } { }
  { \__ustc_leaders: \thecontentspage }

\RenewDocumentCommand \listoffigures { }
  {
    \__ustc_chapter:nn { \listfigurename }
    \@starttoc { lof }
  }

\RenewDocumentCommand \listoftables { }
  {
    \__ustc_chapter:nn { \listtablename }
    \@starttoc { lot }
  }

\NewDocumentCommand \listoffiguresandtables { }
  {
    \__ustc_chapter:nn { \l__ustc_list_figure_table_name_tl }
    \@starttoc { lof }
    \@starttoc { lot }
  }


% \subsection{符号说明}

% 研究生规定符号说明另页起，标题字体字号等同论文正文，
\NewDocumentEnvironment { notation } { }
  { \__ustc_chapter:nn { \l__ustc_notation_name_tl } }
  { }

\cs_new_nopar:Npn \notationlabel #1 { #1 \hfil }

\NewDocumentEnvironment { notationlist } { m }
  {
    \list { }
      {
        \dim_set:Nn \itemsep { 3 bp }
        \dim_set:Nn \labelwidth {#1}
        \dim_set:Nn \labelsep { 1 em }
        \dim_set_eq:Nn \leftmargin { \labelwidth + \labelsep + 3 em }
        \dim_set:Nn \rightmargin { 3 em }
        \cs_set_eq:NN \makelabel \notationlabel
      }
  }
  { \endlist }


% \subsection{正文}

% \cs{sloppy} 可以减少“overfull boxes”。
\sloppy

% 禁止扩大段间距。（\href{https://github.com/ustctug/ustcthesis/issues/209}{
%   ustctug/ustcthesis\#209}）
\raggedbottom

% 段间距 0 磅。
\skip_zero:N \parskip

% 首段缩进。
\ctexset { autoindent = 2 }

% 首段缩进。
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
\cs_set_nopar:Npn \thefootnote { \__ustc_circled:N \c@footnote }

\cs_new:Npn \__ustc_circled:N #1
  { \exp_args:Ne \symbol { \int_eval:n { #1 + "245F } } }

% LaTeX 默认脚注按章计数，即每章的开始才重置脚注计数器；我们修改为按页计数。
% 简单的|\@addtoreset{footnote}{page}|并不可靠，
% \footnote{\url{https://texfaq.org/FAQ-footnpp.html}}
% 所以我们使用 \pkg{footmisc} 宏包。

% 脚注线长为版心宽度的四分之一：
\cs_set_nopar:Npn \footnoterule
  {
    \kern - 3 \p@
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
\skip_set:Nn \partopsep { 0 bp }

\cs_new:Npn \__ustc_no_list_sep:
  {
    \skip_set:Nn \parsep  { 0 \p@ \@plus .2 \p@ }
    \skip_set:Nn \topsep  { 0 \p@ \@plus .2 \p@ }
    \skip_set:Nn \itemsep { 0 \p@ \@plus .2 \p@ }
  }
\cs_set_nopar:Npn \@listi
  {
    \dim_set_eq:NN \leftmargin \leftmargini
    \__ustc_no_list_sep:
  }
\cs_set_eq:NN \@listI \@listi
\@listi

\cs_set_nopar:Npn \@listii
  {
    \dim_set_eq:NN \leftmargin \leftmarginii
    \dim_set:Nn \labelwidth { \leftmarginii - \labelsep }
    \__ustc_no_list_sep:
  }

\cs_set_nopar:Npn \@listiii
  {
    \dim_set_eq:NN \leftmargin \leftmarginiii
    \dim_set:Nn \labelwidth { \leftmarginiii - \labelsep }
    \__ustc_no_list_sep:
  }


% \subsection{浮动体}

% 图题采用宋体，加粗，字号 11 pt，居中书写，单倍行距，段前6磅，段后0磅，
% 图序与图名之间空一个汉字符，

% 表题置于表的上方，采用宋体，加粗，字号11 pt，居中书写，单倍行距，段前6磅，段后0磅。
% 表序与表名之间空一个汉字符。

% 本科生：表格、插图标题用小四宋体，Word 模板中行距为 22 pt。

% 使用 \pkg{caption} 宏包设置图、表的格式：
\DeclareCaptionFont { ustc } { \__ustc_caption_font: }
\cs_new:Npn \__ustc_caption_font:
  {
    \bool_if:NTF \l__ustc_degree_graduate_bool
      {
        \bool_if:NTF \l__ustc_language_chinese_bool
          { \fontsize { 11 bp } { 14.3 bp } \selectfont }
          { \fontsize { 11 bp } { 12.65 bp } \selectfont }
      }
      { \fontsize { 12 bp } { 22 bp } \selectfont }
  }

\captionsetup
  {
    justification  = centerlast ,
    font           = ustc ,
    labelsep       = quad ,
    skip           = 6 bp ,
    figureposition = bottom ,
    tableposition  = top ,
  }
\bool_if:NT \l__ustc_degree_graduate_bool
  { \captionsetup { font += bf } }

% 若有英文图题，另起一行置于中文图题下方。
\__ustc_at_begin_package:nn { bicaption }
  { \str_set_eq:NN  \captionmainlanguage \l__ustc_main_language_str }

\__ustc_at_end_package:nn { bicaption }
  {
    \captionsetup [ bi-first ] { lang = chinese }
    \captionsetup [ bi-second ]
      {
        lang = english ,
        list = off ,
      }
    \cs_set_nopar:Npn \selectcaptionlanguage #1#2
      { \ustcsetup { language = #2 } }
  }

% 表单元格中的文字采用 11 pt 宋体字，单倍行距，段前3磅，段后3磅。
% 对于中文，`\arraystretch` 需要设为 1 + (3 pt + 3 pt) / (11 pt * 1.3) ~= 1.42。
% 对于英文，`\arraystretch` 需要设为 1 + (3 pt + 3 pt) / (11 pt * 1.15) ~= 1.47。
%
% 本科生：表格内容用小四宋体或五号宋体选定某种样式后，全文应统一。
% Word 示例中为 1.5 倍行距，段前段后 0 磅。
% `\arraystretch` 需要设为 1。
\cs_new:Npn \__ustc_table_font:
  {
    \bool_if:NTF \l__ustc_degree_graduate_bool
      {
        \bool_if:NTF \l__ustc_language_chinese_bool
          {
            \fontsize { 11 bp } { 14.3 bp } \selectfont
            \cs_set_nopar:Npn \arraystretch { 1.42 }
          }
          {
            \fontsize { 11 bp } { 12.65 bp } \selectfont
            \cs_set_nopar:Npn \arraystretch { 1.47 }
          }
      }
      {
        \bool_if:NTF \l__ustc_language_chinese_bool
          {
            \fontsize { 10.5 bp } { 20.475 bp } \selectfont
            \cs_set_nopar:Npn \arraystretch { 1 }
          }
          {
            \fontsize { 10.5 bp } { 18.1125 bp } \selectfont
            \cs_set_nopar:Npn \arraystretch { 1 }
          }
      }
  }

% 设置表格的默认字号
\cs_set_nopar:Npn \@floatboxreset
  {
    \reset@font
    % \normalsize
    \__ustc_table_font:
    \@setminipage
  }

\msg_new:nnn { ustcthesis } { patch-failure }
  { Failed~ to~ patch~ ' \token_to_str:N #1 '.  }

% 对 \pkg{longtable} 跨页表格进行相同的设置。
\__ustc_at_end_package:nn { longtable }
  {
    \AtBeginEnvironment { longtable }
      {
        \dim_compare:nNnTF { \f@size pt } > { 11 bp }
          { \__ustc_table_font: }
      }
  }

% 图注、表注使用 `\figurenote` 或 `\tablenote` 命令，与 `apa7.cls` 一致。
% 图注采用宋体 11 pt，单倍行距，段前6磅，段后0磅。
% 多个图注则须顺序编号，注序左缩进2字，与注文之间空一字符，续行悬挂缩进左对齐，两端对齐。
\cs_set_eq:NN \__ustc_figure_note_font: \__ustc_caption_font:

\cs_set:Npn \figurenote #1
  {
    \group_begin:
      \captionsetup
        {
          font = ustc ,
          margin = { 2 em , 0 pt } ,
          oneside ,
        }
      \caption * {#1}
    \group_end:
  }
\cs_set_eq:NN \tablenote \figurenote

% 兼容旧版的 `\note` 命令。
\NewDocumentCommand \note { m }
  {
    \__ustc_deprecated:nnn { ' \token_to_str:N \note '~ command }
      { 2025-01-05 }
      { ' \token_to_str:N \figurenote '~ or~ ' \token_to_str:N \tablenote ' }
    \figurenote {#1}
  }

% 设置 \pkg{threeparttable} 表注的默认字号。
\__ustc_at_end_package:nn { threeparttable }
  {
    \AtBeginEnvironment { tablenotes }
      { \__ustc_figure_note_font: }
  }

% 不宜将多个插图连续排版，插图与文字论述段落应穿插排版。

% 修改默认的浮动体描述符为 |h|。
\cs_set_nopar:Npn \fps@figure { h }
\cs_set_nopar:Npn \fps@table { h }

% \LaTeX{} 对放置浮动体的要求比较强，这里按照 UK TeX FAQ 的建议
% \footnote{\url{https://texfaq.org/FAQ-floats}} 对其适当放宽。
\cs_set:Npn \topfraction { .85 }
\cs_set:Npn \bottomfraction { .7 }
\cs_set:Npn \textfraction { .15 }
\cs_set:Npn \floatpagefraction { .66 }
\cs_set:Npn \dbltopfraction { .66 }
\cs_set:Npn \dblfloatpagefraction { .66 }
\setcounter { topnumber } { 9 }
\setcounter { bottomnumber } { 9 }
\setcounter { totalnumber } { 20 }
\setcounter { dbltopnumber } { 9 }

% 插图前后与文字段落之间须留有10磅空行。
% 插图如果不得不与其它插图或表格连续排版，则它们之间须留有20磅空行。
\skip_set:Nn \floatsep { 20 bp }
\skip_set:Nn \textfloatsep { 10 bp }
\skip_set:Nn \intextsep { 10 bp }

% 由于 LaTeX2e kernel 的问题，图表等浮动体与文字前后的距离不一致，需要进行 patch。
% 参考 \href{https://github.com/tuna/thuthesis/issues/614}{tuna/thuthesis/issues\#614}、
% \url{https://www.zhihu.com/question/46618031} 和
% \url{https://tex.stackexchange.com/a/40363/82731}。
%    \begin{macrocode}
\ctex_patch_cmd:Nnn \@addtocurcol
  { \vskip \intextsep }
  {
    \edef \save@first@penalty { \the \lastpenalty } \unpenalty
    \ifnum \lastpenalty = \@M  % hopefully the OR penalty
      \unpenalty
    \else
      \penalty \save@first@penalty \relax % put it back
    \fi
    \ifnum \outputpenalty < - \@Mii
      \addvspace \intextsep
      \vskip \parskip
    \else
      \addvspace \intextsep
    \fi
  }

\ctex_patch_cmd:Nnn \@addtocurcol
  { \vskip \intextsep \ifnum \outputpenalty < - \@Mii \vskip - \parskip \fi }
  {
    \ifnum \outputpenalty < - \@Mii
      \aftergroup \vskip \aftergroup \intextsep
      \aftergroup \nointerlineskip
    \else
      \vskip \intextsep
    \fi
  }

\ctex_patch_cmd:Nnn \@getpen { \@M } { \@Mi }


% \subsection{表达式}

% 重定义 `\eqref`，使`式~\eqref` 这样的写法不产生额外的空格。
% \DeclareRobustCommand{\eqref}[1]{\textup{\tagform@{\ref{#1}}}}
\DeclareRobustCommand \eqref [ 1 ]
  {
    \bool_if:NT \l__ustc_language_chinese_bool
      {
        \bool_if:NT \l__ustc_eqn_paren_style_full_bool
          { \unskip }
      }
    \textup { \tagform@ { \ref {#1 } } }
    \bool_if:NT \l__ustc_language_chinese_bool
      {
        \bool_if:NT \l__ustc_eqn_paren_style_full_bool
          { \ignorespaces }
      }
  }

% 修改 `amsmath` 的 `\tagform@`
% \def\tagform@#1{\maketag@@@{(\ignorespaces#1\unskip\@@italiccorr)}}
\cs_set_nopar:Npn \tagform@ #1
  {
    \bool_if:NTF \l__ustc_language_chinese_bool
      {
        \bool_if:NTF \l__ustc_eqn_paren_style_full_bool
          {
            % 防止中文左括号与前面文字的距离过窄
            \maketag@@@
              {
                \kern 0 pt \relax
                （ \ignorespaces #1 \unskip \@@italiccorr ）
              }
          }
          { \maketag@@@ { ( \ignorespaces #1 \unskip \@@italiccorr ) } }
      }
      { \maketag@@@ { ( \ignorespaces #1 \unskip \@@italiccorr ) } }
  }

% \subsection{参考文献}

\PassOptionsToPackage { compress } { natbib }

\__ustc_at_end_package:nn { natbib }
  {
    % 定义几种引用文献的标注样式。
    \cs_new:Npn \bibstyle@super
      { \bibpunct { [ } { ] } { , } { s } { , } { \textsuperscript { , } } }
    \cs_new:Npn \bibstyle@inline
      { \bibpunct { [ } { ] } { , } { n } { , } { , } }
    \cs_new:Npn \bibstyle@authoryear
      { \bibpunct { ( } { ) } { ; } { a } { , } { , } }
    \cs_set_eq:cN { bibstyle@author-year } \bibstyle@authoryear
    %
    % 几种引用样式，与 \file{bst} 文件名保持一致，
    % 这样在使用 \cs{bibliographystyle} 选择参考文献表的样式时也会设置对应的引用样式。
    \cs_set_eq:cN { bibstyle@ustcthesis-numerical } \bibstyle@super
    \cs_set_eq:cN { bibstyle@ustcthesis-authoryear } \bibstyle@authoryear
    \cs_set_eq:cN { bibstyle@ustcthesis-bachelor } \bibstyle@super
    %
    % 如果载入 `natbib` 前设置了 `cite-style`，这里先进行配置。
    % https://github.com/ustctug/ustcthesis/issues/327
    \str_if_empty:NF \l__ustc_cite_style_str
      { \citestyle { \l__ustc_cite_style_str } }
    %
    % 定义接口 cite-style 切换引用样式。
    \tl_put_right:Nn \l__ustc_cite_style_hook_tl
      { \citestyle { \l__ustc_cite_style_str } }
    %
    % 如果文献序号作为叙述文字的一部分，需要临时将文献序号与正文平排
    \DeclareRobustCommand \citep
      {
        \begingroup
        \NAT@superfalse
        \NAT@swatrue
        \let \NAT@ctype \z@
        \NAT@partrue
        \@ifstar
          { \NAT@fulltrue \NAT@citetp }
          { \NAT@fullfalse \NAT@citetp }
      }
    %
    % 参考文献列表格式：宋体 10.5 磅，行距 20 磅，续行缩进两字，左对齐。
    % 本科生依然是小四宋体。
    \cs_set:Npn \bibfont
      {
        \bool_if:NTF \l__ustc_degree_graduate_bool
          { \fontsize { 10.5 bp } { 20 bp } \selectfont }
          { \normalsize }
      }
    \skip_set:Nn \bibsep { 0 \p@ \@plus .2 \p@ }
    % 参考文献表的编号居左。
    \cs_set_nopar:Npn \@biblabel #1 { [ #1 ] \hfill }
    % 顺序编码制悬挂缩进 2.5 字符
    \cs_set:Npn \NAT@bibsetnum #1
      {
        % \settowidth\labelwidth{\@biblabel{#1}}%
        % \setlength{\leftmargin}{\labelwidth}%
        % \addtolength{\leftmargin}{\labelsep}%
        \dim_set:Nn \leftmargin { 2.5 em }
        \dim_zero:N \itemindent
        \dim_zero:N \labelsep
        \dim_set:Nn \labelwidth { 2.5 em }
        \skip_set_eq:NN \itemsep \bibsep
        \skip_zero:N \parsep
        \ifNAT@openbib
          \dim_add:Nn \leftmargin { \bibindent }
          \dim_set:Nn \itemindent { - \bibindent }
          \dim_set_eq:NN \listparindent \itemindent
          \skip_zero:N \parsep
        \fi
      }
    % 著者-出版年制悬挂缩进 2 字。注意这个宽度是加载时设置的，不能使用 em。
    \skip_set:Nn \bibhang { 21 bp }
    %
    % 修改引用的样式。
    % 这里在 filehook 中无法使用 \cs{patchcmd}，所以只能手动重定义。
    %
    % 将 super 式 \cs{citep} 引用的页码置于括号外。
    \cs_set:Npn \NAT@citesuper #1#2#3
      {
        \ifNAT@swa
          \if * #2 * \else
            #2 \NAT@spacechar
          \fi
          % \unskip\kern\p@\textsuperscript{\NAT@@open#1\NAT@@close}%
          %  \if*#3*\else\NAT@spacechar#3\fi\else #1\fi\endgroup}
          \unskip \kern \p@
          \textsuperscript
            {
              \NAT@@open #1 \NAT@@close
              \if * #3 * \else #3 \fi
            }
          % TODO: remove this
          \kern \p@
        \else
          #1
        \fi
        \endgroup
      }
    %
    % 将 numbers 式 \cs{citep} 引用的页码置于括号外并改为上标。
    \cs_set:Npn \NAT@citenum #1#2#3
      {
        \ifNAT@swa
          \NAT@@open
          \if * #2 * \else
            #2 \NAT@spacechar
          \fi
          % #1\if*#3*\else\NAT@cmt#3\fi\NAT@@close
          #1 \NAT@@close
          \if * #3 * \else
            \textsuperscript {#3}
          \fi
        \else
          #1
        \fi
        \endgroup
      }
    %
    % 将 author-year 式 \cs{citep} 引用的页码置于括号外并改为上标：
    \cs_set:Npn \NAT@cite #1#2#3
      {
        \ifNAT@swa
          \NAT@@open
          \if * #2 * \else #2 \NAT@spacechar \fi
          % #1\if*#3*\else\NAT@cmt#3\fi\NAT@@close\else#1\fi\endgroup}
          #1 \NAT@@close
          \if * #3 * \else \textsuperscript{#3} \fi
        \else
          #1
        \fi
        \endgroup
      }
    %
    % 为了将参考文献加入目录和 pdf 书签，重新定义 \pkg{natbib} 的 \cmd{bibsection}
    % 另外如果调用了 \pkg{chapterbib} 或者使用了 \opt{sectionbib} 参数，
    % 需要使用节标题 \cs{section}。
    \cs_new:Npn \__ustc_bib_chapter:
      {
        \@mainmatterfalse
        \chapter { \bibname }
      }
    \cs_new:Npn \__ustc_bib_section:
      {
        \group_begin:
          \ctexset { section / numbering = false }
          \section { \bibname }
        \group_end:
      }
    % TODO: make it into file hook
    \msg_new:nnn { ustcthesis } { chapterbib-sectionbib-conflict }
      {
        The~ 'sectionbib'~ option~ of~ 'chapterbib'~ will~ not~ work~
        when~ natbib~ is~ also~ loaded.
      }
    \@ifpackagewith { chapterbib } { sectionbib }
      { \msg_error:nn { ustcthesis } { chapterbib-sectionbib-conflict }  }
      { }
    \@ifpackageloaded { chapterbib }
      { \cs_set_eq:NN \bibsection \__ustc_bib_section: }
      {
        \@ifxundefined \NAT@sectionbib
          { \cs_set_eq:NN \bibsection \__ustc_bib_chapter: }
          { \cs_set_eq:NN \bibsection \__ustc_bib_section: }
      }
  }

\ExplSyntaxOff
% 在 filehook 中无法使用 \cs{patchcmd}，所以只能手动重定义。
% `\NAT@citexnum` 的定义中有 `:` 字符，在 LaTeX3 中会被错误地处理为命令的一部分，
% 所以这里关闭 LaTeX3 语法。
\@nameuse{__ustc_at_end_package:nn}{natbib}{
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
  % 将 author-year 式 \cs{citet} 引用的页码置于括号外并改为上标。
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
        % 将 author-year 式 \cs{citet} 引用的页码置于括号外并改为上标。
        %
        % \if*#2*\else\NAT@cmt#2\fi
        \if\relax\NAT@date\relax\else\NAT@@close\fi
        \if*#2*\else\textsuperscript{#2}\fi
      \fi}{#1}{#2}}
}
\ExplSyntaxOn


% biblatex 宏包的配置

\__ustc_at_end_package:nn { biblatex }
  {
    \cs_if_exist:NF \inlinecite
      { \newrobustcmd * { \inlinecite } { \parencite } }
    \defbibheading { bibliography } [ \bibname ]
      {
        \@mainmatterfalse
        \chapter { \bibname }
      }
    \cs_set_nopar:Npn \bibfont
      {
        \bool_if:NTF \l__ustc_degree_graduate_bool
          { \fontsize { 10.5 bp } { 20 bp } \selectfont }
          { \normalsize }
      }
    \skip_set:Nn \bibitemsep { 0 \p@ \@plus .2 \p@ }
    \skip_set:Nn \bibhang { 21 bp }
  }


% \subsection{附录}

% 定义了一个满足要求的致谢环境：
\NewDocumentEnvironment { acknowledgements } { +b }
  {
    \@mainmatterfalse
    \chapter { \l__ustc_acknowledgements_name_tl }
    \bool_if:NF \l__ustc_review_bool
      {
        #1
        \str_if_eq:VnT \l__ustc_degree_str { bachelor}
          {
            \par
            \null \par
            \group_begin:
              \raggedleft
              \seq_item:Nn \l__ustc_date_seq { 1 } ~年~
              \seq_item:Nn \l__ustc_date_seq { 2 } ~月
              \par
            \group_end:
          }
      }
  }
  { }

% 兼容旧版本中“acknowledgments”的拼法。
% Deprecated since 2020-07-01.
\NewDocumentEnvironment { acknowledgments } { +b }
  {
    \__ustc_deprecated:nnn { 'acknowledgments'~ environment } { 2020-07-01 }
      { 'acknowledgements' }
    \begin { acknowledgements }
      #1
    \end { acknowledgements }
  }
  { }


% 科研成果环境：
\NewDocumentEnvironment { achievements } { +b }
  {
    \bool_if:NT \l__ustc_degree_graduate_bool
      {
        \@mainmatterfalse
        \chapter { \l__ustc_achievements_name_tl }
        \bool_if:NF \l__ustc_review_bool
          {
            \fontsize { 12 bp }{ 16 bp } \selectfont
            #1 \par
          }
      }
  }
  { }

% 兼容旧的接口
\NewDocumentEnvironment { publications } { +b }
  {
    \__ustc_deprecated:nnn { 'publications'~ environment } { 2024-12-15 }
      { 'achievements' }
    \begin { achievements }
      #1
    \end { achievements }
  }
  { }

\bool_new:N \g__ustc_first_achievement_list_bool
\bool_gset_true:N \g__ustc_first_achievement_list_bool

\NewDocumentEnvironment { theachievements } { O { 已发表论文 } }
  {
    \bool_if:NTF \g__ustc_first_achievement_list_bool
      { \skip_vertical:n { 1 bp } }
      { \skip_vertical:n { 19 bp } }
    \bool_gset_false:N \g__ustc_first_achievement_list_bool
    \noindent \textbf { #1 ： } \par
    \begin { achievementlist }
  }
  { \end { achievementlist } }

\newlist { achievementlist } { enumerate } { 1 }
\setlist [ achievementlist ]
  {
    topsep     = 3 bp ,
    partopsep  = 0 bp ,
    itemsep    = 0 bp ,
    parsep     = 3 bp ,
    leftmargin = 21 bp ,
    itemindent = 0 bp ,
    labelsep   = 0 bp ,
    labelwidth = 21 bp ,
    align      = left ,
    label      = [ \arabic* ] ,
  }



% \subsection{其他宏包的设置}

% 这些宏包并非格式要求，但是为了方便同学们使用，在这里进行简单设置。


% \subsubsection{\pkg{hyperref} 宏包}

\__ustc_at_end_package:nn { hyperref }
  {
    \hypersetup
      {
        bookmarksnumbered  = true ,
        bookmarksopen      = true ,
        bookmarksopenlevel = 1 ,
        linktoc            = all ,
        unicode            = true ,
        psdextra           = true ,
      }
    %
    % 如果为 \opt{pdf} 样式，设置 hyperlink 颜色
    \bool_if:NTF \l__ustc_output_electronic_bool
      { \hypersetup { colorlinks = true } }
      { \hypersetup { hidelinks } }
    %
    % 填写 PDF 元信息。
    \hook_gput_code:nnn { begindocument } { . }
      {
        \bool_if:NTF \l__ustc_language_chinese_bool
          {
            \hypersetup
              {
                pdftitle  = \l__ustc_title_tl ,
                pdfauthor = \l__ustc_author_tl ,
              }
          }
          {
            \hypersetup
              {
                pdftitle  = \l__ustc_title_en_tl ,
                pdfauthor = \l__ustc_author_en_tl ,
              }
          }
      }
    %
    % 添加 PDF 书签
    %
    \int_new:N \g__ustc_bookmark_int
    \cs_set:Npn \__ustc_pdf_bookmark:n #1
      {
        \phantomsection
        \int_gincr:N \g__ustc_bookmark_int
        \pdfbookmark [ 0 ] { #1 }
          { ustcchapter. \int_use:N \g__ustc_bookmark_int }
      }
    %
    % 在 PDF 字符串中去掉换行，以减少 \pkg{hyperref} 的警告信息。
    \pdfstringdefDisableCommands{
      \cs_set_eq:NN \\ \@empty
      \cs_set_eq:NN \hspace \@gobble
    }
    %
    % 设置中文的 \cs{autoref}。
    % \footnote{\url{https://tex.stackexchange.com/a/66150/82731}}
    \cs_new:Npn \__ustc_set_hyperref_autoref_names:
      {
        \bool_if:NTF \l__ustc_language_chinese_bool
          {
            \bool_if:NTF \l__ustc_eqn_paren_style_full_bool
              { \cs_set_nopar:Npn \equationautorefname ~ ##1 \null { 公式（ ##1 ）\null } }
              { \cs_set_nopar:Npn \equationautorefname ~ ##1 \null { 公式 ~ ( ##1 ) \null } }
            \cs_set_nopar:Npn \footnoteautorefname { 脚注 }
            \cs_set_nopar:Npn \itemautorefname ~ ##1 \null { 第 ~ ##1 ~ 项 \null }
            \cs_set_nopar:Npn \figureautorefname { 图 }
            \cs_set_nopar:Npn \tableautorefname { 表 }
            \cs_set_nopar:Npn \partautorefname ~ ##1 \null { 第 ~ ##1 ~ 部分 \null }
            \cs_set_nopar:Npn \appendixautorefname { 附录 }
            \cs_set_nopar:Npn \chapterautorefname ~ ##1 \null { 第 ~ ##1 ~ 章 \null }
            \cs_set_nopar:Npn \sectionautorefname ~ ##1 \null { 第 ~ ##1 ~ 节 \null }
            \cs_set_nopar:Npn \subsectionautorefname ~ ##1 \null { 第 ~ ##1 ~ 小节 \null }
            \cs_set_nopar:Npn \subsubsectionautorefname ~ ##1 \null { 第 ~ ##1 ~ 小小节 \null }
            \cs_set_nopar:Npn \paragraphautorefname ~ ##1 \null { 第 ~ ##1 ~ 段 \null }
            \cs_set_nopar:Npn \subparagraphautorefname ~ ##1 \null { 第 ~ ##1 ~ 小段 \null }
            \cs_set_nopar:Npn \FancyVerbLineautorefname ~ ##1 \null { 第 ~ ##1 ~ 行 \null }
            \cs_set_nopar:Npn \theoremautorefname { 定理 }
            \cs_set_nopar:Npn \HyRef@autopageref ##1
              { \hyperref [ {##1} ] { 第 ~ \pageref * { ##1 } ~ 页 } }
          }
          {
            \cs_set_nopar:Npn \equationautorefname { Equation }
            \cs_set_nopar:Npn \footnoteautorefname { footnote }
            \cs_set_nopar:Npn \itemautorefname { item }
            \cs_set_nopar:Npn \figureautorefname { Figure }
            \cs_set_nopar:Npn \tableautorefname { Table }
            \cs_set_nopar:Npn \partautorefname { Part }
            \cs_set_nopar:Npn \appendixautorefname { Appendix }
            \cs_set_nopar:Npn \chapterautorefname { chapter }
            \cs_set_nopar:Npn \sectionautorefname { section }
            \cs_set_nopar:Npn \subsectionautorefname { subsection }
            \cs_set_nopar:Npn \subsubsectionautorefname { subsubsection }
            \cs_set_nopar:Npn \paragraphautorefname { paragraph }
            \cs_set_nopar:Npn \subparagraphautorefname { subparagraph }
            \cs_set_nopar:Npn \FancyVerbLineautorefname { line }
            \cs_set_nopar:Npn \theoremautorefname { Theorem }
            % \cs_set_nopar:Npn \pageautorefname { page }
            \cs_set_nopar:Npn \HyRef@autopageref ##1
              { \hyperref [ { ##1 } ] { \HyRef@autopagerefname \pageref * {##1} } }
          }
      }
    \__ustc_set_hyperref_autoref_names:
    \tl_put_right:Nn \l__ustc_language_hook_tl
      { \__ustc_set_hyperref_autoref_names: }
    %
    % 本科生需要在 \tableofcontents 处切换 \pagenumbering，
    % 在使用了 notoccite 后会导致 PDF 书签的页码有误（#293），
    % 所以需要补充 <https://tex.stackexchange.com/a/593839/82731> 的 patch。
    % LuaTeX 不需要这个 patch。
    \sys_if_engine_xetex:T
      {
        \cs_set_nopar:Npn \HyPL@StorePageLabel #1
          {
            \group_begin:
              % \exp_args:NNe: Make compatible with TeX Live 2022
              \exp_args:NNe \cs_set_nopar:Npn \Hy@tempa { \the \Hy@abspage << #1 >> }
              \immediate \write \@mainaux
                { \token_to_str:N \HyPL@Entry { \Hy@tempa } }
            \group_end:
          }
      }
  }


% \subsubsection{\pkg{amsthm} 宏包}

\__ustc_at_end_package:nn { amsthm }
  {
    \newtheoremstyle { ustc }
      { } { }
      { } { 2 em }
      { \bfseries } { }
      { 1 em }{ }
    \theoremstyle { ustc }
    % 定义新的定理
    \tl_new:N \l__ustc_assertion_name_tl
    \tl_new:N \l__ustc_assumption_name_tl
    \tl_new:N \l__ustc_axiom_name_tl
    \tl_new:N \l__ustc_corollary_name_tl
    \tl_new:N \l__ustc_definition_name_tl
    \tl_new:N \l__ustc_example_name_tl
    \tl_new:N \l__ustc_lemma_name_tl
    \tl_new:N \l__ustc_proof_name_tl
    \tl_new:N \l__ustc_proposition_name_tl
    \tl_new:N \l__ustc_remark_name_tl
    \tl_new:N \l__ustc_theorem_name_tl
    \bool_if:NTF \l__ustc_language_chinese_bool
      {
        \tl_set:Nn \l__ustc_assertion_name_tl { 断言 }
        \tl_set:Nn \l__ustc_assumption_name_tl { 假设 }
        \tl_set:Nn \l__ustc_axiom_name_tl { 公理 }
        \tl_set:Nn \l__ustc_corollary_name_tl { 推论 }
        \tl_set:Nn \l__ustc_definition_name_tl { 定义 }
        \tl_set:Nn \l__ustc_example_name_tl { 例 }
        \tl_set:Nn \l__ustc_lemma_name_tl { 引理 }
        \tl_set:Nn \l__ustc_proof_name_tl { 证明 }
        \tl_set:Nn \l__ustc_proposition_name_tl { 命题 }
        \tl_set:Nn \l__ustc_remark_name_tl { 注 }
        \tl_set:Nn \l__ustc_theorem_name_tl { 定理 }
      }
      {
        \tl_set:Nn \l__ustc_assertion_name_tl { Assertion }
        \tl_set:Nn \l__ustc_assumption_name_tl { Assumption }
        \tl_set:Nn \l__ustc_axiom_name_tl { Axiom }
        \tl_set:Nn \l__ustc_corollary_name_tl { Corollary }
        \tl_set:Nn \l__ustc_definition_name_tl { Definition }
        \tl_set:Nn \l__ustc_example_name_tl { Example }
        \tl_set:Nn \l__ustc_lemma_name_tl { Lemma }
        \tl_set:Nn \l__ustc_proof_name_tl { Proof }
        \tl_set:Nn \l__ustc_proposition_name_tl { Proposition }
        \tl_set:Nn \l__ustc_remark_name_tl { Remark }
        \tl_set:Nn \l__ustc_theorem_name_tl { Theorem }
      }
    \newtheorem { theorem }                 { \l__ustc_theorem_name_tl }     [ chapter ]
    \newtheorem { assertion }   [ theorem ] { \l__ustc_assertion_name_tl }
    \newtheorem { axiom }       [ theorem ] { \l__ustc_axiom_name_tl }
    \newtheorem { corollary }   [ theorem ] { \l__ustc_corollary_name_tl }
    \newtheorem { lemma }       [ theorem ] { \l__ustc_lemma_name_tl }
    \newtheorem { proposition } [ theorem ] { \l__ustc_proposition_name_tl }
    \newtheorem { assumption }              { \l__ustc_assumption_name_tl }  [ chapter ]
    \newtheorem { definition }              { \l__ustc_definition_name_tl }  [ chapter ]
    \newtheorem { example}                  { \l__ustc_example_name_tl }     [ chapter ]
    \newtheorem* { remark }                 { \l__ustc_remark_name_tl }
    % \pkg{amsthm} 单独定义了 proof 环境，这里重新定义以满足格式要求。
    % 原本模仿 \pkg{amsthm} 写成 |\item[\hskip\labelsep\hskip2em #1\hskip1em]|，
    % 但是却会多出一些间隙。
    \RenewDocumentEnvironment { proof } { O { \l__ustc_proof_name_tl } }
      {
        \par
        \pushQED { \qed }
        \normalfont \topsep 6 \p@ \@plus 6 \p@ \relax
        \trivlist
          \item \relax \skip_horizontal:n { 2 em }
          \textbf { #1 }
          \skip_horizontal:n { 1 em } \ignorespaces
      }
      { \popQED \endtrivlist \@endpefalse }
    \cs_set:Npn \qedsymbol { \__ustc_qed: }
  }


% \subsubsection{\pkg{algorithm2e} 宏包}

% 按章节编号。
\PassOptionsToPackage { algochapter } { algorithm2e }

\__ustc_at_end_package:nn { algorithm2e }
  {
    % TODO: move to language hook
    \bool_if:NTF \l__ustc_language_chinese_bool
      { \SetAlgorithmName { 算法 } { 算法 } { 算法清单 } }
      { \SetAlgorithmName { Algorithm } { Algorithm } { List~ of~ Algorithms } }
    %
    % 设置算法环境的格式。
    \SetAlCapSkip { 6 bp }
    \SetAlCapFnt { \small }
    \SetAlCapNameFnt { \small }
    \bool_if:NT \l__ustc_degree_graduate_bool
      { \SetAlCapNameSty { textbf } }
    \SetAlgoCaptionSeparator { \unskip \hspace * { 1 em } }
    %
    % 设置算法清单的格式
    \cs_set:Npn \listofalgocfs
      {
        \bool_if:NT \l__ustc_degree_graduate_bool
          { \cleardoublepage }
        \__ustc_chapter:nn { \listalgorithmcfname }
        \@starttoc { loa }
      }
    \titlecontents { algocf }
      [ 2.3 em ] { \normalsize }
      { \contentslabel { 2.3 em } } { }
      { \__ustc_leaders: \contentspage }
    \contentsuse { algocf } { loa }
  }


% \subsubsection{\pkg{mathtools} 宏包}

% \pkg{mathtools} 会修改 \pkg{unicode-math} 的 `\underbrace` 和 `\overbrace`，
% 需要还原为 `\LaTeXunderbrace` 和 `\LaTeXoverbrace`，
% 参考 \url{https://tex.stackexchange.com/q/521394/82731}。
%
% \pkg{mathtools} 的 `showonlyrefs` 选项修改了 `\eqref`，
% 需要重新处理括号与前后文字的空白。
% 见 <https://github.com/tuna/thuthesis/issues/1043>。
\__ustc_at_end_package:nn { mathtools }
  {
    \@ifpackageloaded { unicode-math}
      {
        \cs_set_eq:NN \underbrace \LaTeXunderbrace
        \cs_set_eq:NN \overbrace \LaTeXoverbrace
      }
      { }
    \cs_set:Npn \MT_extended_eqref:n #1
      {
        \bool_if:NT \l__ustc_language_chinese_bool
          {
            \bool_if:NT \l__ustc_eqn_paren_style_full_bool
              { \unskip }
          }
        \protected@write \@auxout { } { \string \MT@newlabel { #1 } }
        \textup { \let \df@label \@empty \MT_prev_tagform:n { \ref {#1} } }
        \bool_if:NT \l__ustc_language_chinese_bool
          {
            \bool_if:NT \l__ustc_eqn_paren_style_full_bool
              { \ignorespaces }
          }
      }
    \EQ_MakeRobust \MT_extended_eqref:n
  }


% \subsubsection{\pkg{nomencl} 宏包}

\PassOptionsToPackage { notocbasic } { nomencl }

\__ustc_at_end_package:nn { nomencl }
  {
    \tl_set_eq:NN \nomname \l__ustc_notation_name_tl
    \cs_set:Npn \thenomenclature
      {
        \__ustc_chapter:nn { \l__ustc_notation_name_tl }
        \nompreamble
        \list { }
          {
            \dim_set_eq:NN \labelwidth \nom@tempdim
            \dim_set:Nn \leftmargin { \labelwidth + \labelsep }
            \dim_set_eq:NN \itemsep \nomitemsep
            \cs_set_eq:NN \makelabel \nomlabel
          }
      }
    \cs_set:Npn \endthenomenclature
      {
        \endlist
        \nompostamble
      }
  }


% \subsubsection{\pkg{siunitx} 宏包}

\__ustc_at_end_package:nn { siunitx }
  {
    \cs_new:Npn \__ustc_set_siunitx_language:
      {
        \bool_if:NTF \l__ustc_language_chinese_bool
          {
            \sisetup
              {
                list-final-separator = { ~和 \nobreakspace } ,
                  % TODO: change to latest version
                  % {
                  %   \TextOrMath { \space } { \  }
                  %   \text { 和 }
                  %   \TextOrMath { \space } { \  }
                  % } ,
                list-pair-separator = { ~和~ } ,
                  % {
                  %   \TextOrMath { \space } { \  }
                  %   \text { 和 }
                  %   \TextOrMath { \space } { \  }
                  % } ,
                range-phrase = { ～ } ,
                  % { \text { ～ } } ,
              }
          }
          {
            \sisetup
              {
                list-final-separator = { ,~ and~ } ,
                  % {
                  %   \TextOrMath { \space } { \  }
                  %   \text { \GetTranslation { and } }
                  %   \TextOrMath { \space } { \ }
                  % } ,
                list-pair-separator = { ~ and~ } ,
                  % {
                  %   \TextOrMath { \space } { \  }
                  %   \text { \GetTranslation { and } }
                  %   \TextOrMath { \space } { \  }
                  % } ,
                range-phrase               = { ~to~ } ,
                  % {
                  %   \TextOrMath { \space } { \  }
                  %   \text { to }
                  %   \TextOrMath { \space } { \  }
                  % } ,
              }
          }
      }
    \__ustc_set_siunitx_language:
    \tl_put_right:Nn \l__ustc_language_hook_tl { \__ustc_set_siunitx_language: }
  }


% \subsubsection{\pkg{chapterbib} 宏包}

\__ustc_at_end_package:nn { chapterbib }
  {
    \@ifpackageloaded { natbib }
      {
        \@ifpackagewith { chapterbib } { sectionbib }
          { \msg_error:nn { ustcthesis } { chapterbib-sectionbib-conflict }  }
          { }
        \cs_set:Npn \bibsection
          {
            \group_begin:
              \ctexset { section / numbering = false }
              \section { \bibname }
            \group_end:
          }
      }{}
  }
