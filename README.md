#migrate
Migrate installed software from an old machine (source) to a new one (target)

- Find all the extra repositories on the source machine and append them at a file with name "repos"
- Run make_installed.sh on the source computer
- Move "installed" and "repos" at the target computer
- Run migrate.sh at the target machine to get all the installed applications of source machine.
