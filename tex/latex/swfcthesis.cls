% The swfcthesis class is for producing senior year theses and dissertations
% that meet the SWFU requirements.
\ProvidesClass{swfcthesis}[2016/06/10 SWFU Theses and Dissertations]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{noacknowlegments}{% Allow opt-out on acknowledgments
  \renewcommand{\acknowledgmentspage}{}
}

% pass unknown options to book
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax

\LoadClass[a4paper,12pt,oneside]{book}

\RequirePackage{ifxetex} % This class can only be processed with XeTeX

%\RequirePackage[margin=2.5cm]{geometry}
\RequirePackage[top=3cm,bottom=2.5cm,left=3cm,right=2.5cm,
nomarginpar,headheight=15pt, % to avoid "headheight too small"
%showframe,showcrop,
]{geometry}
\RequirePackage{indentfirst}
\RequirePackage{tabu,longtable,multicol,multirow,array}

% graphicx
\RequirePackage[xetex]{graphicx} % before xltxtra
\graphicspath{{./figs/}{../figs/}{./}{../}} %mind the trailing “/”

% titlesec
\RequirePackage{titlesec} % \titleformat, \titlespacing
\titleformat{\chapter}{\centering\LARGE\bfseries}{\thechapter}{1em}{}
\titlespacing{\chapter}{0pt}{*0}{*4}

\RequirePackage[bottom]{footmisc} % stick footnote at bottom of page

% fancyhdr
\RequirePackage{fancyhdr}
\fancypagestyle{plain}{%
  \fancyhf{} % clear all header and footer fields
  \fancyfoot[C]{\fontsize{8}{8}\selectfont -- \thepage\ --}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}
\fancyhf{}
\fancyfoot[C]{\fontsize{8}{8}\selectfont -- \thepage\ --}
\fancyhead[C]{\slshape \leftmark}

\RequirePackage{enumitem} % \setlist
\setlist{nosep} % kills all vertical spacing

\RequirePackage[backend=biber,url=false,hyperref=true,
    doi=false,isbn=false]{biblatex}
\renewcommand*{\bibfont}{\small} % 11pt

\DeclareCiteCommand{\supercite}[\mkbibsuperscript]
{\iffieldundef{prenote}
  {}
  {\BibliographyWarning{Ignoring prenote argument}}%
  \iffieldundef{postnote}
  {}
  {\BibliographyWarning{Ignoring postnote argument}}}
{\usebibmacro{citeindex}%
  \bibopenbracket\usebibmacro{cite}\bibclosebracket}
{\supercitedelim}
{}
\let\cite=\supercite

% caption
\RequirePackage{caption} % \captionsetup
\RequirePackage{subcaption}
\captionsetup{labelsep=quad}

\RequirePackage[xetex,bookmarksnumbered,pdfpagelabels=true,
%colorlinks=true,linkcolor=black,citecolor=black,urlcolor=black,
plainpages=false]{hyperref}

\RequirePackage{xcolor}

% before xunicode!
\RequirePackage{amsmath,amsfonts,amssymb,latexsym,marvosym,pifont}
\RequirePackage[tt=false]{libertine} % keyboard symbol

\RequirePackage{xltxtra} %fontspec,xunicode are loaded here.
\RequirePackage[CJKmath=true,AutoFakeSlant=true]{xeCJK} % slant header

% \singlespacing, \onehalfspacing, \doublespacing
\RequirePackage[doublespacing]{setspace}
\renewcommand{\doublespacing}{\setstretch{1.6}}

%%% Obsolete! setspace package is perfered to setting baselinestretch directly.
% \newcommand{\normalspace}
%     {\par\renewcommand{\baselinestretch}{1}\small\normalsize\par}
% \newcommand{\singlespace}
%     {\par\renewcommand{\baselinestretch}{1.2}\small\normalsize\par}
% \newcommand{\doublespace}% 30 lines per page
%     {\par\renewcommand{\baselinestretch}{1.6}\small\normalsize\par}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont{DejaVu Serif}
\setsansfont{DejaVu Sans}
\setCJKmainfont[BoldFont={WenQuanYi Micro Hei}]{SimSun}
\setCJKsansfont[BoldFont={WenQuanYi Micro Hei}]{SimSun}
\setCJKmonofont{WenQuanYi Micro Hei Mono}
\setCJKfamilyfont{hei}{WenQuanYi Micro Hei}
\setCJKfamilyfont{song}{SimSun}
\XeTeXlinebreaklocale "zh"
\XeTeXlinebreakskip = 0pt plus 1pt

\pagenumbering{arabic}
\renewcommand{\headrulewidth}{.4pt}
\urlstyle{rm}
\raggedbottom

\pagestyle{fancy}
% Must go after the first call of \pagestyle{fancy} !!!
\renewcommand{\chaptermark}[1]{\markboth{\thechapter \ \ #1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection \ \ #1}}
\newcommand{\Appendix}[1]{%
  \renewcommand{\chaptermark}[1]%
      {\markboth{附录\ \thechapter \ \ #1}{}}
  \titleformat{\chapter}%
      {\centering\LARGE\bfseries}{附录\ \thechapter}{1em}{}
  \appendix
}

% set caption label style to, e.g. 3-2.
\renewcommand{\thefigure}{\thechapter{}-\arabic{figure}}
\renewcommand{\thetable}{\thechapter{}-\arabic{table}}
\renewcommand{\thesubfigure}{\thechapter{}-\arabic{subfigure}}
\renewcommand{\thesubtable}{\thechapter{}-\arabic{subtable}}

% not used. use \makebox instead.
\newcommand{\ziju}[1]{\renewcommand{\CJKglue}{\hskip #1}}

%\renewcommand{\bibname}{参考文献} % only for bibtex. Obsolete!
\renewcommand{\contentsname}{目\hspace{1em}录}
\renewcommand{\listfigurename}{插图目录}
\renewcommand{\listtablename}{表格目录}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}

% Variables to hold the text fields for the preliminary pages
\newcommand{\Title}[1]{\gdef\SWFCField@Title{#1}}
\newcommand{\enTitle}[1]{\gdef\SWFCField@enTitle{#1}}
\newcommand{\Author}[1]{\gdef\SWFCField@Author{#1}}
\newcommand{\enAuthor}[1]{\gdef\SWFCField@enAuthor{#1}}
\newcommand{\Docname}[1]{\gdef\SWFCField@Docname{#1}}
\newcommand{\Degree}[1]{\gdef\SWFCField@Degree{#1}}
\newcommand{\Advisor}[1]{\gdef\SWFCField@Advisor{#1}}
\newcommand{\AdvisorTitle}[1]{\gdef\SWFCField@AdvisorTitle{#1}}
\newcommand{\AdvisorInfo}[1]{\gdef\SWFCField@AdvisorInfo{#1}}
\newcommand{\Month}[1]{\gdef\SWFCField@Month{#1}}
\newcommand{\Year}[1]{\gdef\SWFCField@Year{#1}}
\newcommand{\Abstract}[1]{\gdef\SWFCField@Abstract{#1}}
\newcommand{\enAbstract}[1]{\gdef\SWFCField@enAbstract{#1}}
\newcommand{\Keywords}[1]{\gdef\SWFCField@Keywords{#1}}
\newcommand{\enKeywords}[1]{\gdef\SWFCField@enKeywords{#1}}
\newcommand{\Acknowledgments}[1]{\gdef\SWFCField@Acknowledgments{#1}}
\newcommand{\School}[1]{\gdef\SWFCField@School{#1}}
\newcommand{\enSchool}[1]{\gdef\SWFCField@enSchool{#1}}
\newcommand{\Univ}[1]{\gdef\SWFCField@Univ{#1}}
\newcommand{\enUniv}[1]{\gdef\SWFCField@enUniv{#1}}
\newcommand{\Subject}[1]{\gdef\SWFCField@Subject{#1}}

\newcommand{\SWFCtitlepage}{% Title page layout
  \thispagestyle{empty}
  \begin{center}
    \makebox[14.7em][s]{{\huge\SWFCField@Univ}}\\[5mm]
    \makebox[25.75em][s]{\Huge\textbf{\SWFCField@Docname}}\\[5mm]
    \makebox[12em][s]{\hspace{.5em}\LARGE（\SWFCField@Year\,届）}\\[60pt]
    \begin{minipage}{.8\linewidth}
      \begin{Large}
        \extrarowsep=^8mm
        \extrarowsep=_-7pt
        \begin{tabu}spread\textwidth{@{}X[r]X[3.3,c]@{}}
          \textbf{题\hspace{2em}目：}&\SWFCField@Title\\\tabucline{2-2}
          \textbf{分院系部：} &\SWFCField@School\\\tabucline{2-2}
          \textbf{专\hspace{2em}业：}&\SWFCField@Subject\\\tabucline{2-2}
          \textbf{姓\hspace{2em}名：}&\SWFCField@Author\\\tabucline{2-2}
          \textbf{导师姓名：} &\SWFCField@Advisor\\\tabucline{2-2}
          \textbf{导师职称：} &\SWFCField@AdvisorTitle\\\tabucline{2-2}
        \end{tabu}
      \end{Large}
    \end{minipage}
    \vfill
    {\Large\textbf{\SWFCField@Year\ 年\ \SWFCField@Month\ 月}}\\[1cm]
  \end{center}
  \clearpage
}

\newcommand{\abstractpage}{% Abstract page
  \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{摘要}{bm:cnAbstract}
  \thispagestyle{empty}
  \begin{center}
    {\singlespacing \Large{\textbf{\SWFCField@Title}}}\\[5mm]
    \large{\SWFCField@Author}\\
    \large{（\SWFCField@Univ\,\SWFCField@School，云南\,昆明\,650224）}
  \end{center}
  \vskip 3ex
  \noindent \textbf{摘\hspace{1em}要：}~\SWFCField@Abstract
  \vskip 2ex
  \noindent \textbf{关键词：}~\SWFCField@Keywords
  \clearpage
}

\newcommand{\enabstractpage}{% English abstract page  
  \providecommand\pdfbookmark[3][]{}%
  \pdfbookmark[0]{Abstract}{bm:Abstract}
  \thispagestyle{empty}
  \begin{center}
    {\singlespacing {\Large\textbf{\SWFCField@enTitle}}}\\[5mm]
    {\large\SWFCField@enAuthor}\\[3mm]
    {\singlespacing {\large\SWFCField@enSchool\\\SWFCField@enUniv\\%
        Kunming 650224, Yunnan, China}}
  \end{center}
  \vskip 2em
  \noindent\textbf{Abstract: }~\SWFCField@enAbstract
  \vskip 1em
  \noindent\textbf{Key words: }~\SWFCField@enKeywords
  \clearpage
}

\newcommand{\acknowledgmentspage}{% Acknowledgments page  
  \phantomsection
  \addcontentsline{toc}{chapter}{致\hspace{1em}谢}
  \chapter*{致\hspace{1em}谢}
  \SWFCField@Acknowledgments
}

\newcommand{\advisorinfopage}{% Advisor info page
  \phantomsection
  \addcontentsline{toc}{chapter}{指导教师简介}
  \chapter*{指导教师简介}
  \SWFCField@AdvisorInfo
  \clearpage
}

\newcommand{\makepreliminarypages}{% preliminary pages
  \SWFCtitlepage
  \doublespacing % global line spacing
  \abstractpage
  \enabstractpage
}

\RequirePackage{minted} % minted has to be loaded at last!!!
\usemintedstyle{bw}
\renewcommand{\listingscaption}{程序} % used by minted
\renewcommand{\listoflistingscaption}{程序目录}

\setlength{\parindent}{2em}

% Initialize the variables to their default values
\Title{金庸笔下武功详解}
\Author{周伯通}
\Docname{本科毕业（设计）论文}
\Advisor{王重阳}
\AdvisorTitle{祖\hspace{1em}师}

\AdvisorInfo{王重陽\footnote{参见维基百科-王重阳}（1113年1月13日－1170年），
  原名中孚，字允卿，又名世雄，字德威，入道后改名喆，字知明，道号重阳子，故称王重阳。
  北宋末京兆咸阳（今陕西咸阳）大魏村人。中國道教分支全真道的始創人，
  后被尊为道教的北五祖之一。他有七位出名的弟子，在道教历史上称为北七真。}

\Month{六}
\Year{一二三七}
\Univ{中华武林大学}
\School{全真玄门正宗学院}
\Subject{打架斗殴专业}

\Abstract{中國武術\footnote{参见维基百科 - 中国武术}
  是中國传统文化的重要一環。兩廣人稱為功夫，民國初期簡稱為國術
  （後為中央國術館正式採用之名稱）；被視為中國文化之精粹，故又稱國粹。
  由於歷史發展和地域分佈關係，衍生出不同門派。
  中國武術主要內容包括搏擊技巧、格鬥手法、攻防策略和武器使用等技術。
  當中又分為理論和實踐兩個範疇。從實踐中帶來了有關體育、健身、和中國
  武術獨有之氣功、及養生等重要功能。理論中帶來了不少前人之經驗和拳譜記錄。
  因此，它体现中华民族对攻防技击及策略上的理解。加上經驗上積累，
  以自立、自強、健體養生為目標的自我運作，
  練習套路时顯示出身體動作之優美姿態。
  中國武術往往帶有思想冶鍊的文化特徵及人文哲學的特色、意義，
  對現今中國的大眾文化有著深遠影響\cite{wushucn}。} 

\Keywords{金庸，武术，一陽指，双手互搏，空明拳，七傷拳，吸星大法，
  葵花宝典，九陰真經，九陽真經，天山六陽掌，天羅地網勢，蛤蟆功，倚天屠龍功，
  弹指神通，先天功，打狗棒法，全真剑法，摧心掌，降龍十八掌，六脈神劍，
  火焰刀，黯然銷魂掌，龍爪擒拿手，兰花拂穴手，龍象般若掌，劈空掌，
  玉女素心剑法，北冥神功，碧海潮生曲}

\Acknowledgments{感谢师兄王重阳传我全真玄门正宗功夫，感谢段皇爷不杀之恩，
  感谢刘贵妃不怨旧恶，感谢桃花岛主黄老邪助我练就空明拳和双手互搏之术，
  感谢郭靖兄弟让我看《九阴真经》，感谢小龙女教我驭蜂之术。}

% The followings are for the English Abstract.
\enTitle{Jin Yong's Chinese Martial Arts Illustrated}
\enAuthor{Zhou Botong}
\enUniv{Chinese Kungfu University}
\enSchool{School of Taoism}
\enAbstract{Chinese martial
  arts\footnote{Wikipedia - Chinese martial arts}, also referred to by
  the Mandarin Chinese term wushu and popularly as kung fu, are a number
  of fighting styles that have developed over the centuries in China.
  These fighting styles are often classified according to common traits,
  identified as "families", "sects" or "schools" of martial arts.
  Examples of such traits include physical exercises involving animal
  mimicry, or training methods inspired by Chinese philosophies,
  religions and legends. Styles which focus on qi manipulation are
  labeled as internal, while others concentrate on improving muscle and
  cardiovascular fitness and are labeled external. Geographical
  association, as in northern and southern, is another popular method
  of categorization\cite{wushu}.}

\enKeywords{Jin Yong, Chinese martial arts, Kungfu}