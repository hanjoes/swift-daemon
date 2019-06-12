# SwiftDaemon

Daemonize a given routine.

__"fork"__ is "hidden" from user by Swift, I stole a piece of code from project [Curassow](https://github.com/kylef-archive/Curassow) to re-surface the "fork" system call in Swift.

# Usage

```Swift
import SwiftDaemon

SwiftDaemon.daemonize(inDir: "/tmp") {
  let fd = fopen("SwiftDaemonTest.log", "w")
  defer { fclose(fd) }
  for _ in 1...10 {
    usleep(1000000)
    let content = "Test\n"
    fwrite(content, 1, content.count, fd)
    fflush(fd)
  }
}
```
