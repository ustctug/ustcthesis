%%
%% This is file `variants/ustcthesis-numeric.bst',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% gbt7714-bst.dtx  (with options: `2025,ustc,numeric')
%% -------------------------------------------------------------------
%% GB/T 7714 BibTeX Style
%% https://github.com/zepinglee/gbt7714-bibtex-style
%% Version: 2026-06-14 v2.3.1
%% -------------------------------------------------------------------
%% Copyright (C) 2016-2026 by Zeping Lee <zepinglee AT gmail DOT com>
%% -------------------------------------------------------------------
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3c
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%    https://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 2008 or later.
%% -------------------------------------------------------------------
INTEGERS {
  control.convert.punct
  control.max.bib.names
  control.min.bib.names
  control.max.cite.names
  control.min.cite.names
  control.uppercase.family
  control.initialize.with.hyphen
  control.check.pinyin
  control.initialize.pinyin
  control.cite.final.and
  control.bib.final.and
  control.space.before.et.al
  control.year.before.title
  control.sentence.case.title
  control.sentence.case.journal
  control.sentence.case.booktitle
  control.link.title
  control.article.title
  control.patent.country
  control.entry.type.id
  control.space.before.type.id
  control.entry.medium.id
  control.slash
  control.in
  control.emph.booktitle
  control.emph.journal
  control.short.journal
  control.journal.dots
  control.link.journal
  control.bold.volume
  control.unknown.publisher
  control.space.before.pages
  control.page.ranges
  control.urldate
  control.url
  control.doi
  control.cstr
  control.eprint
  control.note
  control.end.dot
  control.capitalize.subtitle
  control.warn.empty.field
}

STRINGS {
  control.bib.punct
  control.cite.lang
  control.name.year.delim
  control.page.range.delim
}

FUNCTION {load.config}
{
  "half" 'control.bib.punct :=  % GB / half / bylanguage
  #1 'control.convert.punct :=
  #3 'control.max.bib.names :=
  #3 'control.min.bib.names :=
  #1 'control.max.cite.names :=
  #1 'control.min.cite.names :=
  #0 'control.bib.final.and :=
  #1 'control.cite.final.and :=
  #1 'control.space.before.et.al :=
  #0 'control.uppercase.family :=
  #1 'control.initialize.with.hyphen :=
  #1 'control.check.pinyin :=
  #0 'control.initialize.pinyin :=
  "byentry" 'control.cite.lang :=  % byentry / chinese / english / macro
  #0 'control.year.before.title :=
  "period" 'control.name.year.delim :=  % comma / period
  #1 'control.sentence.case.title :=
  #1 'control.sentence.case.booktitle :=
  #0 'control.sentence.case.journal :=
  #0 'control.capitalize.subtitle :=
  #0 'control.link.title :=
  #1 'control.article.title :=
  #0 'control.patent.country :=
  #1 'control.entry.type.id :=
  #0 'control.space.before.type.id :=
  #1 'control.entry.medium.id :=
  #1 'control.slash :=
  #0 'control.in :=
  #0 'control.emph.booktitle :=
  #0 'control.emph.journal :=
  #0 'control.short.journal :=
  #0 'control.journal.dots :=
  #0 'control.link.journal :=
  #0 'control.bold.volume :=
  #0 'control.unknown.publisher :=
  #1 'control.space.before.pages :=
  #1 'control.page.ranges :=
  "-" 'control.page.range.delim :=
  #1 'control.urldate :=
  #0 'control.url :=
  #0 'control.doi :=
  #1 'control.cstr :=
  #0 'control.eprint :=
  #0 'control.note :=
  #1 'control.end.dot :=
  #1 'control.warn.empty.field :=
}

ENTRY
  { address
    archiveprefix
    author
    bookauthor
    booksubtitle
    booktitle
    booktitleaddon
    country  % 专利国别
    cstr
    date
    dimensions
    doi
    edition
    editor
    eid
    entrymediumid
    entrysubtype
    entrytypeid
    eventtitle
    eprint
    eprinttype
    holder
    howpublished
    institution
    journal
    journalsubtitle
    journaltitle
    journaltitleaddon
    key
    langid
    language
    location
    mainsubtitle
    maintitle
    maintitleaddon
    mark
    medium
    nationality  % 专利国别，兼容 IEEEtran.bst
    note
    number
    organization
    pages
    publisher
    scale
    school
    series
    shortjournal
    subtitle
    title
    titleaddon
    translator
    url
    urldate
    version
    volume
    year
    CTL_bib_punct
    CTL_convert_punct
    CTL_max_bib_names
    CTL_min_bib_names
    CTL_max_cite_names
    CTL_min_cite_names
    CTL_uppercase_family
    CTL_initialize_with_hyphen
    CTL_check_pinyin
    CTL_initialize_pinyin
    CTL_bib_final_and
    CTL_cite_final_and
    CTL_cite_lang
    CTL_space_before_et_al
    CTL_year_before_title
    CTL_name_year_delim
    CTL_sentence_case
    CTL_sentence_case_title
    CTL_sentence_case_booktitle
    CTL_sentence_case_journal
    CTL_capitalize_subtitle
    CTL_link_title
    CTL_article_title
    CTL_patent_country
    CTL_entry_type_id
    CTL_space_before_type_id
    CTL_entry_medium_id
    CTL_slash
    CTL_in
    CTL_emph_booktitle
    CTL_emph_journal
    CTL_short_journal
    CTL_journal_dots
    CTL_link_journal
    CTL_bold_volume
    CTL_unknown_publisher
    CTL_space_before_pages
    CTL_page_ranges
    CTL_page_range_delim
    CTL_urldate
    CTL_url
    CTL_doi
    CTL_eprint
    CTL_note
    CTL_end_dot
    CTL_warn_empty_field
  }
  { entry.lang is.lang.cjk entry.numbered require.url }
  { label extra.label sort.label short.list entry.type.id entry.eprint entry.url }

INTEGERS { output.state before.all mid.sentence after.sentence after.block after.punct }

INTEGERS { lang.zh lang.ja lang.ko lang.en lang.ru lang.other }

INTEGERS { charptr len }

STRINGS { pinyin.table1 pinyin.table2 pinyin.table3 }

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
  #4 'after.punct :=
  #3 'lang.zh :=
  #4 'lang.ja :=
  #5 'lang.ko :=
  #1 'lang.en :=
  #2 'lang.ru :=
  #0 'lang.other :=
  " a ai an ang ao "
  "ba bai ban bang bao bei ben beng bi bian biao bie bin bing bo bu " *
  "ca cai can cang cao ce cen ceng cha chai chan chang chao che chen cheng chi chong chou chu chuai chuan chuang chui chun chuo ci cong cou cu cuan cui cun cuo " *
  "da dai dan dang dao de dei deng di dia dian diao die ding diu dong dou du duan dui dun duo " *
  "e ei en eng er " *
  "fa fan fang fei fen feng fo fou fu " *
  "ga gai gan gang gao ge gei gen geng gong gou gu gua guai guan guang gui gun guo " *
  "ha hai han hang hao he hei hen heng hong hou hu hua huai huan huang hui hun huo " *
  "ji jia jian jiang jiao jie jin jing jiong jiu ju juan jue jun " *
  'pinyin.table1 :=
  "ka kai kan kang kao ke ken keng kong kou ku kua kuai kuan kuang kui kun kuo "
  "la lai lan lang lao le lei leng li lia lian liang liao lie lin ling liu long lou lu luan lun luo lü lüe lyu lyue " *
  "ma mai man mang mao me mei men meng mi mian miao mie min ming miu mo mou mu " *
  "na nai nan nang nao ne nei nen neng ni nian niang niao nie nin ning niu nong nu nuan nuo nü nüe nyu nyue " *
  "o ou " *
  "pa pai pan pang pao pei pen peng pi pian piao pie pin ping po pou pu " *
  "qi qia qian qiang qiao qie qin qing qiong qiu qu quan que qun " *
  "ran rang rao re ren reng ri rong rou ru ruan rui run ruo " *
  'pinyin.table2 :=
  "sa sai san sang sao se sen seng sha shai shan shang shao she shei shen sheng shi shou shu shua shuai shuan shuang shui shun shuo si song sou su suan sui sun suo "
  "ta tai tan tang tao te teng ti tian tiao tie ting tong tou tu tuan tui tun tuo " *
  "wa wai wan wang wei wen weng wo wu " *
  "xi xia xian xiang xiao xie xin xing xiong xiu xu xuan xue xun " *
  "ya yan yang yao ye yi yin ying yong you yu yuan yue yun " *
  "za zai zan zang zao ze zei zen zeng zha zhai zhan zhang zhao zhe zhei zhen zheng zhi zhong zhou zhu zhua zhuai zhuan zhuang zhui zhun zhuo zi zong zou zu zuan zui zun zuo " *
  'pinyin.table3 :=
}

FUNCTION {bbl.anonymous}
{ entry.lang lang.zh =
    { "佚名" }
    { "Anon" }
  if$
}

FUNCTION {bbl.no.date}
{ entry.lang lang.zh =
    { "无日期" }
    { "n.d." }
  if$
}

FUNCTION {space.precedes.et.al}
{ is.lang.cjk
    { control.space.before.et.al
        { "\ " }
        { "" }
      if$
    }
    { " " }
  if$
}

FUNCTION {bbl.and}
{ entry.lang lang.zh =
    { "和" }
    { entry.lang lang.ja =
        { "と" }
        { entry.lang lang.ru =
            { "и" }
            { "and" }
          if$
        }
      if$
    }
  if$
}

FUNCTION {bbl.et.al}
{ entry.lang lang.zh =
    { "等" }
    { entry.lang lang.ja =
        { "ほか" }
        { entry.lang lang.ru =
            { "и~др." }
            { "et~al." }
          if$
        }
      if$
    }
  if$
}

FUNCTION {cite.and}
{ control.cite.lang "byentry" =
    'bbl.and
    { control.cite.lang "macro" =
        { "{\biband}" }
        { control.cite.lang "chinese" =
            { "和" }
            { "and" }
          if$
        }
      if$
    }
  if$
}

FUNCTION {cite.et.al}
{ control.cite.lang "byentry" =
    { bbl.et.al }
    { control.cite.lang "macro" =
        { "{\bibetal}" }
        { control.cite.lang "chinese" =
            { "等" }
            { "et~al." }
          if$
        }
      if$
    }
  if$
}

FUNCTION {bbl.in}
{ entry.lang lang.zh =
    { "见" }
    { "In" }
  if$
}

FUNCTION {bbl.translator}
{ entry.lang lang.zh =
    { "译" }
    { "trans." }
  if$
}

FUNCTION {bbl.wide.space} { "\quad " }

FUNCTION {bbl.edition}
{ entry.lang lang.zh =
    { "版" }
    { entry.lang lang.ja =
        { "版" }
        { entry.lang lang.ru =
            { "изд." }
            { "ed." }
          if$
        }
      if$
    }
  if$
}

FUNCTION {bbl.double.slash} { "//\allowbreak" }

FUNCTION {bbl.sine.loco}
{ entry.lang lang.zh =
    { "出版地不详" }
    { "S.l." }
  if$
}

FUNCTION {bbl.sine.nomine}
{ entry.lang lang.zh =
    { "出版者不详" }
    { "s.n." }
  if$
}

FUNCTION {bbl.sine.loco.sine.nomine}
{ entry.lang lang.zh =
    { "出版地不详: 出版者不详" }
    { "S.l.: s.n." }
  if$
}

FUNCTION {default.self.tokens} { ":,-'–—?.!" }

FUNCTION {latin.upper} { "ÀÁÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝÞŸĀĂĄĆĈĊČĎĐĒĔĖĘĚĜĞĠĢĤĦĨĪĬĮİIĴĶĹĻĽĿŁŃŅŇŊŌŎŐŒŔŖŘŚŜŞŠŢŤŦŨŪŬŮŰŲŴŶŸŹŻŽ" }

FUNCTION {latin.lower} { "àáãäåæçèéêëìíîïðñòóôõöøùúûüýþÿāăąćĉċčďđēĕėęěĝğġģĥħĩīĭįiıĵķĺļľŀłńņňŋōŏőœŕŗřśŝşšţťŧũūŭůűųŵŷÿźżž" }

FUNCTION {range.delimiters} { "-–—～" }

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

FUNCTION {string.length}
{ #0 swap$
    { duplicate$ "" = not }
    { swap$ #1 + swap$
      #2 global.max$ substring$
    }
  while$
  pop$
}

STRINGS { x y }

STRINGS { replace find text }

FUNCTION {contains}
{ 'find :=
  'text :=
  find string.length 'len :=
  text string.length len - #1 + 'charptr :=
    { charptr #0 >
      text charptr len substring$ find = not
      and
    }
    { charptr #1 - 'charptr := }
  while$
  charptr #0 >
}

STRINGS { s t }

FUNCTION {add.period}
{ "bylanguage" control.bib.punct =
    { is.lang.cjk
        { "．" * }
        'add.period$
      if$
    }
    'add.period$
  if$
}

FUNCTION {after.period.space}
{ is.lang.cjk
  "bylanguage" control.bib.punct = and
    { "" }
    { " " }
  if$
}

FUNCTION {add.comma}
{ "bylanguage" control.bib.punct =
  is.lang.cjk and
  "GB" control.bib.punct = or
    { "，" * }
    { ", " * }
  if$
}

FUNCTION {add.colon}
{ "bylanguage" control.bib.punct =
  is.lang.cjk and
  "GB" control.bib.punct = or
    { "：" * }
    { ": " * }
  if$
}

FUNCTION {add.colon.by.language}
{ is.lang.cjk
    { "：" * }
    { ": " * }
  if$
}

FUNCTION {bbl.pages.colon}
{ "bylanguage" control.bib.punct =
  is.lang.cjk and
  "GB" control.bib.punct = or
    { "：" }
    { control.space.before.pages
        { ": " }
        { ":\allowbreak " }
      if$
    }
  if$
}

FUNCTION {make.parentheses}
{ "bylanguage" control.bib.punct =
  is.lang.cjk and
  "GB" control.bib.punct = or
    { "（" swap$ * "）" * }
    { "(" swap$ * ")" * }
  if$
}

FUNCTION {make.brackets}
{ "[" swap$ * "]" *
}

INTEGERS { find_length }
FUNCTION { find.replace }
{ 'replace :=
  'find :=
  'text :=
  find string.length 'find_length :=
  ""
    { text empty$ not }
    { text #1 find_length substring$ find =
        { replace *
          text #1 find_length + global.max$ substring$ 'text :=
        }
        { text #1 #1 substring$ *
          text #2 global.max$ substring$ 'text :=
        }
      if$
    }
  while$
}

FUNCTION {convert.fullwidth.punctuations}
{ ", " "，" find.replace
  ": " "：" find.replace
  "; " "；" find.replace
  "! " "！" find.replace
  "!" "！" find.replace
  "? " "？" find.replace
  "?" "？" find.replace
  " (" "（" find.replace
  "(" "（" find.replace
  ") " "）" find.replace
  ")" "）" find.replace
}

FUNCTION {convert.halfwidth.punctuations}
{ "．" ". " find.replace
  "，" ", " find.replace
  "：" ": " find.replace
  "；" "; " find.replace
  "！" "! " find.replace
  "？" "? " find.replace
  "（" " (" find.replace
  "）." ")." find.replace
  "）," ")," find.replace
  "）:" "):" find.replace
  "）;" ");" find.replace
  "）}" ")}" find.replace
  "）" ") " find.replace
  % Strip leading and trailing spaces
  duplicate$ #1 #1 substring$ " " =
    { #2 global.max$ substring$ }
    'skip$
  if$
  duplicate$ #-1 #1 substring$ " " =
    { duplicate$ string.length #1 - #1 swap$ substring$ }
    'skip$
  if$
}

FUNCTION {convert.punctuations}
{ "GB" control.bib.punct =
    { "．" ". " find.replace
      convert.fullwidth.punctuations
    }
    { "half" control.bib.punct =
        { convert.halfwidth.punctuations }
        { "bylanguage" control.bib.punct =
            { is.lang.cjk
                { ". " "．" find.replace
                  convert.fullwidth.punctuations
                }
                { convert.halfwidth.punctuations }
              if$
            }
            'skip$
          if$
        }
      if$
    }
  if$
}

FUNCTION {format.punctuations}
{ control.convert.punct
    'convert.punctuations
    'skip$
  if$
  is.lang.cjk
    { "---" "—" find.replace
      "--" "—" find.replace
    }
    { "“" "``" find.replace
      "”" "''" find.replace
      "‘" "`" find.replace
      "’" "'" find.replace
      "—" "---" find.replace
      "–" "--" find.replace
    }
  if$
}

STRINGS { output.punct }

FUNCTION {set.punct}
{ output.state mid.sentence =
  output.state after.punct = or
    { 'output.punct :=
      after.punct 'output.state :=
    }
    'pop$
  if$
}

FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
    { add.comma write$ }
    { output.state after.block =
        { add.period write$
          newline$
          "\newblock " write$
        }
        { output.state before.all =
            'write$
            { output.state after.punct =
                { output.punct * write$ }
                { add.period after.period.space * write$ }
              if$
            }
          if$
        }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}

FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$
      control.warn.empty.field
        { "empty " t * " in " * cite$ * warning$ }
        'skip$
      if$
    }
    'output.nonnull
  if$
}

FUNCTION {fin.entry}
{ control.end.dot
    'add.period
    'skip$
  if$
  write$
  newline$
}

FUNCTION {new.block}
{ output.state before.all =
        'skip$
        { after.block 'output.state := }
  if$
}

FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
            'skip$
            { after.sentence 'output.state := }
      if$
    }
  if$
}

FUNCTION {new.slash}
{ output.state before.all =
    'skip$
    { control.slash
        { bbl.double.slash * write$
          newline$
          ""
          before.all 'output.state :=
        }
        { new.block }
      if$
    }
  if$
}

FUNCTION {new.block.checka}
{ empty$
    'skip$
    'new.block
  if$
}

FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}

FUNCTION {new.sentence.checka}
{ empty$
    'skip$
    'new.sentence
  if$
}

FUNCTION {new.sentence.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.sentence
  if$
}

INTEGERS { a b }

FUNCTION {is.int.in.range}
{ 'b :=
  #1 +
  b >
    { #1 - b < }
    { pop$ #0 }
  if$
}

FUNCTION {mult.power2}
{ { duplicate$ #0 > }
    { swap$
      duplicate$ +
      swap$ #1 -
    }
  while$
  pop$
}

FUNCTION {find.match.brace}
{ 's :=
  't :=
  #1
  { duplicate$ #0 >
    s empty$ not and }
    { s #1 #1 substring$ "{" =
        { #1 + }
        { s #1 #1 substring$ "}" =
            { #1 - }
            'skip$
          if$
        }
      if$
      t s #1 #1 substring$ * 't :=
      s #2 global.max$ substring$ 's :=
    }
  while$

  duplicate$ #0 >
    { "Unbalanced brace(s): one or more closing braces are missing" warning$
      { duplicate$ #0 > }
        { t "}" * 't :=
          #1 -
        }
      while$
    }
    'skip$
  if$
  pop$

  t
  s
}

FUNCTION {split.first.char.from.str}
{ duplicate$ "" =
    { "split.first.char.from.str: Trying to split an empty string!" warning$
      ""
    }
    { duplicate$ #1 #1 substring$ chr.to.int$ #128 <
        { duplicate$ #1 #1 substring$ swap$
          #2 global.max$ substring$ swap$
        }
        { duplicate$ #1 #1 substring$ chr.to.int$ #224 <
            { duplicate$ #1 #2 substring$ swap$
              #3 global.max$ substring$ swap$
            }
            { duplicate$ #1 #1 substring$ chr.to.int$ #240 <
                { duplicate$ #1 #3 substring$ swap$
                  #4 global.max$ substring$ swap$
                }
                { duplicate$ #1 #4 substring$ swap$
                  #5 global.max$ substring$ swap$
                }
              if$
            }
          if$
        }
      if$
    }
  if$
}

FUNCTION {get.first.char.from.str}
{ split.first.char.from.str swap$ pop$ }

FUNCTION {split.first.tex.char.from.str}
{ duplicate$ #1 #1 substring$ "{" =
    { split.first.char.from.str swap$
      find.match.brace swap$
    }
    'split.first.char.from.str
  if$
}

FUNCTION {char.to.unicode}
{ duplicate$ #4 #1 substring$ "" =
    { duplicate$ #3 #1 substring$ "" =
        { duplicate$ #2 #1 substring$ "" =
            { duplicate$ "" =
                { "Empty string is not a char!" warning$
                  pop$ #-1
                }
                { #1 #1 substring$ chr.to.int$ }
              if$
            }
            { duplicate$ #2 #1 substring$ chr.to.int$ #128 - swap$
              #1 #1 substring$ chr.to.int$ #192 -
              #6 mult.power2 +
            }
          if$
        }
        { duplicate$ #3 #1 substring$ chr.to.int$ #128 - swap$
          duplicate$ #2 #1 substring$ chr.to.int$ #128 - swap$
          #1 #1 substring$ chr.to.int$ #224 -
          #6 mult.power2 +
          #6 mult.power2 +
        }
      if$
    }
    { duplicate$ #4 #1 substring$ chr.to.int$ #128 - swap$
      duplicate$ #3 #1 substring$ chr.to.int$ #128 - swap$
      duplicate$ #2 #1 substring$ chr.to.int$ #128 - swap$
      #1 #1 substring$ chr.to.int$ #240 -
      #6 mult.power2 +
      #6 mult.power2 +
      #6 mult.power2 +
    }
  if$
}

FUNCTION {is.char.in.str}
{ 't :=
  t "" =
    { "is.char.in.str: Empty string is not a char!" warning$ }
    'skip$
  if$

  #0 swap$
  { duplicate$ "" = not }
    { split.first.char.from.str t =
        { pop$ pop$ #1 "" }
        'skip$
      if$
    }
  while$
  pop$
}

FUNCTION {is.upper.ascii}
{ char.to.unicode #65 swap$ #90 swap$ is.int.in.range }

FUNCTION {is.upper}
{ duplicate$ is.upper.ascii
    { pop$ #1 }
    { latin.upper swap$ is.char.in.str }
  if$
}

FUNCTION {is.lower.ascii}
{ char.to.unicode #97 swap$ #122 swap$ is.int.in.range }

FUNCTION {is.lower}
{ duplicate$ is.lower.ascii
    { pop$ #1 }
    { latin.lower swap$ is.char.in.str }
  if$
}

FUNCTION {is.printable.ascii}
{ char.to.unicode #32 swap$ #126 swap$ is.int.in.range }

FUNCTION {is.letter.ascii}
{ duplicate$ is.upper.ascii swap$ is.lower.ascii or }

FUNCTION {is.symbol.ascii}
{ duplicate$ is.printable.ascii swap$ is.letter.ascii not and }

FUNCTION {is.all.lower}
{ #1 swap$
  { duplicate$ "" = not }
    { split.first.char.from.str is.lower
        'skip$
        { pop$ pop$ #0 "" }
      if$
    }
  while$
  pop$
}

FUNCTION {is.tex.str.in.title.case}
{ duplicate$ "" =
    { pop$ #0 }
    { split.first.tex.char.from.str purify$
      duplicate$ "" =
        { pop$ pop$ #0 }
        { split.first.char.from.str is.upper
            { duplicate$ "" =  % single-letter word
                { pop$ pop$ #1 }
                { duplicate$ is.all.lower
                    { empty$
                        { duplicate$ "" =
                            { pop$ #0 }
                            'is.all.lower
                          if$
                        }
                        'is.all.lower
                      if$
                    }
                    { pop$ pop$ #0 }
                  if$
                }
              if$
            }
            { pop$ pop$ #0}
          if$
        }
      if$
    }
  if$
}

FUNCTION {is.in.inter.token.chars}
{ duplicate$ #0 =
    { pop$ " " = }
    { #1 =
        { " " range.delimiters * swap$ is.char.in.str }
        'is.letter.ascii
      if$
    }
  if$
}

FUNCTION {skip.inter.token.chars.by}
{ 'b :=
  't :=

  "" t
  { duplicate$ "" = not }
    { split.first.char.from.str
      duplicate$ b is.in.inter.token.chars
        { swap$ 't := * t }
        { swap$ * 't := "" }
      if$
    }
  while$

  pop$ t
}

FUNCTION {skip.inter.token.chars}
{ #0 skip.inter.token.chars.by }

FUNCTION {skip.inter.token.command}
{ duplicate$ "" =
    { "" }
    { duplicate$ #1 #1 substring$ is.symbol.ascii
        { split.first.char.from.str swap$ }
        { #2 skip.inter.token.chars.by }
     if$
    }
  if$
}

FUNCTION {is.special.char.command}
{ #2 global.max$ substring$ skip.inter.token.command
  empty$
    'skip$
    { "is.special.char.command: cmdstr has extra components!" warning$ }
  if$

  duplicate$ duplicate$ duplicate$ duplicate$ duplicate$ duplicate$
  "oOlLij" swap$ is.char.in.str
  swap$ "oe" = or
  swap$ "OE" = or
  swap$ "ae" = or
  swap$ "AE" = or
  swap$ "aa" = or
  swap$ "AA" = or
}

FUNCTION {map.char}
{ 't :=
  split.first.char.from.str
  { swap$ duplicate$ "" = not }
    { swap$ t =
        { pop$ "" t }
        { swap$ split.first.char.from.str pop$ swap$
          split.first.char.from.str
        }
      if$
    }
  while$
  pop$ t =
    'get.first.char.from.str
    { pop$ t }
  if$
}

FUNCTION {to.lower}
{ duplicate$ is.upper.ascii
    { chr.to.int$ #32 + int.to.chr$ }
    { latin.lower swap$ latin.upper swap$ map.char }
  if$
}

FUNCTION {to.upper}
{ duplicate$ is.lower.ascii
    { chr.to.int$ #32 - int.to.chr$ }
    { latin.upper swap$ latin.lower swap$ map.char }
  if$
}

FUNCTION {all.to.lower}
{ "" swap$
  { duplicate$ empty$ not }
    { split.first.char.from.str to.lower swap$ 't := * t }
  while$
  *
}

FUNCTION {command.to.lower}
{ duplicate$ "" =
    { "command.to.lower: Empty string is not a texchar!" warning$ }
    { duplicate$ #1 #1 substring$ #92 int.to.chr$ =
        { duplicate$ is.special.char.command
            'all.to.lower
            'skip$
          if$
        }
        'to.lower
      if$
    }
  if$
}

FUNCTION {tex.to.lower}
{ duplicate$ #1 #2 substring$ "{" #92 int.to.chr$ * =
    { "" swap$
      { duplicate$ "" = not }
        { split.first.char.from.str
          duplicate$ #92 int.to.chr$ =
            { swap$ skip.inter.token.command 't := * t
              swap$ command.to.lower
            }
            'to.lower
          if$
          swap$ 't := * t
        }
      while$
      pop$
    }
    { duplicate$ #1 #1 substring$ "{" =
        { split.first.char.from.str swap$ find.match.brace pop$ }
        'command.to.lower
      if$
    }
  if$
}

FUNCTION {all.to.upper}
{ "" swap$
  { duplicate$ empty$ not }
    { split.first.char.from.str to.upper swap$ 't := * t }
  while$
  *
}

FUNCTION {command.to.upper}
{ duplicate$ "" =
    { "command.to.lower: Empty string is not a texchar!" warning$ }
    { duplicate$ #1 #1 substring$ #92 int.to.chr$ =
        { duplicate$ is.special.char.command
             'all.to.upper
             'skip$
           if$
        }
        'to.upper
      if$
    }
  if$
}

FUNCTION {tex.to.upper}
{ duplicate$ #1 #2 substring$ "{" #92 int.to.chr$ * =
    { "" swap$
      { duplicate$ "" = not }
      { split.first.char.from.str
        duplicate$ #92 int.to.chr$ =
          { swap$ skip.inter.token.command 't := * t
            swap$ command.to.upper
          }
          'to.upper
        if$
        swap$ 't := * t
      }
      while$
      pop$
    }
    { duplicate$ #1 #1 substring$ "{" =
        { split.first.char.from.str swap$ find.match.brace pop$ }
        'command.to.upper
      if$
    }
  if$
}

FUNCTION {lower.token.if.in.title.case}
{ duplicate$ is.tex.str.in.title.case
    { split.first.tex.char.from.str tex.to.lower swap$ * }
    'skip$
  if$
}

FUNCTION {self.tokens}
{ #0 =
    'default.self.tokens
    'range.delimiters
  if$
}

FUNCTION {tokenize.by}
{ 'b :=
  's :=

  s "" =
    { "" "" }
    { s split.first.char.from.str
      duplicate$ b self.tokens swap$ is.char.in.str
        'swap$
        { duplicate$ #92 int.to.chr$ =
            { swap$ skip.inter.token.command 's := * s }
            { pop$ pop$ "" s
              { duplicate$ "" = not }
                { split.first.char.from.str
                  duplicate$ "\ " b self.tokens * swap$ is.char.in.str
                    { pop$ pop$ "" }
                    { duplicate$ "{" =
                        { swap$ find.match.brace }
                        'swap$
                      if$
                      's := * s
                    }
                  if$
                }
              while$
              pop$ s
            }
          if$
        }
      if$
    }
  if$
}

FUNCTION {tokenize}
{ #0 tokenize.by }

FUNCTION {smart.sentence.case}
{ tokenize 's :=

  { s "" = not }
    { s skip.inter.token.chars 's := * s
      tokenize swap$
      duplicate$ ":" =
        { swap$ 's := *
          s skip.inter.token.chars 's := * s
          tokenize swap$
          control.capitalize.subtitle
            'skip$
            { lower.token.if.in.title.case }
          if$
        }
        'lower.token.if.in.title.case
      if$
      swap$ 's := *
    }
  while$
}

FUNCTION {smart.upper.case}
{ s swap$ t swap$

  "" swap$
  { duplicate$ "" = not }
    { tokenize swap$
      duplicate$ #1 #1 substring$ #92 int.to.chr$ =
        'command.to.upper
        { "" swap$
          { duplicate$ "" = not }
            { split.first.tex.char.from.str tex.to.upper
              swap$ 't := * t
            }
          while$
          pop$
        }
      if$
      swap$ 't := * t
      skip.inter.token.chars 't := * t
    }
  while$
  pop$

  swap$ 't :=
  swap$ 's :=
}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { "\emph{" swap$ * "}" * }
  if$
}

FUNCTION {emphasize.book.title}
{ control.emph.booktitle
  is.lang.cjk not and
    'emphasize
    'skip$
  if$
}

INTEGERS { codepoint tmp.lang }

FUNCTION {get.codepoint.lang}
{ 'codepoint :=
  codepoint #128 <
    { codepoint #64 > codepoint #91 < and codepoint #96 > codepoint #123 < and or
        { lang.en }
        { lang.other }
      if$
    }
    { codepoint #1023 > codepoint #1328 < and
        { lang.ru }
        { codepoint #19967 > codepoint #40960 < and
            { lang.zh }
            { codepoint #13311 > codepoint #19904 < and
                { lang.zh }
                { codepoint #12351 > codepoint #12544 < and
                    { lang.ja }
                    { codepoint #44031 > codepoint #55216 < and
                        { lang.ko }
                        { lang.other }
                      if$
                    }
                  if$
                }
              if$
            }
          if$
        }
      if$
    }
  if$
}

FUNCTION {get.str.lang}
{ lang.other 'tmp.lang :=
    { duplicate$ empty$ not }
    { split.first.char.from.str
      char.to.unicode
      get.codepoint.lang
      duplicate$ tmp.lang >
        { 'tmp.lang := }
        'pop$
      if$
    }
  while$
  duplicate$ empty$
    { pop$ }
    { "non-empty string " quote$ swap$ * quote$ " left" warning$ }
  if$
  tmp.lang
}

FUNCTION {check.entry.lang}
{ title field.or.null
  duplicate$ empty$
    { author field.or.null * }
    'skip$
  if$
  duplicate$ empty$
    { journal field.or.null * }
    'skip$
  if$
  duplicate$ empty$
    { journaltitle field.or.null * }
    'skip$
  if$
  duplicate$ empty$
    { booktitle field.or.null * }
    'skip$
  if$
  duplicate$ empty$
    { address field.or.null * }
    'skip$
  if$
  duplicate$ empty$
    { location field.or.null * }
    'skip$
  if$
  duplicate$ empty$
    { publisher field.or.null * }
    'skip$
  if$
  get.str.lang
}

FUNCTION {set.entry.lang}
{ langid empty$
    { language empty$
        { "" }
        { language }
      if$
    }
    { langid }
  if$
  "l" change.case$
  's :=
  s empty$
    { check.entry.lang }
    { s "english" = s "american" = or s "british" = or
        { lang.en }
        { s "chinese" =
            { lang.zh }
            { s "japanese" =
                { lang.ja }
                { s "korean" =
                    { lang.ko }
                    { s "russian" =
                        { lang.ru }
                        { lang.other }
                      if$
                    }
                  if$
                }
              if$
            }
          if$
        }
      if$
    }
  if$
  'entry.lang :=
  #0 'is.lang.cjk :=
  entry.lang lang.zh =
  entry.lang lang.ja = or
  entry.lang lang.ko = or
    { #1 'is.lang.cjk := }
    'skip$
  if$
}

FUNCTION {set.entry.numbered}
{ type$ "archive" =
  type$ "letter" = or
  type$ "legislation" = or
  type$ "patent" = or
  type$ "regulation" = or
  type$ "report" = or
  type$ "techreport" = or
    { #1 'entry.numbered := }
    { #0 'entry.numbered := }
  if$
}

INTEGERS { nameptr namesleft numnames name.lang }

FUNCTION {is.lowercase.word}
{ #1
    { #0 > }
    { duplicate$ #1 #1 substring$ chr.to.int$
      duplicate$ #96 >
      swap$      #123 <
      and
        { #2 global.max$ substring$
          duplicate$ empty$
            { #0 }
            { #1 }
          if$
        }
        { #0 }
      if$
    }
  while$
  empty$
}

FUNCTION {is.single.pinyin}
{ " " swap$ * " " *
  duplicate$
  pinyin.table1 swap$ contains
    { pop$ #1 }
    { duplicate$
      pinyin.table2 swap$ contains
        { pop$ #1 }
        { pinyin.table3 swap$ contains }
      if$
    }
  if$
}

FUNCTION {is.single.pinyin.word}
{ duplicate$ is.lowercase.word
    'is.single.pinyin
    { pop$ #0 }
  if$
}

FUNCTION {is.double.pinyin}
{ duplicate$ string.length 'a :=
  #1
    { a #0 > and }
    { duplicate$ #1 a substring$ is.single.pinyin
        { duplicate$ a #1 + global.max$ substring$
          duplicate$ empty$
            { pop$ #0 }
            { is.single.pinyin
                { #0 }
                { a #1 - 'a :=
                  #1
                }
              if$
            }
          if$
        }
        { a #1 - 'a :=
          #1
        }
      if$
    }
  while$
  't :=
  t #1 #1 substring$
  t a #1 + #1 substring$
  duplicate$ empty$
    'pop$
    { " " swap$ * * }
  if$
  't :=
  a #0 >
}

FUNCTION {is.double.pinyin.word}
{ duplicate$ is.lowercase.word
    'is.double.pinyin
    { pop$ #0 }
  if$
}

FUNCTION {extract.before}
{ 'find :=
  'text :=
  find string.length 'find_length :=
  ""
    { text empty$ not }
    { text #1 find_length substring$ find =
        { "" 'text := }
        { text #1 #1 substring$ *
          text #2 global.max$ substring$ 'text :=
        }
      if$
    }
  while$
}

FUNCTION {extract.after}
{ 'find :=
  'text :=
  find string.length 'find_length :=
  ""
    { text empty$ not }
    { text #1 find_length substring$ find =
        { text find_length #1 + global.max$ substring$ *
          "" 'text :=
        }
        { text #2 global.max$ substring$ 'text := }
      if$
    }
  while$
}

FUNCTION {format.western.given.name}
{ s nameptr "{ f.}" format.name$
  control.initialize.with.hyphen
    'skip$
    { duplicate$ "-" contains
        { "-" " " find.replace
          "u" change.case$
        }
        'skip$
      if$
    }
  if$
  s nameptr "{, jj}" format.name$ *
  "." "" find.replace
}

FUNCTION {is.family.name.pinyin}
{ s nameptr "{ll}" format.name$
  duplicate$ empty$
    { pop$ #0 }
    { "l" change.case$
      duplicate$ "-" contains
        { duplicate$ "-" extract.before is.single.pinyin.word
            { "-" extract.after is.single.pinyin.word }
            { pop$ #0 }
          if$
        }
        { % 这个函数实在太慢了
          % is.double.pinyin
          is.single.pinyin.word
        }
      if$
    }
  if$
}

FUNCTION {is.given.name.pinyin}
{ s nameptr "{ff}" format.name$
  duplicate$ empty$
    { pop$ #0 }
    { "l" change.case$
      "’" "'" find.replace
      duplicate$ "'" contains
        { duplicate$ "'" extract.before
          duplicate$ #1 #1 substring$ 't :=
          is.single.pinyin.word
            { "'" extract.after
              duplicate$ #1 #1 substring$ t " " * swap$ * 't :=
              is.single.pinyin.word
            }
            { pop$ #0 }
          if$
        }
        'is.double.pinyin.word
      if$
    }
  if$
}

FUNCTION {is.name.pinyin}
{ s nameptr "{vv}{jj}" format.name$ empty$
    { is.family.name.pinyin
        'is.given.name.pinyin
        { #0 }
      if$
    }
    { #0 }
  if$
}

FUNCTION {format.latin.name}
{ s nameptr "{vv~}{ll}" format.name$
  control.uppercase.family
    'smart.upper.case
    'skip$
  if$
  control.check.pinyin
    { is.name.pinyin
        { control.initialize.pinyin
            { " " t "u" change.case$ * }
            { s nameptr "{ ff}" format.name$ }
          if$
        }
        { format.western.given.name }
      if$
    }
    { format.western.given.name }
  if$
  *
}

FUNCTION {format.name}
{ s nameptr "{vv~}{ll}{,~ff}{, jj}" format.name$
  get.str.lang
  duplicate$
  duplicate$ lang.zh = swap$ lang.ja = or
    { pop$
      s nameptr "{vv~}{ll}" format.name$
      s nameptr "{ff}{, jj}" format.name$
      duplicate$ get.str.lang
      duplicate$ lang.zh = swap$ lang.ja = or
        { * }
        { pop$ }
      if$
    }
    { lang.ru =
        { s nameptr "{vv~}{ll}" format.name$
          s nameptr "{ff}{, jj}" format.name$
          "." "" find.replace
          duplicate$ empty$
            'pop$
            { " " swap$ * * }
          if$
        }
        { format.latin.name }
      if$
    }
  if$
}

FUNCTION {inter.word.space}
{ is.lang.cjk
    { "" }
    { " " }
  if$
}

FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { format.name 't :=
      nameptr #1 >
        { numnames control.max.bib.names >
          nameptr control.min.bib.names > and
            { "others" 't :=
              #1 'namesleft :=
            }
            'skip$
          if$
          namesleft #1 >
            { add.comma t * }
            { t "l" change.case$ "others" =
                { nameptr #2 >
                    { add.comma }
                    { inter.word.space * }
                  if$
                  bbl.et.al *
                }
                { control.bib.final.and
                    { is.lang.cjk not nameptr #2 > and
                        { add.comma }
                        { inter.word.space * }
                      if$
                      bbl.and * inter.word.space *
                    }
                    { add.comma }
                  if$
                  t *
                }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
  format.punctuations
}

FUNCTION {warn.empty.field}
{ control.warn.empty.field
    { "empty " swap$ * " in " * cite$ * warning$ }
    'pop$
  if$
}

FUNCTION {format.anonymous}
{
  ""
}

FUNCTION {format.authors}
{ author empty$
    { "author" warn.empty.field
      format.anonymous
    }
    { author format.names }
  if$
}

FUNCTION {format.editors}
{ editor empty$
    { "editor" warn.empty.field
      format.anonymous
    }
    { editor format.names }
  if$
}

FUNCTION {format.authors.editors}
{ author empty$
    { editor empty$
        { "author and editor" warn.empty.field
          format.anonymous
        }
        { editor format.names }
      if$
    }
    { author format.names }
  if$
}

FUNCTION {format.translators}
{ translator empty$
    { "" }
    { translator format.names
      add.comma bbl.translator *
    }
  if$
}

FUNCTION {format.lab.name}
{ s nameptr "{vv~}{ll}{,~ff}{, jj}" format.name$
  get.str.lang
  duplicate$ lang.zh =
  swap$ lang.ja = or
    { s nameptr "{vv~}{ll}" format.name$
      s nameptr "{ff}{, jj}" format.name$
      duplicate$ get.str.lang
      duplicate$ lang.zh = swap$ lang.ja = or
        { * }
        'pop$
      if$
    }
    { s nameptr "{vv~}{ll}" format.name$ }
  if$
}

FUNCTION {format.full.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { format.lab.name 't :=
      nameptr #1 >
        { namesleft #1 >
            { add.comma t * }
            { t "l" change.case$ "others" =
                { nameptr #2 >
                    { add.comma }
                    { inter.word.space * }
                  if$
                  cite.et.al *
                }
                { control.cite.final.and
                    { is.lang.cjk not nameptr #2 > and
                        { add.comma }
                        { inter.word.space * }
                      if$
                      cite.and * inter.word.space *
                    }
                    { add.comma }
                  if$
                  t *
                }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
  format.punctuations
}

FUNCTION {author.editor.full}
{ author empty$
    { editor empty$
        { "" }
        { editor format.full.names }
      if$
    }
    { author format.full.names }
  if$
}

FUNCTION {author.full}
{ author empty$
    { "" }
    { author format.full.names }
  if$
}

FUNCTION {editor.full}
{ editor empty$
    { "" }
    { editor format.full.names }
  if$
}

FUNCTION {holder.author.full}
{ holder empty$
    { author empty$
        { "" }
        { author format.full.names }
      if$
    }
    { holder format.full.names }
  if$
}

FUNCTION {make.full.names}
{ type$ "book" =
  type$ "inbook" = booktitle empty$ not and
  or
    'author.editor.full
    { type$ "collection" =
      type$ "proceedings" =
      or
        'editor.full
        { type$ "patent" =
            'holder.author.full
            'author.full
          if$
        }
      if$
    }
  if$
}

FUNCTION {output.bibitem}
{ newline$
  "\bibitem[" write$
  label ")" *
  make.full.names duplicate$ short.list =
    { pop$ }
    { duplicate$ "]" contains
        { "{" swap$ * "}" * }
        'skip$
      if$
      *
    }
  if$
  "]{" * write$
  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}

FUNCTION {format.title.subtitle.titleaddon}
{ title empty$
    { "" }
    { title
      subtitle empty$
        'skip$
        { add.colon.by.language subtitle * }
      if$
      titleaddon empty$
        'skip$
        { add.colon.by.language titleaddon * }
      if$
    }
  if$
}

FUNCTION {change.sentence.case}
{ entry.lang lang.en =
    'smart.sentence.case
    'skip$
  if$
}

FUNCTION {add.link}
{ url empty$ not
    { "\href{" url * "}{" * swap$ * "}" * }
    { doi empty$ not
        { "\href{https://doi.org/" doi * "}{" * swap$ * "}" * }
        'skip$
      if$
    }
  if$
}

FUNCTION {format.tr.number}
{ ""
  number empty$
    'skip$
    { type$ "patent" = control.patent.country and
        { country empty$ not
            { country * }
            { nationality empty$ not
                { nationality * }
                { address empty$ not
                    { address * }
                    { location empty$ not
                        { location * }
                        { "" }
                        { entry.lang lang.zh =
                            { "中国" * }
                            'skip$
                          if$
                        }
                      if$
                    }
                  if$
                }
              if$
            }
          if$
        }
        'skip$
      if$
      duplicate$ empty$
        'skip$
        'add.comma
      if$
      number
      duplicate$ get.str.lang lang.zh =
        'format.punctuations
        'skip$
      if$
      *
    }
  if$
}

FUNCTION {entry.has.url.or.doi}
{ control.url require.url or entry.url empty$ not and
  doi empty$ not cstr empty$ not or
  control.doi control.url or require.url or and
  or
}

FUNCTION {format.entry.type.id}
{ control.entry.type.id
    { entry.type.id
      control.entry.medium.id
        { entrymediumid empty$
            { medium empty$
                { entry.has.url.or.doi
                  type$ "online" = or
                  type$ "webpage" = or
                    { "/OL" * }
                    'skip$
                  if$
                }
                { "The field 'medium' for entry medium ID is deprecated. Use 'entrymediumid' instead." warning$
                  "/" * medium *
                }
              if$
            }
            { "/" * entrymediumid * }
          if$
        }
        'skip$
      if$
      make.brackets
      control.space.before.type.id
        { " " }
        { "\allowbreak" }
      if$
      swap$ *
    }
    { "" }
  if$
}

FUNCTION {format.title}
{ title empty$
    { "" }
    { format.title.subtitle.titleaddon
      control.sentence.case.title
        'change.sentence.case
        'skip$
      if$
      format.punctuations
      control.link.title
        'add.link
        'skip$
      if$
      entry.numbered number empty$ not and
        { add.colon
          format.tr.number *
        }
        'skip$
      if$
      format.entry.type.id *
    }
  if$
}

FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}

FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}

FUNCTION {is.digit}
{ duplicate$ empty$
    { pop$ #0 }
    { chr.to.int$
      duplicate$ "0" chr.to.int$ <
      { pop$ #0 }
      { "9" chr.to.int$ >
          { #0 }
          { #1 }
        if$
      }
    if$
    }
  if$
}

FUNCTION {is.number}
{ #1
    { #0 > }
    { duplicate$ #1 #1 substring$ chr.to.int$
      duplicate$ #47 >
      swap$      #58 <
      and
        { #2 global.max$ substring$
          duplicate$ empty$
            { #0 }
            { #1 }
          if$
        }
        { #0 }
      if$
    }
  while$
  empty$
}

FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { volume is.number
        { entry.lang lang.zh =
            { "第" volume tie.or.space.connect " 卷" * }
            { entry.lang lang.ko =
                { "제" volume tie.or.space.connect " 권" * }
                { "v." volume * }
              if$
            }
          if$
        }
        { volume }
      if$
    }
  if$
}

FUNCTION {format.maintitle}
{ maintitle empty$
    { "" }
    { mainsubtitle empty$
        'skip$
        { add.colon.by.language mainsubtitle * }
      if$
      maintitleaddon empty$
        'skip$
        { add.colon.by.language maintitleaddon * }
      if$
    }
  if$
}

FUNCTION {format.maintitle.volume}
{ maintitle empty$
    { "" }
    { maintitle
      volume empty$
        'skip$
        { add.colon.by.language
          format.bvolume *
        }
      if$
    }
  if$
}

FUNCTION {format.title.volume}
{ title empty$
    { "" }
    { format.title.subtitle.titleaddon
      volume empty$
        'skip$
        { add.colon.by.language
          format.bvolume *
        }
      if$
    }
  if$
}

FUNCTION {format.series.volume}
{ series empty$
    { "" }
    { series
      volume empty$
        'skip$
        { add.colon.by.language
          format.bvolume *
        }
      if$
    }
  if$
}

FUNCTION {format.btitle}
{ maintitle empty$
    { series empty$
        { format.title.volume }
        { volume empty$
            { format.title.volume }
            { format.series.volume
              entry.numbered
                'skip$
                { "volume and number" number either.or.check }
              if$
              bbl.wide.space *
              format.title.subtitle.titleaddon
              *
            }
          if$
        }
      if$
    }
    { volume empty$
        { format.maintitle
          add.colon.by.language
          format.title.subtitle.titleaddon *
        }
        { format.maintitle.volume
          bbl.wide.space *
          format.title.subtitle.titleaddon
          *
        }
      if$
    }
  if$
  duplicate$ empty$
    'skip$
    { control.sentence.case.title
        'change.sentence.case
        'skip$
      if$
      format.punctuations
      emphasize.book.title
      control.link.title
        'add.link
        'skip$
      if$
      entry.numbered number empty$ not and
        { add.colon format.tr.number * }
        'skip$
      if$
      type$ "map" =
      scale empty$ not and
        { add.period
          duplicate$ #-1 #1 substring$ "." =
            { " " * }
            'skip$
          if$
          scale *
        }
        'skip$
      if$
      format.entry.type.id *
    }
  if$
}

FUNCTION {format.booktitle}
{ booktitle empty$
    { "" }
    { booktitle
      control.sentence.case.booktitle
        'change.sentence.case
        'skip$
      if$
      booksubtitle empty$
        'skip$
        { add.colon
          booksubtitle
          control.sentence.case.booktitle
            { "l" change.case$ }
            'skip$
          if$
          *
        }
      if$
      emphasize.book.title
      booktitleaddon empty$
        'skip$
        { add.colon
          booktitleaddon
          control.sentence.case.booktitle
            { "l" change.case$ }
            'skip$
          if$
          *
        }
      if$
      format.punctuations
    }
  if$
}

FUNCTION {format.series.volume.booktitle}
{ series empty$
    { maintitle empty$
        { format.booktitle
          volume empty$
            'skip$
            { add.colon
              format.bvolume *
            }
          if$
        }
        { format.maintitle.volume
          bbl.wide.space *
          format.booktitle *
        }
      if$
    }
    { volume empty$
        { format.booktitle }
        { format.series.volume
          bbl.wide.space *
          format.booktitle *
        }
      if$
    }
  if$
}

FUNCTION {format.in.ed.booktitle}
{ booktitle empty$
    { "" }
    { control.in
        { bbl.in add.colon }
        { "" }
      if$
      editor empty$
        'skip$
        { format.editors * output new.block "" }
      if$
      format.series.volume.booktitle *
    }
  if$
}

FUNCTION {remove.dots}
{ 's :=
  ""
    { s empty$ not }
    { s #1 #1 substring$
      duplicate$ "." =
        'pop$
        { * }
      if$
      s #2 global.max$ substring$ 's :=
    }
  while$
}

FUNCTION {format.journal.title}
{ journal empty$
    { journaltitle empty$
        { "" }
        { journaltitle }
      if$
    }
    { journal }
  if$
  journalsubtitle empty$
    'skip$
    { duplicate$ empty$
        'skip$
        'add.colon.by.language
      if$
      journalsubtitle *
    }
  if$
  journaltitleaddon empty$
    'skip$
    { duplicate$ empty$
        'skip$
        'add.colon.by.language
      if$
      journaltitleaddon *
    }
  if$
  control.sentence.case.journal
    'change.sentence.case
    'skip$
  if$
}

FUNCTION {format.short.journal}
{ shortjournal empty$
    { format.journal.title
      duplicate$ field.or.null " " contains  % The journal title is not a single word
      is.lang.cjk not and
        { "shortjournal" warn.empty.field }
        'skip$
      if$
    }
    { shortjournal
      control.journal.dots
        'skip$
        'remove.dots
      if$
    }
  if$
}

FUNCTION {get.journal.title}
{ control.short.journal
    'format.short.journal
    { format.journal.title
      duplicate$ empty$
        { shortjournal empty$
            { "journal" warn.empty.field }
            { pop$ format.short.journal }
          if$
        }
        { shortjournal empty$ control.journal.dots not and
            'remove.dots
            { duplicate$ shortjournal = control.journal.dots not and
                'remove.dots
                'skip$
              if$
            }
          if$
        }
      if$
    }
  if$
}

FUNCTION {check.arxiv.preprint}
{ "l" change.case$
  duplicate$ #1 #5 substring$ "arxiv" =
    { 'x :=
      "arxiv:" 'y :=
      y text.length$ 'len :=
      x text.length$ len - #1 + 'charptr :=
        { charptr #0 >
          x charptr len substring$ y = not
          and
        }
        { charptr #1 - 'charptr := }
      while$
      charptr #0 >
        { x charptr #6 + global.max$ substring$ 'x :=
          x string.length #1 + 'len :=
          #1 'charptr :=
            { charptr len <
              x charptr #1 substring$ " " = not and
              x charptr #1 substring$ "[" = not and
            }
            { charptr #1 + 'charptr := }
          while$
          x #1 charptr substring$
          duplicate$ empty$
            'pop$
            { "\url{https://arxiv.org/abs/" swap$ * "}" * 'entry.url := }
          if$
        }
        'skip$
      if$
      #1
    }
    { pop$ #0 }
  if$
}

FUNCTION {format.journal}
{ get.journal.title
  duplicate$ empty$
    'skip$
    { format.punctuations
      control.emph.journal is.lang.cjk not and
        'emphasize
        'skip$
      if$
    }
  if$
}

FUNCTION {set.entry.type.id}
{ entry.type.id empty$
    { entrytypeid empty$
        { entrysubtype empty$
            { mark empty$
                { 'entry.type.id := }
                { pop$
                  "The field 'mark' for entry type ID is deprecated. Use 'entrytypeid' instead." warning$
                  mark 'entry.type.id :=
                }
              if$
            }
            { entrysubtype "newspaper" =
                { pop$ "N" 'entry.type.id := }
                { entrysubtype "inproceedings" =
                    { pop$ "C" 'entry.type.id := }
                    { entrysubtype "report" =
                        { pop$ "R" 'entry.type.id := }
                        { entrysubtype "techreport" =
                            { pop$ "R" 'entry.type.id := }
                            { entrysubtype "standard" =
                                { pop$ "S" 'entry.type.id := }
                                { entrysubtype "patent" =
                                    { pop$ "P" 'entry.type.id := }
                                    { entrysubtype "dataset" =
                                        { pop$ "DS" 'entry.type.id := }
                                        { 'entry.type.id := }
                                      if$
                                    }
                                  if$
                                }
                              if$
                            }
                          if$
                        }
                      if$
                    }
                  if$
                }
              if$
            }
          if$
        }
        { pop$ entrytypeid 'entry.type.id := }
      if$
    }
    'pop$
  if$
}

FUNCTION {num.to.ordinal}
{ is.lang.cjk
    'skip$
    { duplicate$ #-2 #1 substring$ "1" =
        { "th" * }
        { duplicate$ #-1 #1 substring$ "1" =
            { "st" * }
            { duplicate$ #-1 #1 substring$ "2" =
                { "nd" * }
                { duplicate$ #-1 #1 substring$ "3" =
                    { "rd" * }
                    { "th" * }
                  if$
                }
              if$
            }
          if$
        }
      if$
    }
  if$
}

FUNCTION {extract.num}
{ duplicate$ 't :=
  "" 's :=
  { t empty$ not }
  { t #1 #1 substring$
    t #2 global.max$ substring$ 't :=
    duplicate$ is.digit
      { s swap$ * 's := }
      { pop$ "" 't := }
    if$
  }
  while$
  s empty$
    'skip$
    { pop$ s }
  if$
}

FUNCTION {word.to.num}
{ duplicate$ "l" change.case$ 's :=
  s "first" =
    { pop$ "1" }
    'skip$
  if$
  s "second" =
    { pop$ "2" }
    'skip$
  if$
  s "third" =
    { pop$ "3" }
    'skip$
  if$
  s "fourth" =
    { pop$ "4" }
    'skip$
  if$
  s "fifth" =
    { pop$ "5" }
    'skip$
  if$
  s "sixth" =
    { pop$ "6" }
    'skip$
  if$
  s "seventh" =
    { pop$ "7" }
    'skip$
  if$
  s "eighth" =
    { pop$ "8" }
    'skip$
  if$
  s "ninth" =
    { pop$ "9" }
    'skip$
  if$
  s "tenth" =
    { pop$ "10" }
    'skip$
  if$
  s "revised edition" =
    { pop$ "Rev. ed." }
    'skip$
  if$
  s "revised ed." =
    { pop$ "Rev. ed." }
    'skip$
  if$
  s "revised" =
    { pop$ "Rev. ed." }
    'skip$
  if$
  s "rev." =
    { pop$ "Rev. ed." }
    'skip$
  if$
  s "修订版" =
    { pop$ "修订版" }
    'skip$
  if$
  s "修订" =
    { pop$ "修订版" }
    'skip$
  if$
}

FUNCTION {format.edition}
{ edition empty$
    { "" }
    { edition
      duplicate$ #1 #1 substring$ is.digit
        'extract.num
        'word.to.num
      if$
      duplicate$ "1" =
        { pop$ "" }
        { duplicate$ #1 #1 substring$ is.digit
            { num.to.ordinal
              " " * bbl.edition *
            }
            'skip$
          if$
        }
      if$
    }
  if$
}

FUNCTION {format.version}
{ version empty$
    { "" }
    { version #1 #1 substring$
      duplicate$ "V" =
        { pop$ version }
        { "v" =
            { "V" version #2 global.max$ substring$ * }
            { "V" version * }
          if$
        }
      if$
    }
  if$
}

FUNCTION {format.publisher}
{ publisher empty$
    { institution empty$
        { school empty$
            { "" }
            { school }
          if$
        }
        { institution }
      if$
    }
    { publisher }
  if$
  format.punctuations
}

FUNCTION {format.address.publisher}
{ address empty$
    { location empty$
        { "" }
        { location }
      if$
    }
    { address }
  if$
  format.punctuations
  duplicate$ empty$ not
    { format.publisher empty$ not
        { add.colon format.publisher * }
        { entry.has.url.or.doi not control.unknown.publisher and
            { add.colon bbl.sine.nomine make.brackets * }
            'skip$
          if$
        }
      if$
    }
    { pop$
      entry.has.url.or.doi not control.unknown.publisher and
        { format.publisher empty$ not
            { bbl.sine.loco make.brackets add.colon format.publisher * }
            { bbl.sine.loco.sine.nomine make.brackets }
          if$
        }
        { format.publisher empty$ not
            { format.publisher }
            { "" }
          if$
        }
      if$
    }
  if$
}

FUNCTION {format.eventtitle}
{ eventtitle empty$
    { "" }
    { eventtitle format.punctuations }
  if$
}

FUNCTION {normalize.year.dash}
{
  "bylanguage" control.bib.punct =
  is.lang.cjk and
  "GB" control.bib.punct = or
    { "---" "—" find.replace
      "--" "—" find.replace
      "–" "—" find.replace
      "-" "—" find.replace
    }
    { "---" "-" find.replace
      "--" "-" find.replace
      "–" "-" find.replace
      "—" "-" find.replace
    }
  if$
}

FUNCTION {format.date}
{ year empty$
    { date empty$
        { entry.has.url.or.doi
            { "" }
            { "year" warn.empty.field
              urldate empty$
                { "" }
                { urldate "-" extract.before extra.label * make.brackets }
              if$
            }
          if$
        }
        { date "/" extract.before "-" extract.before
          date "/" contains
            { "-" normalize.year.dash *
              date "/" extract.after "-" extract.before *
            }
            'skip$
          if$
          extra.label *
        }
      if$
    }
    { year normalize.year.dash
      extra.label *
    }
  if$
}

FUNCTION {format.full.date}
{ date empty$
    { year }
    { control.year.before.title
        { date }
        { date #1 #4 substring$
          extra.label *
          date #5 global.max$ substring$ *
        }
      if$
    }
  if$
}

FUNCTION {format.lab.date}
{ year empty$
    { date empty$
        { urldate empty$
            { bbl.no.date
              extra.label empty$
                'skip$
                { "-" * extra.label *}
              if$
            }
            { urldate "-" extract.before extra.label * make.brackets }
          if$
        }
        { date "/" extract.before "-" extract.before
          date "/" contains
            { "-" normalize.year.dash *
              date "/" extract.after "-" extract.before *
            }
            'skip$
          if$
          extra.label *
        }
      if$
    }
    { year normalize.year.dash extra.label * }
  if$
}

FUNCTION {format.creation.modification.date}
{ date empty$
    {
      year empty$
        { "" }
        { year}
      if$
    }
    { date }
  if$
  duplicate$ empty$
    'skip$
    { make.parentheses
      "\allowbreak " swap$ *
    }
  if$
}

FUNCTION {format.urldate}
{
  control.urldate urldate empty$ not and
    { "\allowbreak" urldate make.brackets * }
    { "" }
  if$
}

FUNCTION {normalize.page.range}
{ "" swap$
  { duplicate$ empty$ not }
    { #1 skip.inter.token.chars.by 't :=
      empty$
        { "" }
        'control.page.range.delim
      if$
      * t
      #1 tokenize.by 't :=
      * t
    }
  while$
  pop$
}

FUNCTION {format.pages}
{ pages empty$
    { "" }
    { pages
      control.page.ranges
        'normalize.page.range
        { #1 tokenize.by pop$ }
      if$
    }
  if$
}

FUNCTION {format.dimensions}
{ dimensions empty$
    { "" }
    { dimensions
      "x" "$\times$" find.replace
      "×" "$\times$" find.replace
    }
  if$
}

FUNCTION {format.journal.volume}
{ volume empty$
    { "" }
    { control.bold.volume
        { "\textbf{" volume * "}" * }
        { volume }
      if$
    }
  if$
}

FUNCTION {format.journal.number}
{ number empty$
    { "" }
    { "\allowbreak " number make.parentheses * }
  if$
}

FUNCTION {format.journal.pages}
{ pages empty$
    { eid empty$
        { "" }
        { eid }
      if$
    }
    { format.pages }
  if$
}

FUNCTION {format.newspaper.pages}
{ pages empty$
    { "" }
    { "\allowbreak " format.pages make.parentheses * }
  if$
}

FUNCTION {check.electronic}
{ entry.url empty$
    { url empty$
        { howpublished field.or.null #1 #5 substring$ "\url{" =
            { howpublished 'entry.url := }
            { note field.or.null #1 #5 substring$ "\url{" =
                { note "}" extract.before "}" * 'entry.url := }
                'skip$
              if$
            }
          if$
        }
        { "\url{" url * "}" * 'entry.url := }
      if$
    }
    'skip$
  if$
}

FUNCTION {format.url}
{ control.url require.url or
    { entry.url empty$
        { control.doi not require.url or
            { cstr empty$
                { doi empty$
                    'skip$
                    { "\url{https://doi.org/" doi * "}" * 'entry.url := }
                  if$
                }
                { "\url{https://cstr.cn/" cstr * "}" * 'entry.url := }
              if$
            }
            'skip$
          if$
        }
        'skip$
      if$
      entry.url empty$
        { "" }
        { new.block
          entry.url
        }
      if$
    }
    { "" }
  if$
}

FUNCTION {either.or}
{ swap$
  duplicate$ empty$
    { pop$
      duplicate$ empty$
        { pop$ "" }
        'skip$
      if$
    }
    { swap$ pop$ }
  if$
}

FUNCTION {format.doi}
{ control.doi
    { control.cstr not cstr empty$ or
        { doi empty$
            { "" }
            { control.url require.url or
              entry.url doi contains and
                { "" }
                { new.block "DOI:\doi{" doi * "}" * }
              if$
            }
          if$
        }
        { control.url require.url or
          entry.url cstr contains and
            { "" }
            { new.block "CSTR:\cstr{" cstr * "}" * }
          if$
        }
      if$
    }
    { "" }
  if$
}

FUNCTION {format.eprint}
{ archiveprefix eprinttype either.or
  duplicate$ empty$
    { pop$
      journal journaltitle either.or shortjournal either.or
      "l" change.case$ #1 #5 substring$ "arxiv" =
        { "arXiv" }
        { "" }
      if$
    }
    { duplicate$ "arxiv" =
        { pop$ "arXiv" }
        { duplicate$ "pubmed" =
            { pop$ "PubMed" }
            'skip$
        if$
        }
      if$
    }
  if$
  entry.url empty$
    { duplicate$ "l" change.case$ "arxiv" = entry.eprint empty$ not and
        { "\url{https://arxiv.org/abs/" entry.eprint * "}" * 'entry.url := }
        'skip$
      if$
    }
    'skip$
  if$
  control.eprint eprint empty$ not and
    { duplicate$ empty$
        'skip$
        { ":" * }
      if$
      eprint *
    }
    'skip$
  if$
}

FUNCTION {format.note}
{ note empty$ not control.note and
    { note }
    { "" }
  if$
}

FUNCTION {empty.misc.check}
{ author empty$ title empty$
  year empty$
  and and
  key empty$ not and
    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}

FUNCTION {link.open}
{ control.link.journal
    { url empty$
        { doi empty$
            { "" }
            { "\href{https://doi.org/" doi * "}{" * }
          if$
        }
        { "\href{" url * "}{" * }
      if$
      duplicate$ empty$
        { pop$ }
        { "" set.punct
          output
          before.all 'output.state :=
        }
      if$
    }
    'skip$
  if$
}

FUNCTION {link.close}
{ control.link.journal
    { url empty$ doi empty$ and
        'skip$
        { "" set.punct
          "}" output
          before.all 'output.state :=
        }
      if$
    }
    'skip$
  if$
}

FUNCTION {article.journal}
{ "J" set.entry.type.id
  volume empty$ number empty$ and entry.url empty$ not and
  date field.or.null text.length$ #9 > and
  entry.type.id "J" = and
    { #1 'require.url := }
    'skip$
  if$
  output.bibitem
  format.authors output
  control.article.title
    { new.block
      format.title "title" output.check
    }
    'skip$
  if$
  new.block
  format.translators output
  new.block
  link.open
  format.journal "journal" output.check
  entry.type.id "N" =
    { format.full.date "date" output.check
      "" set.punct
      format.newspaper.pages output
    }
    {
      volume empty$ number empty$ and date field.or.null text.length$ #9 > and
        { format.full.date "date" output.check }
        { format.date "year" output.check  }
      if$
      format.journal.volume output
      "" set.punct
      format.journal.number output
      bbl.pages.colon set.punct
      format.journal.pages output
    }
  if$
  link.close
  format.url output
  format.doi output
  new.block
  format.note output
  fin.entry
}

FUNCTION {archive}
{ "A" set.entry.type.id
  output.bibitem
  format.authors output
  new.block
  format.btitle "title" output.check
  % new.block
  % format.translators output
  new.block
  format.address.publisher output
  format.full.date "year" output.check
  bbl.pages.colon set.punct
  format.pages output
  format.url output
  format.doi output
  new.block
  format.note output
  fin.entry
}

FUNCTION {book}
{ "M" set.entry.type.id
  output.bibitem
  format.authors.editors output
  new.block
  format.btitle "title" output.check
  new.block
  format.translators output
  new.sentence
  format.edition output
  new.block
  format.address.publisher output
  format.date output
  bbl.pages.colon set.punct
  format.pages output
  format.url output
  format.doi output
  new.block
  format.note output
  fin.entry
}

FUNCTION {letter} { archive }

FUNCTION {dataset}
{ "DS" set.entry.type.id
  output.bibitem
  format.authors output
  new.block
  format.btitle "title" output.check
  new.block
  format.version output
  new.block
  publisher "publisher" output.check
  "" set.punct
  format.creation.modification.date output
  "" set.punct
  format.urldate "urldate" output.check
  format.url output
  format.doi output
  new.block
  format.note output
  fin.entry
}

FUNCTION {database}
{ "DB" set.entry.type.id
  dataset
}

FUNCTION {inbook}
{ "M" set.entry.type.id
  booktitle empty$
    'book
    { output.bibitem
      format.authors output
      control.article.title
        { new.block
          format.title "title" output.check
        }
        'skip$
      if$
      new.block
      format.translators output
      new.slash
      booktitle empty$
        { "" }
        { control.in
            { bbl.in add.colon }
            { "" }
          if$
          bookauthor empty$
            { editor empty$
                'skip$
                { format.editors * output new.block "" }
              if$
            }
            { bookauthor format.names * output new.block "" }
          if$
          format.series.volume.booktitle *
        }
      if$
      "booktitle" output.check
      new.block
      format.edition output
      new.block
      format.address.publisher output
      format.date output
      bbl.pages.colon set.punct
      format.pages output
      format.url output
      format.doi output
      new.block
      format.note output
      fin.entry
    }
  if$
}

FUNCTION {incollection}
{ "M" set.entry.type.id
  output.bibitem
  format.authors output
  control.article.title
    { new.block
      format.title "title" output.check
    }
    'skip$
  if$
  new.block
  format.translators output
  new.slash
  format.in.ed.booktitle "booktitle" output.check
  new.block
  format.edition output
  new.block
  format.address.publisher output
  format.date output
  bbl.pages.colon set.punct
  format.pages output
  format.url output
  format.doi output
  new.block
  format.note output
  fin.entry
}

FUNCTION {inproceedings}
{ "C" set.entry.type.id
  output.bibitem
  format.authors output
  control.article.title
    { new.block
      format.title "title" output.check
    }
    'skip$
  if$
  new.slash
  booktitle empty$
    { format.eventtitle "eventtitle" output.check }
    { format.in.ed.booktitle "booktitle" output.check
      new.block
      format.edition output
      new.block
      format.address.publisher output
    }
  if$
  format.date output
  bbl.pages.colon set.punct
  format.pages output
  format.url output
  format.doi output
  new.block
  format.note output
  fin.entry
}

FUNCTION {conference} { inproceedings }

FUNCTION {patent}
{ "P" set.entry.type.id
  output.bibitem
  holder empty$
    { format.authors "holder and author" output.check }
    { holder format.names output.nonnull }
  if$
  control.article.title
    { new.block
      format.title "title" output.check
    }
    'skip$
  if$
  new.block
  format.full.date "year" output.check
  bbl.pages.colon set.punct
  format.pages output
  format.url output
  format.doi output
  new.block
  format.note output
  fin.entry
}

FUNCTION {format.periodical.volume}
{ volume number either.or
  duplicate$ empty$
    { pop$ "" }
    { format.punctuations
      normalize.year.dash
    }
  if$
}

FUNCTION {periodical}
{ "J" set.entry.type.id
  output.bibitem
  format.editors output
  new.block
  format.title "title" output.check
  new.block
  format.periodical.volume output
  new.block
  format.address.publisher output
  format.date output
  format.url output
  format.doi output
  new.block
  format.note output
  fin.entry
}

FUNCTION {proceedings}
{ "C" set.entry.type.id
  output.bibitem
  format.editors output
  new.block
  format.btitle "title" output.check
  new.block
  format.translators output
  new.sentence
  format.edition output
  new.block
  format.address.publisher output
  format.date output
  bbl.pages.colon set.punct
  format.pages output
  format.url output
  format.doi output
  new.block
  format.note output
  fin.entry
}

FUNCTION {preprint}
{ #1 'require.url :=
  "PP" set.entry.type.id
  output.bibitem
  format.authors output
  control.article.title
    { new.block
      format.title "title" output.check
    }
    'skip$
  if$
  new.block
  format.version output
  new.block
  format.eprint output
  "" set.punct
  format.creation.modification.date output
  "" set.punct
  format.urldate "urldate" output.check
  format.url "url" output.check
  format.doi output
  new.block
  format.note output
  fin.entry
}

FUNCTION {thesis}
{ "D" set.entry.type.id
  output.bibitem
  format.authors output
  new.block
  format.btitle "title" output.check
  new.block
  format.address.publisher output
  format.date output
  bbl.pages.colon set.punct
  format.pages output
  format.url output
  format.doi output
  new.block
  format.note output
  fin.entry
}

FUNCTION {phdthesis} { thesis }

FUNCTION {mastersthesis} { thesis }

FUNCTION {techreport}
{ "R" set.entry.type.id
  output.bibitem
  format.authors output
  new.block
  format.btitle "title" output.check
  % new.block
  % format.translators output
  new.block
  institution empty$ publisher empty$ and
    { format.full.date "year" output.check
      bbl.pages.colon set.punct
      format.pages output
    }
    { format.address.publisher output
      format.date output
      bbl.pages.colon set.punct
      format.pages output
    }
  if$
  format.url output
  format.doi output
  new.block
  format.note output
  fin.entry
}

FUNCTION {report} { techreport }

FUNCTION {manual} { techreport }

FUNCTION {webpage}
{ #1 'require.url :=
  output.bibitem
  format.authors output
  new.block
  "EB" set.entry.type.id
  format.btitle "title" output.check
  new.block
  publisher empty$
    'skip$
    { format.address.publisher output
      format.date output
      bbl.pages.colon set.punct
      format.pages output
      "" set.punct
    }
  if$
  format.creation.modification.date output
  "" set.punct
  format.urldate "urldate" output.check
  format.url "url" output.check
  format.doi output
  new.block
  format.note output
  fin.entry
}

FUNCTION {misc}
{ eprint empty$ not archiveprefix empty$ not or eprinttype empty$ not or
    'preprint
    { entry.url empty$
        {
          "Z" set.entry.type.id
          book
        }
        'webpage
      if$
    }
  if$
  empty.misc.check
}

FUNCTION {article}
{ entrysubtype field.or.null "l" change.case$ "newspaper" =
    { "N" set.entry.type.id
      article.journal
    }
    { journal journaltitle either.or shortjournal either.or
      duplicate$ empty$
        { pop$
          archiveprefix eprinttype either.or eprint either.or empty$
            'article.journal
            'preprint
          if$
        }
        { check.arxiv.preprint
            'preprint
            'article.journal
          if$
        }
      if$
    }
  if$
}

FUNCTION {booklet} { book }

FUNCTION {collection}
{ "G" set.entry.type.id
  book
}

FUNCTION {image} { misc }

FUNCTION {legislation} { archive }

FUNCTION {map}
{ "CM" set.entry.type.id
  booktitle empty$ not
    { incollection }
    { output.bibitem
      format.authors output
      new.block
      format.btitle "title" output.check
      new.block
      format.edition output
      new.block
      format.address.publisher output
      format.date output
      bbl.pages.colon set.punct
      format.pages output
      new.block
      format.dimensions output
      format.url output
      format.doi output
      new.block
      format.note output
      fin.entry
    }
  if$
}

FUNCTION {newspaper}
{ "N" set.entry.type.id
  article.journal
}

FUNCTION {online}
{ eprint empty$
  archiveprefix empty$ and
  eprinttype empty$ and
    { webpage }
    { preprint }
  if$
}

FUNCTION {software}
{ "CP" set.entry.type.id
  webpage
}

FUNCTION {standard}
{ "S" set.entry.type.id
  output.bibitem
  number field.or.null output
  is.lang.cjk
    { "\quad " set.punct }
    { " " set.punct }
  if$
  format.btitle "title" output.check
  new.block
  format.url output
  new.block
  format.doi output
  new.block
  format.note output
  fin.entry
}

FUNCTION {unpublished} { misc }

FUNCTION {video} { misc }

FUNCTION {default.type} { misc }

FUNCTION {mult}
{ 'a :=                        %% we store the first value
 'b :=                        %% we store the second value

 b #0 <                       %% We remember the sign of b, and
    {#-1 #0 b - 'b :=}        %% then consider its absolute value.
    {#1}                      %%
 if$                          %%

 #0                           %% Put 0 on the stack.
 {b #0 >}                     %% While b is strictly positive,
 {                            %% we add a to the value on the stack
   a +                        %% and decrement b.
   b #1 - 'b :=               %%
 }                            %%
 while$                       %%

 swap$                        %% Last, we take the opposite
   'skip$                     %% if b was negative.
   {#0 swap$ -}               %%
 if$                          %%
}

FUNCTION {chr.to.value}       %% The ASCII code of a character
{ chr.to.int$ #48 -           %% ASCII value of "0" -> 48
  duplicate$ duplicate$       %%                "1" -> 49
  #0 < swap$ #9 > or          %%                   ...
  {                           %%                "9" -> 57
      #48 + int.to.chr$
      " is not a number..." *
      warning$                %% Return 0 if it is not a number
      pop$ #0                 %%
    }
  {}
  if$
}

FUNCTION {str.to.int.aux}     %% The auxiliary function
{ { duplicate$ empty$ not }     %% While the string is not empty
    {                              %% consider its first char
      swap$ #10 mult 'a :=    %% and ``add'' it at the end of
      duplicate$ #1 #1 substring$   %% the result.
      chr.to.value a +
      swap$
      #2 global.max$ substring$
    }
  while$
  pop$
}

FUNCTION {str.to.int}
{                             %% Handling negative values
  duplicate$ #1 #1 substring$ "-" =
    {#1 swap$ #2 global.max$ substring$}
    {#0 swap$}
  if$
                              %% Initialization, and then
  #0 swap$ str.to.int.aux     %% call to the aux. function
  swap$
    {#0 swap$ -}              %% And handle the sign.
    {}
  if$
}

FUNCTION {boolean.to.int}
{ "l" change.case$ duplicate$
    "true" =
    { pop$ #1 }
    { duplicate$ "false" =
        { pop$ #0 }
        { "unknown boolean " quote$ * swap$ * quote$ *
          " in " * cite$ * warning$
          #0
        }
      if$
    }
  if$
}

FUNCTION {GBT7714BSTCTL}
{ CTL_bib_punct empty$
    'skip$
    { CTL_bib_punct 'control.bib.punct := }
  if$
  CTL_convert_punct empty$
    'skip$
    { CTL_convert_punct boolean.to.int 'control.convert.punct := }
  if$
  CTL_max_bib_names empty$
    'skip$
    { CTL_max_bib_names str.to.int 'control.max.bib.names := }
  if$
  CTL_min_bib_names empty$
    'skip$
    { CTL_min_bib_names str.to.int 'control.min.bib.names := }
  if$
  CTL_max_cite_names empty$
    'skip$
    { CTL_max_cite_names str.to.int 'control.max.cite.names := }
  if$
  CTL_min_cite_names empty$
    'skip$
    { CTL_min_cite_names str.to.int 'control.min.cite.names := }
  if$
  CTL_uppercase_family empty$
    'skip$
    { CTL_uppercase_family boolean.to.int 'control.uppercase.family := }
  if$
  CTL_initialize_with_hyphen empty$
    'skip$
    { CTL_initialize_with_hyphen boolean.to.int 'control.initialize.with.hyphen := }
  if$
  CTL_check_pinyin empty$
    'skip$
    { CTL_check_pinyin boolean.to.int 'control.check.pinyin := }
  if$
  CTL_initialize_pinyin empty$
    'skip$
    { CTL_initialize_pinyin boolean.to.int 'control.initialize.pinyin := }
  if$
  CTL_bib_final_and empty$
    'skip$
    { CTL_bib_final_and boolean.to.int 'control.bib.final.and := }
  if$
  CTL_cite_final_and empty$
    'skip$
    { CTL_cite_final_and boolean.to.int 'control.cite.final.and := }
  if$
  CTL_cite_lang empty$
    'skip$
    { CTL_cite_lang 'control.cite.lang := }
  if$
  CTL_space_before_et_al empty$
    'skip$
    { CTL_space_before_et_al boolean.to.int 'control.space.before.et.al := }
  if$
  CTL_year_before_title empty$
    'skip$
    { CTL_year_before_title boolean.to.int 'control.year.before.title := }
  if$
  CTL_name_year_delim empty$
    'skip$
    { CTL_name_year_delim 'control.name.year.delim := }
  if$
  CTL_sentence_case empty$
    'skip$
    { CTL_sentence_case boolean.to.int 'control.sentence.case.title :=
      CTL_sentence_case boolean.to.int 'control.sentence.case.booktitle :=
    }
  if$
  CTL_sentence_case_title empty$
    'skip$
    { CTL_sentence_case_title boolean.to.int 'control.sentence.case.title := }
  if$
  CTL_sentence_case_booktitle empty$
    'skip$
    { CTL_sentence_case_booktitle boolean.to.int 'control.sentence.case.booktitle := }
  if$
  CTL_sentence_case_journal empty$
    'skip$
    { CTL_sentence_case_journal boolean.to.int 'control.sentence.case.journal := }
  if$
  CTL_capitalize_subtitle empty$
    'skip$
    { CTL_capitalize_subtitle boolean.to.int 'control.capitalize.subtitle := }
  if$
  CTL_link_title empty$
    'skip$
    { CTL_link_title boolean.to.int 'control.link.title := }
  if$
  CTL_article_title empty$
    'skip$
    { CTL_article_title boolean.to.int 'control.article.title := }
  if$
  CTL_patent_country empty$
    'skip$
    { CTL_patent_country boolean.to.int 'control.patent.country := }
  if$
  CTL_entry_type_id empty$
    'skip$
    { CTL_entry_type_id boolean.to.int 'control.entry.type.id := }
  if$
  CTL_space_before_type_id empty$
    'skip$
    { CTL_space_before_type_id boolean.to.int 'control.space.before.type.id := }
  if$
  CTL_entry_medium_id empty$
    'skip$
    { CTL_entry_medium_id boolean.to.int 'control.entry.medium.id := }
  if$
  CTL_slash empty$
    'skip$
    { CTL_slash boolean.to.int 'control.slash := }
  if$
  CTL_in empty$
    'skip$
    { CTL_in boolean.to.int 'control.in := }
  if$
  CTL_emph_booktitle empty$
    'skip$
    { CTL_emph_booktitle boolean.to.int 'control.emph.booktitle := }
  if$
  CTL_emph_journal empty$
    'skip$
    { CTL_emph_journal boolean.to.int 'control.emph.journal := }
  if$
  CTL_short_journal empty$
    'skip$
    { CTL_short_journal boolean.to.int 'control.short.journal := }
  if$
  CTL_journal_dots empty$
    'skip$
    { CTL_journal_dots boolean.to.int 'control.journal.dots := }
  if$
  CTL_link_journal empty$
    'skip$
    { CTL_link_journal boolean.to.int 'control.link.journal := }
  if$
  CTL_bold_volume empty$
    'skip$
    { CTL_bold_volume boolean.to.int 'control.bold.volume := }
  if$
  CTL_unknown_publisher empty$
    'skip$
    { CTL_unknown_publisher boolean.to.int 'control.unknown.publisher := }
  if$
  CTL_space_before_pages empty$
    'skip$
    { CTL_space_before_pages boolean.to.int 'control.space.before.pages := }
  if$
  CTL_page_ranges empty$
    'skip$
    { CTL_page_ranges boolean.to.int 'control.page.ranges := }
  if$
  CTL_page_range_delim empty$
    'skip$
    { CTL_page_range_delim 'control.page.range.delim := }
  if$
  CTL_urldate empty$
    'skip$
    { CTL_urldate boolean.to.int 'control.urldate := }
  if$
  CTL_url empty$
    'skip$
    { CTL_url boolean.to.int 'control.url := }
  if$
  CTL_doi empty$
    'skip$
    { CTL_doi boolean.to.int 'control.doi := }
  if$
  CTL_eprint empty$
    'skip$
    { CTL_eprint boolean.to.int 'control.eprint := }
  if$
  CTL_note empty$
    'skip$
    { CTL_note boolean.to.int 'control.note := }
  if$
  CTL_end_dot empty$
    'skip$
    { CTL_end_dot boolean.to.int 'control.end.dot := }
  if$
  CTL_warn_empty_field empty$
    'skip$
    { CTL_warn_empty_field boolean.to.int 'control.warn.empty.field := }
  if$
}

FUNCTION {control.pass}
{ type$ "gbt7714bstctl" =
    'GBT7714BSTCTL
    'skip$
  if$
}

FUNCTION {control.check}
{ % TODO
}

MACRO {jan} {"January"}

MACRO {feb} {"February"}

MACRO {mar} {"March"}

MACRO {apr} {"April"}

MACRO {may} {"May"}

MACRO {jun} {"June"}

MACRO {jul} {"July"}

MACRO {aug} {"August"}

MACRO {sep} {"September"}

MACRO {oct} {"October"}

MACRO {nov} {"November"}

MACRO {dec} {"December"}

MACRO {acmcs} {"ACM Computing Surveys"}

MACRO {acta} {"Acta Informatica"}

MACRO {cacm} {"Communications of the ACM"}

MACRO {ibmjrd} {"IBM Journal of Research and Development"}

MACRO {ibmsj} {"IBM Systems Journal"}

MACRO {ieeese} {"IEEE Transactions on Software Engineering"}

MACRO {ieeetc} {"IEEE Transactions on Computers"}

MACRO {ieeetcad}
 {"IEEE Transactions on Computer-Aided Design of Integrated Circuits"}

MACRO {ipl} {"Information Processing Letters"}

MACRO {jacm} {"Journal of the ACM"}

MACRO {jcss} {"Journal of Computer and System Sciences"}

MACRO {scp} {"Science of Computer Programming"}

MACRO {sicomp} {"SIAM Journal on Computing"}

MACRO {tocs} {"ACM Transactions on Computer Systems"}

MACRO {tods} {"ACM Transactions on Database Systems"}

MACRO {tog} {"ACM Transactions on Graphics"}

MACRO {toms} {"ACM Transactions on Mathematical Software"}

MACRO {toois} {"ACM Transactions on Office Information Systems"}

MACRO {toplas} {"ACM Transactions on Programming Languages and Systems"}

MACRO {tcs} {"Theoretical Computer Science"}

FUNCTION {sortify}
{ purify$
  "l" change.case$
}

FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}

FUNCTION {format.lab.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { format.lab.name 't :=
      nameptr #1 >
        { numnames control.max.cite.names >
          nameptr control.min.cite.names > and
            { "others" 't :=
              #1 'namesleft :=
            }
            'skip$
          if$
          namesleft #1 >
            { add.comma t * }
            { t "others" =
                { nameptr #2 >
                    { add.comma }
                    { space.precedes.et.al * }
                  if$
                  cite.et.al *
                }
                { control.cite.final.and
                    { is.lang.cjk not nameptr #2 > and
                        { add.comma }
                        { inter.word.space * }
                      if$
                      cite.and * inter.word.space *
                    }
                    { add.comma }
                  if$
                  t *
                }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
  format.punctuations
}

FUNCTION {author.key.label}
{ author empty$
    { bbl.anonymous }
    { author format.lab.names }
  if$
}

FUNCTION {author.editor.key.label}
{ author empty$
    { editor empty$
        { bbl.anonymous }
        { editor format.lab.names }
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {author.key.organization.label}
{ author empty$
    { organization empty$
        { bbl.anonymous }
        { "The " #4 organization chop.word #3 text.prefix$ }
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {editor.key.organization.label}
{ editor empty$
    { organization empty$
        { bbl.anonymous }
        { "The " #4 organization chop.word #3 text.prefix$ }
      if$
    }
    { editor format.lab.names }
  if$
}

FUNCTION {holder.author.label}
{ holder empty$
    { author empty$
        { bbl.anonymous }
        { author format.lab.names }
      if$
    }
    { holder format.lab.names }
  if$
}

FUNCTION {calc.short.authors}
{ type$ "book" =
  type$ "inbook" = booktitle empty$ not and
  or
    'author.editor.key.label
    { type$ "collection" =
      type$ "proceedings" =
      or
      type$ "periodical" =
      or
        { editor empty$ not
            'editor.key.organization.label
            'author.key.organization.label
          if$
        }
        { type$ "patent" =
            'holder.author.label
            'author.key.label
          if$
        }
      if$
    }
  if$
  'short.list :=
}

FUNCTION {calc.label}
{ calc.short.authors
  short.list
  duplicate$ "]" contains
    { "{" swap$ * "}" * }
    'skip$
  if$
  "("
  *
  format.lab.date
  duplicate$ "]" contains
    { "{" swap$ * "}" * }
    'skip$
  if$
  *
  'label :=
}

INTEGERS { seq.num }

FUNCTION {init.seq}
{ #0 'seq.num :=}

FUNCTION {int.to.fix}
{ "000000000" swap$ int.to.str$ *
  #-1 #10 substring$
}

FUNCTION {presort}
{ type$ "gbt7714bstctl" =
    {
      "_    "
      seq.num  int.to.fix
    }
    { set.entry.lang
      set.entry.numbered
      "" 'entry.url :=
      #0 'require.url :=
      check.electronic
      calc.label
      label sortify
      "    "
      *
      seq.num #1 + 'seq.num :=
      seq.num  int.to.fix
    }
  if$
  'sort.label :=
  sort.label *
  #1 entry.max$ substring$
  'sort.key$ :=
}

STRINGS { longest.label last.label next.extra last.extra.label }

INTEGERS { longest.label.width number.label }

FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
  #0 int.to.chr$ 'last.label :=
  "" 'next.extra :=
  #0 'longest.label.width :=
  #0 'number.label :=
  "" 'last.extra.label :=
}

FUNCTION {forward.pass}
{ type$ "gbt7714bstctl" =
    'skip$
    {
      number.label #1 + 'number.label :=
    }
  if$
}

FUNCTION {reverse.pass}
{ type$ "gbt7714bstctl" =
    'skip$
    {
      label extra.label * 'label :=
    }
  if$
}

FUNCTION {bib.sort.order}
{ sort.label  'sort.key$ := }

FUNCTION {begin.bib}
{   preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  "\begin{thebibliography}{" number.label int.to.str$ * "}" *
  write$ newline$
  control.cite.lang "macro" =
    { "\providecommand{\biband}{和}"
      write$ newline$
      "\providecommand{\bibetal}{等}"
      write$ newline$
    }
    'skip$
  if$
  "\providecommand{\natexlab}[1]{#1}"
  write$ newline$
  "\providecommand{\url}[1]{#1}"
  write$ newline$
  "\expandafter\ifx\csname urlstyle\endcsname\relax\else"
  write$ newline$
  "  \urlstyle{same}\fi"
  write$ newline$
  control.doi control.eprint or
    { "\expandafter\ifx\csname href\endcsname\relax"
      write$ newline$
      control.doi
        { "  \def\doi{\begingroup \urlstyle{same}\Url}"
          write$ newline$
          control.cstr
            { "  \def\cstr{\begingroup \urlstyle{same}\Url}"
              write$ newline$
            }
            'skip$
          if$
        }
        'skip$
      if$
      control.eprint
        { "  \def\eprint#1#2{#2}"
          write$ newline$
        }
        'skip$
      if$
      "\else"
      write$ newline$
      control.doi
        { "  \def\doi#1{\href{https://doi.org/#1}{\nolinkurl{#1}}}"
          write$ newline$
          control.cstr
            { "  \def\cstr#1{\href{https://cstr.cn/#1}{\nolinkurl{#1}}}"
              write$ newline$
            }
            'skip$
          if$
        }
        'skip$
      if$
      control.eprint
        { "  \let\eprint\href"
          write$ newline$
        }
        'skip$
      if$
      "\fi"
      write$ newline$
    }
    'skip$
  if$
}

FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}

READ

EXECUTE {init.state.consts}

EXECUTE {load.config}

ITERATE {control.pass}

EXECUTE {control.check}

EXECUTE {init.seq}

ITERATE {presort}

SORT

EXECUTE {initialize.longest.label}

ITERATE {forward.pass}

REVERSE {reverse.pass}

ITERATE {bib.sort.order}

SORT

EXECUTE {begin.bib}

ITERATE {call.type$}

EXECUTE {end.bib}
