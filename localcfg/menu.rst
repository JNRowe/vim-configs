``localcfg/menu.vim``
=====================

We all know that the menu bar **steals** valuable screen real estate, but
occasionally it can be useful for accessing hierarchical information.  Therefore
we add a :ref:`toggle binding <gui-toggles>`, but also learn to use ``:emenu``
for even easier access.

.. seealso::

    * :doc:`autoloaded functions <../autoload/menu>` used in this file

.. tip::

    We’ll try to keep a speedy mnemonic for nested menus where we can:

    ======== =============================
    Key      File type
    ======== =============================
    :kbd:`c` Group’s main **c**\onfig file
    :kbd:`t` Group’s main **t**\heme file
    ======== =============================

For awesomewm_::

    call menu#define_menu('&awesome', {
    \   'r&c': g:xdg_config_dir . '/awesome/rc.moon',
    \   '&theme':  g:xdg_config_dir . '/awesome/themes/jnrowe/theme.moon',
    \ })

For dwm_::

    call menu#define_menu('&dwm', {
    \   '&config.h': g:xdg_config_dir . '/dwm/config.h',
    \   '&theme':  g:xdg_config_dir . '/dwm/themes/theme.h',
    \ })

For fontconfig_::

    call menu#define_menu('&fontconfig', [
    \   g:xdg_config_dir . '/fontconfig/fonts.conf',
    \   '~/.fonts.conf',
    \ ])

For |git|::

    call menu#define_menu('&git', {
    \   '&config': [
    \       g:xdg_config_dir . '/git/config',
    \       '~/.gitconfig',
    \   ],
    \   '&attributes': g:xdg_config_dir . '/git/attributes',
    \   '&mailmap': g:xdg_config_dir . '/git/mailmap',
    \ })

For `GTK+`_ including dconf_::

    call menu#define_menu('&GTK+', {
    \   'GTK+ &2': '~/.gtkrc-2.0',
    \   'GTK+ &3': g:xdg_config_dir . '/gtk-3.0/settings.ini',
    \   '&dconf': g:xdg_config_dir . '/dconf/user.ini',
    \ })

.. note::

    I generate :file:`$XDG_CONFIG_HOME/dconf/user` from an ``INI`` file using
    :command:`dconf load`, as it is more amenable to home directory version
    control.

For |ledger|::

    call menu#define_menu('&ledger', g:xdg_data_dir . '/ledger/ledger.org.gpg')

For mail tools; mailirproc_, mpop_, and msmtp_::

    call menu#define_menu('&mail', {
    \   'maildirpro&c': '~/.maildirproc/default.rc',
    \   'm&pop': '~/.mpoprc',
    \   'm&smtp': '~/.msmtprc',
    \ })

… oh, and neomutt_::

    call menu#define_menu('&neomutt', {
    \   '&config': g:xdg_config_dir . '/neomutt/neomuttrc',
    \   'colours': g:xdg_config_dir . '/neomutt/colour_defaults.rc',
    \   '&theme': g:xdg_config_dir . '/neomutt/colour_' . $TERM . '.rc',
    \ })

.. tip::

    I use `per-terminal themeing for neomutt`_ by adding ``source
    $my_cfgdir/colour_$TERM.rc`` to my main configuration file.  This makes it
    easier to set appropriate colours based on dark backgrounds and such.

For openbox_::

    call menu#define_menu('&openbox', {
    \   '&autostart': g:xdg_config_dir . '/openbox/autostart.sh',
    \   '&menu': g:xdg_config_dir . '/openbox/menu.xml',
    \   'r&c': g:xdg_config_dir . '/openbox/rc.xml',
    \ })

Python related tools; python_’s interactive configuration, flake8_, pip_, and
the amazing :pypi:`ptpython`::

    call menu#define_menu('&python', {
    \   '&config': [
    \       expand('$PYTHONSTARTUP'),
    \       g:xdg_config_dir . '/python/rc',
    \   ],
    \   '&flake8': g:xdg_config_dir . '/flake8',
    \   '&pip': g:xdg_config_dir . '/pip/pip.conf',
    \   'ptpytho&n': '~/.ptpython/config.py',
    \ })

For readline_ and its numerous dependents::

    call menu#define_menu('readline', [expand('$INPUTRC'), '~/.inputrc'])

.. tip::

    You can configure custom bindings for tools that use readline_ by using
    ``$if`` guards.  You can find examples for imv_ and bash_ in my `tips
    series`_.

For :pypi:`rdial`, and my habitual editing of `run wrappers`_::

    call menu#define_menu('&rdial', g:xdg_config_dir . '/rdial/config')

For |remind| and the excellent wyrd_ frontend to it::

    let s:remind_files = {}
    for s:fn in glob('~/.reminders.d/*', v:false, v:true)
        let s:remind_files[fnamemodify(s:fn, ':t:gs?\.?_?')] = s:fn
    endfor
    call menu#define_menu('r&emind',
    \   {
    \       '&config': '~/.reminders',
    \       '&wyrd': '~/.wyrdrc',
    \   },
    \   [s:remind_files, ]
    \ )

For taskwarrior_::

    call menu#define_menu('&taskwarrior', {
    \   '&alias': g:xdg_config_dir . '/taskwarrior/alias.rc',
    \   '&config': g:xdg_config_dir . '/taskwarrior/defaults.rc',
    \   '&theme': g:xdg_config_dir . '/taskwarrior/terminal.rc',
    \ })

For *some* editor::

    call menu#define_menu('&vim', {
    \   '&dein': '~/.vim/dein.rst',
    \   'r&c': '~/.vim/vimrc.rst',
    \   'rc-&local': '~/.vim/localcfg/' . hostname() . '.vim',
    \ })

For wget_::

    call menu#define_menu('&wget', g:xdg_config_dir . '/wget/config')

For X.org_’s main user configuration files::

    let s:xorg_files = {
    \   'X&modmap': '~/.Xmodmap',
    \   'X&resources': '~/.Xresources',
    \   'Xinitr&c': '~/.xinitrc',
    \ }
    for s:fn in glob('~/.xinitrc.d/*', v:false, v:true)
        let s:xorg_files[fnamemodify(s:fn, ':t:gs?\.?_?')] = s:fn
    endfor
    call menu#define_menu('&xorg', s:xorg_files)

For |zsh|::

    call menu#define_menu('&zsh', {
    \   'co&mpletions': '~/.no_my_zsh/completion/',
    \   'confi&gs': '~/.no_my_zsh/config/',
    \   '&plugins': '~/.no_my_zsh/plugin/',
    \   '&theme': '~/.no_my_zsh/config/prompt.zsh',
    \   'zshr&c': '~/.no_my_zsh/zshrc',
    \ })

.. _awesomewm: https://awesomewm.org/
.. _dwm: https://dwm.suckless.org/
.. _fontconfig: https://fontconfig.org/
.. _GTK+: https://www.gtk.org/
.. _dconf: https://wiki.gnome.org/action/show/Projects/dconf
.. _mailirproc: http://joel.rosdahl.net/maildirproc/
.. _mpop: https://marlam.de/mpop/
.. _msmtp: https://marlam.de/msmtp/
.. _neomutt: https://neomutt.org/
.. _per-terminal themeing for neomutt:
    https://jnrowe.github.io/articles/tips/Theming_mutt.html
.. _openbox: http://openbox.org/
.. _python: https://www.python.org/
.. _flake8: https://gitlab.com/pycqa/flake8/
.. _pip: https://pip.pypa.io/
.. _readline: http://cnswww.cns.cwru.edu/php/chet/readline/rltop.html
.. _imv: https://jnrowe.github.io/articles/tips/readline_rename_imv.html
.. _bash: https://jnrowe.github.io/articles/tips/Beyond_tab_completion.html
.. _tips series: https://jnrowe.github.io/articles/tips/
.. _run wrappers:
    https://rdial.readthedocs.io/en/latest/config.html#run-wrappers-section
.. _wyrd: http://pessimization.com/software/wyrd/
.. _taskwarrior: https://taskwarrior.org/
.. _wget: https://www.gnu.org/software/wget/
.. _X.org: https://www.x.org/

.. spelling::

    onfig
    heme
