# ubumirror-docker

This allows you to use Ubuntu's mirroring tools inside a Docker container.

_**Note**: Running any of the commands here will cause a lot of data transfer._

## Usage

Each mirror is likely to have different requirements, and so it's assumed
you're likely to build your own image and customise the provided configuration
file. If you modify the configuration file as desired, it'll be imported into
the image during the build process.

However, by default it's configured to fetch `i386`, `amd64` images and to use
the default directories (internally, you'll need to mount a data volume).

By default, all output is written to log files. This is output to use `logs` in
the current working directory, you'll want to tail those (`tail -f
logs/filename.log`).

### Building

Building is pretty standard:

```sh
docker build -t nickcharlton/ubumirror .
```

### Running

As an example, using the `uburelease` command:

```sh
docker run \
    -v $(pwd)/releases:/srv/mirror/ubuntu-releases \
    -v $(pwd)/logs:/var/log/ubumirror \
    -t nickcharlton/ubumirror /usr/bin/uburelease
```

You'll want to adjust the mounted volumes according to where the data should be
output to, probably a different one per tool. Check the config file for the
assumed mount point.

## Author

Copyright (c) 2015 Nick Charlton. MIT Licensed.
