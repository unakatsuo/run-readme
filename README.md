Self Testable Document Processor
----------------------------------------

[![Travis](https://travis-ci.org/unakatsuo/run-readme.svg?branch=master)](https://travis-ci.org/unakatsuo/run-readme)


``run-readme.sh`` executes the [Fenced code
blocks](https://help.github.com/articles/github-flavored-markdown#fenced-code-blocks)
 text written in the Github flavored markdown.

### Synopsis:

```
run-readme.sh README.md
```

### Dependency

```shell
which mktemp awk
```

### Writing testable document in Markdown format

The only code blocks with ``shell`` syntax marker are executed.

```
    ```shell
    echo "RUN"
    ```
```

```shell
echo "RUN"
```

To skip running ``shell`` code blocks, you can put ``Example:`` at
the line begging.

```
    ```shell
    Example:
    /bin/unknown_command
    ```
```

```shell
Example:
/bin/unknown_command
```

### To incorporate with your project

You can put the line to your test/CI script.

```
curl -sSL https://raw.githubusercontent.com/unakatsuo/run-readme/master/run-readme.sh | bash -s README.md
```

Or if you are using **travis-ci**, add following line to ``.travis.yml``.

```yaml
script:
  - curl -sSL https://raw.githubusercontent.com/unakatsuo/run-readme/master/run-readme.sh | bash -s README.md
```
