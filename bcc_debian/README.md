## bcc_debian

I made this because I could not get the instructions to build a debian package
for bcc to work.

### Building

This assumes you are running a kernel that is available in the the
`debian/buster` repo. It defaults kernel headers to the kernel version you are
running (discovered via `uname -r`), you can override this with the
KERNEL_VERSION environment variable, e.g:

`KERNEL_VERSION=4.19.0-4-amd64 make build`

```bash
$> make build
```

### Running

```bash
$> make shell
```

### Caveats

If you have [kernel lockdown](https://lwn.net/Articles/750730/) enabled, you
will not be able to run bcc, as it disables BPF. [If you have secure boot enabled
you invariably have a locked down
kernel](https://mjg59.dreamwidth.org/50577.html), so you need to disable
secure-boot in the bios to do any BPF.
