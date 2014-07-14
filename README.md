Self Testable Document Processor
----------------------------------------

[![Travis](https://travis-ci.org/unakatsuo/run-readme.md.svg?branch=master)](https://travis-ci.org/unakatsuo/run-readme.md)


``run-readme.sh`` executes the [Fenced code
blocks](https://help.github.com/articles/github-flavored-markdown#fenced-code-blocks)
 text written in the Github fravored markdown.

Syntax:

```shell
run-readme.sh README.md
```

The only code blocks with ``shell`` syntax marker are executed:

```
```shell
echo "RUN"
```
```

```shell
echo "RUN"
```

To skip running ``shell`` code blocks, you can put ``## EXAPMLE`` at
the line begging.

```
```shell
## EXAMPLE
/bin/unknown_command
```
```

```shell
## EXAMPLE
/bin/unknown_command
```
