:: https://mirrors.kernel.org/gnu/emacs/windows/emacs-28/emacs-28.2-installer.exe
set emacsd="%HOMEPATH%\AppData\Roaming\.emacs.d"

curl "https://mirrors.kernel.org/gnu/emacs/windows/emacs-28/emacs-28.2-installer.exe" --output-dir "%HOMEPATH%/Downloads/"

start /wait "%HOMEPATH%/Downloads/emacs-28.2-installer.exe"

cp "%HOMEPATH%\Documents\GitHub\dot\init.el" "%emacsd%\init.el"
cp "%HOMEPATH%\Documents\GitHub\dot\init.org" "%emacsd%\init.el"
