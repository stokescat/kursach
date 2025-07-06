\NeedsTeXFormat{LaTeX2e} \ProvidesClass{HSECourseW}
% Класс предоставляет оформление курсовой работы как того требует ВШЭ 
% ну или почти, лол )))))

% Базовый класс
\LoadClass[a4,12pt]{article}

% Пакеты для работы с русским языком
\RequirePackage[T2A]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[russian]{babel}
\RequirePackage{hyphenat} % Для правильных переносов

% Пакет для настройки полей по ГОСТ
\RequirePackage[
	left=3cm,    		% 30mm
	right=1cm,   		% 10mm
	top=2cm,     		% 20mm
	bottom=2cm,  	% 20mm
]{geometry}


% Настройки для агрессивных переносов
\tolerance=1
\emergencystretch=\maxdimen
\hyphenpenalty=10000
\hbadness=10000


% Полуторный межстрочный интервал (коэффициент 1.5)
\RequirePackage{setspace}
\onehalfspacing

% Отступ в абзаце
\RequirePackage{indentfirst}
\setlength{\parindent}{1.25cm} % ГОСТ 1.25 см

\RequirePackage{microtype}

% Настройка подписей рисунков и таблиц
\RequirePackage{caption}
\captionsetup{
	font={small, it},
	justification=centering,
	labelsep=period,
	skip=5pt
}
\captionsetup[table]{justification=raggedright, singlelinecheck=off}

% Подписи к рисункам
\addto\captionsrussian{\renewcommand{\figurename}{Рисунок}}
% Подписи к таблицам
\addto\captionsrussian{\renewcommand{\tablename}{Таблица}}


% Содержание
\renewcommand{\contentsname}{Содержание}
\setcounter{tocdepth}{2} % до subsection

% Переопределение \tableofcontents для пустого стиля страницы
\let\oldtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{
	\newpage
	\thispagestyle{empty}
	\oldtableofcontents
}

% Для корректного отображения URL-ссылок
\RequirePackage{url}

% Листинги
\RequirePackage{listings}
\RequirePackage[dvipsnames]{xcolor} % Для подсветки синтаксиса
\RequirePackage{float}





% ГОСТ-настройки листингов
\DeclareCaptionLabelFormat{gostcaption}{Листинг #2} % Формат "Листинг X"
\captionsetup[lstlisting]{
	labelformat=gostcaption,
	justification=centering,
	singlelinecheck=false,
	font={small,it},
	position=bottom,
	skip=5pt
}

\lstset{
	basicstyle=\ttfamily,
	escapeinside={(*@}{@*)}, % Определяем escape-последовательность
	% Другие настройки...
}

% Стиль кода по ГОСТ
\lstset{
	language=C,
	basicstyle=\ttfamily\small,
	moredelim=[is][\color{red}]{@-}{-@}, % Маркеры @-...-@ для git-нотации
	moredelim=[is][\color{ForestGreen}]{@+}{+@}, % Маркеры @+...+@ для git-нотации
	numbers=left,
	numberstyle=\tiny\color{gray},
	stepnumber=1,
	numbersep=8pt,
	frame=single,
	rulecolor=\color{black},
	tabsize=4,
	captionpos=b,
	breaklines=true,
	postbreak=\raisebox{0ex}[0ex][0ex]{\ensuremath{\color{red}\hookrightarrow\space}},
	extendedchars=true,
	inputencoding=utf8,
	showspaces=false,
	showstringspaces=false,
	backgroundcolor=\color{white},
	keywordstyle=\color{blue}\bfseries,
	commentstyle=\color{red},
	stringstyle=\color{red}
}


\RequirePackage{hyperref}

\hypersetup{
	colorlinks=true,
	linkcolor=blue,  
	urlcolor=blue,
	citecolor=blue
}



% Настройка заголовков
\RequirePackage{titlesec}
\titleformat{\section}{\normalsize\bfseries\centering}{\thesection}{1em}{}
\titleformat{\subsection}{\normalsize\bfseries}{\thesubsection}{1em}{}
\titlespacing*{\section}{0pt}{\baselineskip}{0.5\baselineskip}
\titlespacing*{\subsection}{0pt}{\baselineskip}{0.5\baselineskip}

% Убираем разрыв страницы после заголовков
\newcommand{\sectionbreak}{\clearpage}
\newcommand{\subsectionbreak}{}

% Redefine the Bibliography to deal with a bookmarking issues
\let\TEMPbibliography\bibliography
\renewcommand{\bibliography}[1]{
	\addcontentsline{toc}{section}{Литература}
	\TEMPbibliography{#1}
}

\newcommand{\TitleFaculty}{Факультет неизвестных наук}
\newcommand{\TitleProgram}{<<Очень крутая магистерская программа>>}
\newcommand{\TitleDepartment}{очень крутой департамент}
\newcommand{\TitleTheme}{Очень крутая тема курсовой работы}
\newcommand{\TitleGroupNum}{12}
\newcommand{\TitleAuthor}{Пупкин Василий Григорьевич}
\newcommand{\TitleSupervisor}{профессор, д.ф.-м.н., Доцент Д. Д.}
\newcommand{\TitleConsultant}{доцент, к.ф.-м.н., Консультант К. К.}
\newcommand{\TitleCity}{Москва}
\newcommand{\TitleYear}{2025}

% Титульная страница
\renewcommand{\titlepage}{
	\setcounter{page}{1}
	\thispagestyle{empty}
	\begin{center}
		\textbf{Федеральное государственное автономное образовательное учреждение \\ 
				высшего образования  «Национальный исследовательский университет \\
				«Высшая школа экономики» \\}
		\vspace{0.5cm}
		\textbf{\TitleFaculty}
		\begin{flushleft}
			\textbf{Магистерская программа}  \underline{\TitleProgram} \\
			\textbf{Департамент} \underline{\TitleDepartment} 
		\end{flushleft}
		
		\vspace{1.5cm}
		\textbf{КУРСОВАЯ РАБОТА}
		\vspace{1cm}
		
		На тему <<\TitleTheme>>
		
		\vspace{0.5cm}
		
		\begin{flushright}
			\begin{tabular}{c}
				\multicolumn{1}{l}{Студент группы №\underline{\TitleGroupNum}} \\
				\underline{\TitleAuthor}\\
				{\scriptsize (Ф. И. О.)} \\ \\
				
				\multicolumn{1}{l}{Руководитель КР}\\
				\underline{\TitleSupervisor}\\
				{\scriptsize (должность, звание, Ф. И. О.)} \\ \\
	
% Если консультант не нужен, закомментируйте		
% и прибавьте к последнему vpace еще 2 см
% Мне не хотелось усложнять шаблон, поэтому сорри
				\multicolumn{1}{l}{Консультант}\\
				\underline{\TitleConsultant}\\
				{\scriptsize (должность, звание, Ф. И. О.)}
% коментировать до сюда, прибавлять 2cm к vspace ниже
        \end{tabular}
	\end{flushright}	
	
		\vspace{2cm}
		\TitleCity, \TitleYear
		
	\end{center}

}



\newenvironment{abstractpage}{%
	\newpage
	\thispagestyle{empty} % Отключаем колонтитулы для страниц аннотации
	\begin{center}
		{\large \textbf{АННОТАЦИЯ}} \\
		\vspace{1cm}
		\TitleTheme \\
		\textit{\TitleAuthor}
	\end{center}
}{%

}
