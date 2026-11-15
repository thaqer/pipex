# pipex

A 42 Amman project that reproduces a shell pipe. This command:

```sh
./pipex infile "cmd1" "cmd2" outfile
```

behaves like:

```sh
< infile cmd1 | cmd2 > outfile
```

The program forks one child per command, connects them with `pipe()` and `dup2()`, finds each command in `PATH`, and runs it with `execve()`.

## Usage

```sh
make
./pipex infile "grep apple" "wc -l" outfile
cat outfile
```

Like the shell, it exits with the second command's status, or `127` when that command is not found. If `infile` cannot be opened, the error is printed and the second command still runs on empty input.

Arguments are split on spaces only, so quoted arguments such as `"grep 'a b'"` are not supported.

## Files

| File | Contents |
| --- | --- |
| `pipex.c` | `main`, file opening, `PATH` lookup, waiting for the children |
| `child_process.c` | forking and running each command |
| `end_process.c` | error handling and cleanup |
| `ft_libft/` | my [libft](https://github.com/thaqer/libft) |

## Author

[thaqer](https://github.com/thaqer), 42 Amman. Originally kept in [42amman_journey](https://github.com/thaqer/42amman_journey).
