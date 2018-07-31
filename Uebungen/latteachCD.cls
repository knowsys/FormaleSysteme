% Author: Felix Distel (felix@tcs.inf.tu-dresden.de)
% Last Update: 2011/10/12
% --- Identifikation ---
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{latteachCD}[2010/04/14 TU Dresden LAT class for teaching
related documents, TU Dresden CD Style]


% --- Setzt auf tudform-Klasse auf ---
\LoadClass[11pt,twoside]{tudform}


% --- Benoetigte Pakete ---
\RequirePackage{amsfonts}	% fuer Makros fuer natuerliche Zahlen, etc.
\RequirePackage{parskip}
\RequirePackage{ifthen}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[ngerman]{babel}


% --- Option fuer deutsche Sprache deklarieren ---
\DeclareOption{german}{
  \renewcommand{\@notice}{\bfseries{Hinweis}}
  \renewcommand{\@exercise}{\bfseries{Aufgabe}}
  \renewcommand{\@faculty}{Fakultät Informatik}
  \renewcommand{\@institute}{Institut für Theoretische Informatik}
  \renewcommand{\@chair}{Lehrstuhl für Automatentheorie}
}


% --- Sprachspezifika ---
\newcommand{\@notice}{Notice}
\newcommand{\@exercise}{Exercise}
\newcommand{\@faculty}{Faculty of Computer Science}
\newcommand{\@institute}{Institute of Theoretical Computer Science}
\newcommand{\@chair}{Chair of Automata Theory}
\ProcessOptions\relax


% --- Mathematische Makros ---
\newcommand{\N}{\ensuremath{\mathbb{N}}}
\newcommand{\R}{\ensuremath{\mathbb{R}}}
%\renewcommand{\epsilon}{\varepsilon}
%\renewcommand{\phi}{\varphi}
%\renewcommand{\rho}{\varrho}
%\renewcommand{\theta}{\vartheta}


% --- Neue Umgebungen ---
\newcounter{exercise}			% Exercise Umgebung
\newenvironment{exercise}[1][]
	{\vskip+3ex
	\stepcounter{exercise}{\textbf{\@exercise~\theexercise}}
	\ifthenelse{\equal{#1}{}}{}{{\bfseries{(#1)}}}\\[1ex]
	}
	{\vspace{2ex}}
\newcommand{\notice}[1]{
	\vspace*{0.1cm}

	\rule{\textwidth}{.5pt}

	{\bfseries{\@notice}}\\[0.2cm]

	#1\\

	\rule{\textwidth}{.5pt}
	\vspace*{0.1cm}
	}


% --- Kopf des Dokuments ---
\AtBeginDocument{
  \einrichtung{\@faculty}
  \institut{\@institute}
  \professur{\@chair}
}
\newcommand{\@term}{~}
\newcommand{\@course}{~}
\newcommand{\term}[1]{\renewcommand{\@term}{#1}}
\newcommand{\course}[1]{\renewcommand{\@course}{#1}}
\renewcommand{\maketitle}{%
  {\bfseries\Large \@course}\\[1ex]
  {\textbf{\@title}}\\[1ex]
  \@author\\
  \@term\\[5ex]%
  }


% --- Zaehler setzen ---
\renewcommand{\theenumi}{\alph{enumi}}%
\renewcommand{\labelenumi}{\theenumi)}%
\setcounter{exercise}{0}%
\setcounter{page}{1}%


% --- Veraenderungen am Layout ---
%\setlength{\parindent}{0pt}
%\setlength{\parskip}{\medskipamount}
%\setlength{\tabcolsep}{6pt}
%\setlength{\doublerulesep}{6pt}
%\renewcommand{\fps@figure}{htbp}	% Default fuer Positionierung von
%\renewcommand{\fps@table}{htbp}		% Abbildungen und Tabellen veraendern
%\renewcommand{\arraystretch}{1.2}
%\sloppy

% --- Let's redefine some fonts ---
% Super-hackish …
%\DeclareFixedFont{\univLightIX}{T1}{aun}{l}{n}{9}
%\DeclareFixedFont{\univBoldIX}{T1}{aun}{b}{n}{9}
%\DeclareFixedFont{\univLightXI}{T1}{aun}{l}{n}{11}
%\DeclareFixedFont{\univLightObliqueXI}{T1}{aun}{l}{sl}{11}
%\DeclareFixedFont{\univBoldXI}{T1}{aun}{b}{n}{11}
