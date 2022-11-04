:: https://mirrors.kernel.org/gnu/emacs/windows/emacs-28/emacs-28.2-installer.exe
set emacsd="%HOMEPATH%\AppData\Roaming\.emacs.d"

curl "https://mirrors.kernel.org/gnu/emacs/windows/emacs-28/emacs-28.2-installer.exe" --output-dir "~/Downloads/"

start /wait "~/Downloads/emacs-28.2-installer.exe"

cp ".\init.el" "%emacsd%\init.el"
cp ".\init.org" "%emcasd%\init.el"
